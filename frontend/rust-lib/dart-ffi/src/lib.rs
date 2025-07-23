use std::ffi::{CStr, CString};
use std::os::raw::c_char;
use tokio::runtime::Runtime;
use prost::Message;

use http_lib::HttpClient;
use proto_lib::{LoginRequest, LoginResponse};

#[no_mangle]
pub extern "C" fn login(request_bytes: *const u8, request_len: usize) -> *mut c_char {
    if request_bytes.is_null() || request_len == 0 {
        return std::ptr::null_mut();
    }

    let request_data = unsafe {
        std::slice::from_raw_parts(request_bytes, request_len)
    };

    let login_request = match LoginRequest::decode(request_data) {
        Ok(req) => req,
        Err(_) => return std::ptr::null_mut(),
    };

    let rt = match Runtime::new() {
        Ok(rt) => rt,
        Err(_) => return std::ptr::null_mut(),
    };

    let result = rt.block_on(async {
        let http_client = HttpClient::new();
        
        match http_client.login(login_request).await {
            Ok(response) => {
                let mut buf = Vec::new();
                match response.encode(&mut buf) {
                    Ok(_) => Some(buf),
                    Err(_) => None,
                }
            }
            Err(_) => None,
        }
    });

    match result {
        Some(response_bytes) => {
            // Convert Vec<u8> to base64 string for easier transport
            let base64_string = base64::encode(&response_bytes);
            match CString::new(base64_string) {
                Ok(c_string) => c_string.into_raw(),
                Err(_) => std::ptr::null_mut(),
            }
        }
        None => std::ptr::null_mut(),
    }
}

#[no_mangle]
pub extern "C" fn free_string(ptr: *mut c_char) {
    if !ptr.is_null() {
        unsafe {
            let _ = CString::from_raw(ptr);
        }
    }
}