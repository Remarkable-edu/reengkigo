// error_types.rs
// 공통 에러 타입 정의

use thiserror::Error;

/// 애플리케이션 전체에서 사용하는 공통 에러 타입
#[derive(Error, Debug, Clone)]
pub enum AppError {
    #[error("Network error: {message}")]
    Network { message: String },
    
    #[error("API error: {status_code} - {message}")]
    Api { status_code: u16, message: String },
    
    #[error("Serialization error: {message}")]
    Serialization { message: String },
    
    #[error("Validation error: {message}")]
    Validation { message: String },
    
    #[error("Authentication error: {message}")]
    Authentication { message: String },
    
    #[error("Authorization error: {message}")]
    Authorization { message: String },
    
    #[error("Internal error: {message}")]
    Internal { message: String },
    
    #[error("Unknown error: {message}")]
    Unknown { message: String },
}

impl AppError {
    /// 에러 코드 반환 (클라이언트에서 에러 타입 구분용)
    pub fn error_code(&self) -> &'static str {
        match self {
            AppError::Network { .. } => "NETWORK_ERROR",
            AppError::Api { .. } => "API_ERROR", 
            AppError::Serialization { .. } => "SERIALIZATION_ERROR",
            AppError::Validation { .. } => "VALIDATION_ERROR",
            AppError::Authentication { .. } => "AUTH_ERROR",
            AppError::Authorization { .. } => "AUTHZ_ERROR",
            AppError::Internal { .. } => "INTERNAL_ERROR",
            AppError::Unknown { .. } => "UNKNOWN_ERROR",
        }
    }
    
    /// 사용자에게 표시할 메시지 반환
    pub fn user_message(&self) -> String {
        match self {
            AppError::Network { .. } => "네트워크 연결에 문제가 있습니다.".to_string(),
            AppError::Api { .. } => "서버에서 오류가 발생했습니다.".to_string(),
            AppError::Serialization { .. } => "데이터 처리 중 오류가 발생했습니다.".to_string(),
            AppError::Validation { message } => format!("입력값 오류: {}", message),
            AppError::Authentication { .. } => "로그인이 필요합니다.".to_string(),
            AppError::Authorization { .. } => "권한이 없습니다.".to_string(),
            AppError::Internal { .. } => "내부 오류가 발생했습니다.".to_string(),
            AppError::Unknown { .. } => "알 수 없는 오류가 발생했습니다.".to_string(),
        }
    }
}

/// HTTP 상태 코드에서 AppError로 변환
impl From<reqwest::StatusCode> for AppError {
    fn from(status: reqwest::StatusCode) -> Self {
        let code = status.as_u16();
        let message = status.canonical_reason().unwrap_or("Unknown status").to_string();
        
        match code {
            401 => AppError::Authentication { message },
            403 => AppError::Authorization { message },
            400..=499 => AppError::Validation { message },
            500..=599 => AppError::Api { status_code: code, message },
            _ => AppError::Unknown { message },
        }
    }
}

/// anyhow::Error에서 AppError로 변환
impl From<anyhow::Error> for AppError {
    fn from(err: anyhow::Error) -> Self {
        AppError::Internal { 
            message: err.to_string() 
        }
    }
}

/// prost::DecodeError에서 AppError로 변환
impl From<prost::DecodeError> for AppError {
    fn from(err: prost::DecodeError) -> Self {
        AppError::Serialization { 
            message: format!("Protobuf decode error: {}", err) 
        }
    }
}

/// reqwest::Error에서 AppError로 변환
impl From<reqwest::Error> for AppError {
    fn from(err: reqwest::Error) -> Self {
        if err.is_connect() || err.is_timeout() {
            AppError::Network { 
                message: err.to_string() 
            }
        } else if let Some(status) = err.status() {
            AppError::from(status)
        } else {
            AppError::Unknown { 
                message: err.to_string() 
            }
        }
    }
}