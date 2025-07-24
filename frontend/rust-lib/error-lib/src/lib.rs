// error-lib/lib.rs
// 공통 에러 처리 및 응답 포매팅 라이브러리
// 2025-07-24 garfield

pub mod error_types;
pub mod response;
pub mod ffi;

// Re-export 주요 타입들
pub use error_types::*;
pub use ffi::*;