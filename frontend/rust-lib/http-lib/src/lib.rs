// http-lib/lib.rs

use reqwest::Client;
use serde_json::json;
use tokio::runtime::Runtime;
use once_cell::sync::Lazy;

pub use proto_lib::*;

// tokio rumntime
static SHARED_RUNTIME: Lazy<Runtime> = Lazy::new(|| {
    Runtime::new().expect("Failed to create tokio runtime")
});

// for connection pooling
static SHARED_CLIENT: Lazy<Client> = Lazy::new(|| {
    Client::new()
});

pub async fn login_async(base_url: &str, request: LoginRequest) -> LoginResponse {
    let url = format!("{}/api/applogin", base_url);

    let json_body = json!({
        "account": request.account,
        "password": request.password
    });

    match SHARED_CLIENT.post(&url).json(&json_body).send().await {
        Ok(response) => {
            if response.status().is_success() {
                match response.json::<serde_json::Value>().await {
                    Ok(json_response) => {
                        // JSON에서 Auth 추출
                        let auth_json = &json_response["auth"];
                        let auth = Auth {
                            account_id: auth_json["AccountID"].as_i64().unwrap_or(0) as i32,
                            account_type_id: auth_json["AccountTypeID"].as_i64().unwrap_or(0) as i32,
                            agency_id: auth_json["AgencyID"].as_i64().unwrap_or(0) as i32,
                            academy_id: auth_json["AcademyID"].as_i64().unwrap_or(0) as i32,
                            account: auth_json["Account"].as_str().unwrap_or("").to_string(),
                            state: auth_json["State"].as_i64().unwrap_or(0) as i32,
                        };

                        LoginResponse {
                            success: true,
                            result: Some(login::login_response::Result::Auth(auth)),
                        }
                    }
                    Err(e) => {
                        let error_detail = ErrorDetail {
                            code: "JSON_PARSE_ERROR".to_string(),
                            message: format!("Failed to parse JSON: {}", e),
                            user_message: "아이디 혹은 비밀번호가 틀렸습니다".to_string(),
                        };

                        LoginResponse {
                            success: false,
                            result: Some(login::login_response::Result::Error(error_detail)),
                        }
                    }
                }
            } else {
                let status_code = response.status().as_u16();
                let error_detail = ErrorDetail {
                    code: "HTTP_ERROR".to_string(),
                    message: format!("HTTP {} error", status_code),
                    user_message: if status_code == 401 || status_code == 403 {
                        "아이디 혹은 비밀번호가 틀렸습니다.".to_string()
                    } else {
                        "서버 연결에 문제가 있습니다.".to_string()
                    },
                };

                LoginResponse {
                    success: false,
                    result: Some(login::login_response::Result::Error(error_detail)),
                }
            }
        }
        Err(e) => {
            let error_detail = ErrorDetail {
                code: "NETWORK_ERROR".to_string(),
                message: format!("Network error: {}", e),
                user_message: "네트워크 연결을 확인해주세요.".to_string(),
            };

            LoginResponse {
                success: false,
                result: Some(login::login_response::Result::Error(error_detail)),
            }
        }
    }
}

pub fn login_sync(base_url: String, request: LoginRequest) -> LoginResponse {
    SHARED_RUNTIME.block_on(login_async(&base_url, request))
}

pub fn get_shared_runtime() -> &'static Runtime {
    &SHARED_RUNTIME
}
