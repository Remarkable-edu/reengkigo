// ffi.rs
// FFI 인터페이스용 응답 포매팅 함수들

use std::ffi::{c_char, CString};
use prost::Message;
use base64::{Engine as _, engine::general_purpose};
use crate::AppError;

/// FFI에서 사용할 결과 타입
pub type FfiResult<T> = Result<T, AppError>;

/// Protobuf 메시지를 Base64로 인코딩
pub fn encode_protobuf_to_base64<T: Message>(data: &T) -> Result<String, AppError> {
    let encoded_data = data.encode_to_vec();
    if encoded_data.is_empty() {
        return Err(AppError::Serialization { 
            message: "Failed to encode protobuf message".to_string() 
        });
    }
    Ok(general_purpose::STANDARD.encode(encoded_data))
}

// Note: 이 함수들은 proto-lib에서 생성된 타입들을 사용해야 하므로,
// 실제 구현은 사용하는 곳에서 해야 합니다.
// 여기서는 제네릭 헬퍼 함수들만 제공합니다.
/// Protobuf ApiResponse를 사용한 FFI 성공 응답 생성
pub fn create_ffi_protobuf_response<T: Message>(api_response: &T) -> *mut c_char {
    match encode_protobuf_to_base64(api_response) {
        Ok(base64_string) => {
            let c_string = CString::new(base64_string)
                .unwrap_or_else(|_| CString::new("Encoding error").unwrap());
            c_string.into_raw()
        }
        Err(_) => {
            let c_string = CString::new("Failed to encode protobuf response")
                .unwrap_or_else(|_| CString::new("Encoding error").unwrap());
            c_string.into_raw()
        }
    }
}

/// 단순 에러 메시지 응답 생성 (레거시 호환성용)
pub fn create_ffi_simple_error_response(error: &AppError) -> *mut c_char {
    let error_message = format!("Error [{}]: {}", error.error_code(), error.user_message());
    let c_string = CString::new(error_message)
        .unwrap_or_else(|_| CString::new("Encoding error").unwrap());
    c_string.into_raw()
}

/// 문자열 에러 메시지로 FFI 에러 응답 생성
pub fn create_ffi_error_from_string(message: &str) -> *mut c_char {
    let error = AppError::Unknown { 
        message: message.to_string() 
    };
    create_ffi_simple_error_response(&error)
}

// LegacyApiResponse 제거됨 - 모든 응답은 proto LoginResponse 사용

/// Result를 FFI 응답으로 변환 (Protobuf 데이터용)
pub fn result_to_ffi<T: Message>(result: Result<T, AppError>) -> *mut c_char {
    match result {
        Ok(data) => create_ffi_protobuf_response(&data),
        Err(error) => create_ffi_simple_error_response(&error),
    }
}

/// 문자열을 FFI로 변환 (일반 데이터용)
pub fn string_to_ffi(text: &str) -> *mut c_char {
    let c_string = CString::new(text)
        .unwrap_or_else(|_| CString::new("String encoding error").unwrap());
    c_string.into_raw()
}

/// FFI 메모리 해제 함수 (re-export for convenience)
pub fn free_ffi_string(ptr: *mut c_char) {
    if !ptr.is_null() {
        unsafe {
            let _ = CString::from_raw(ptr);
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    
    #[test]
    fn test_create_error_response() {
        let error = AppError::Network { 
            message: "Connection failed".to_string() 
        };
        let ptr = create_ffi_error_response(&error);
        
        // 메모리 해제
        free_ffi_string(ptr);
    }
    
    #[test]
    fn test_encode_protobuf() {
        // Note: 실제 protobuf 타입으로 테스트해야 함
        // 여기서는 컴파일 테스트만 수행
    }
}