// http_bridge.rs
// http-lib bridge Layer 
// 2025-07-24 garfield

use std::ffi::c_char;
use prost::Message;
use http_lib::{login_sync, LoginRequest};
use error_lib::{create_ffi_protobuf_response, create_ffi_error_from_string, AppError};

pub fn handle_login(request_bytes: &[u8], base_url: &str) -> *mut c_char {
    // 입력 데이터 파싱
    let login_request = match LoginRequest::decode(request_bytes) {
        Ok(req) => req,
        Err(e) => {
            let app_error = AppError::from(e);
            return create_ffi_error_from_string(&app_error.to_string());
        }
    };

    // http-lib을 통한 API 호출 - 이제 직접 LoginResponse 반환
    let login_response = login_sync(base_url.to_string(), login_request);

    // LoginResponse를 그대로 FFI로 반환
    create_ffi_protobuf_response(&login_response)
}
