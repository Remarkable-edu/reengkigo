use std::ffi::{c_char, CStr, CString};

#[no_mangle]
pub extern "C" fn simple_add(a: f64, b: f64) -> f64 {
    a + b
}

#[no_mangle]
pub extern "C" fn simple_multiply(a: f64, b: f64) -> f64 {
    a * b
}

#[no_mangle]
pub extern "C" fn simple_greet(name: *const c_char) -> *mut c_char {
    let c_str = unsafe { CStr::from_ptr(name) };
    let recipient = match c_str.to_str() {
        Ok(s) => s,
        Err(_) => "World",
    };
    let greeting = format!("Hello, {}!", recipient);
    let c_string = CString::new(greeting).expect("CString::new failed");
    c_string.into_raw()
}

#[no_mangle]
pub extern "C" fn free_string(s: *mut c_char) {
    unsafe {
        if s.is_null() {
            return;
        }
        let _ = CString::from_raw(s);
    }
}

#[no_mangle]
pub extern "C" fn test_greet(name: *const c_char) -> *mut c_char {
    let c_str = unsafe { CStr::from_ptr(name) };
    let recipient = match c_str.to_str() {
        Ok(s) => s,
        Err(_) => "오류",
    };
    let greeting = format!("뭘 봐, {}!", recipient);
    let c_string = CString::new(greeting).expect("CString::new failed");
    c_string.into_raw()
}