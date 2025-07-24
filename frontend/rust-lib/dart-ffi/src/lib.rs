// dart-ffi/lib.rs
// Dart FFI interface layer - only c bindings
// 2025-07-24 garfield

mod http_bridge;

use std::ffi::c_char;
use http_bridge::handle_login;
use error_lib::free_ffi_string;

const BASE_URL: &str = "https://dev-admin.reengki.com";

#[no_mangle]
pub extern "C" fn login(request_bytes: *const u8, request_len: usize) -> *mut c_char {
    let request_data = unsafe { std::slice::from_raw_parts(request_bytes, request_len) };
    handle_login(request_data, BASE_URL)
}

#[no_mangle]
pub extern "C" fn free_string(ptr: *mut c_char) {
    free_ffi_string(ptr);
}
