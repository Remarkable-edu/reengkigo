use anyhow::Result;
use reqwest::Client;
use serde_json::json;

// Re-export proto types
pub use proto_lib::*;

pub struct HttpClient {
    client: Client,
    base_url: String,
}

impl HttpClient {
    pub fn new() -> Self {
        Self {
            client: Client::new(),
            base_url: "https://dev-admin.reengki.com".to_string(),
        }
    }

    pub async fn login(&self, request: proto_lib::LoginRequest) -> Result<proto_lib::LoginResponse> {
        let url = format!("{}/api/applogin", self.base_url);
        
        // Convert protobuf to JSON for HTTP request
        let json_body = json!({
            "account": request.account,
            "password": request.password
        });
        
        let response = self
            .client
            .post(&url)
            .json(&json_body)
            .send()
            .await?;

        if response.status().is_success() {
            let json_response: serde_json::Value = response.json().await?;
            
            // Convert JSON response to protobuf
            let auth = proto_lib::Auth {
                account_id: json_response["auth"]["AccountID"].as_i64().unwrap_or(0) as i32,
                account_type_id: json_response["auth"]["AccountTypeID"].as_i64().unwrap_or(0) as i32,
                agency_id: json_response["auth"]["AgencyID"].as_i64().unwrap_or(0) as i32,
                academy_id: json_response["auth"]["AcademyID"].as_i64().unwrap_or(0) as i32,
                account: json_response["auth"]["Account"].as_str().unwrap_or("").to_string(),
                state: json_response["auth"]["State"].as_i64().unwrap_or(0) as i32,
            };
            
            let login_response = proto_lib::LoginResponse {
                auth: Some(auth),
            };
            
            Ok(login_response)
        } else {
            let status = response.status();
            let error_text = response.text().await.unwrap_or_default();
            Err(anyhow::anyhow!("Login failed with status {}: {}", status, error_text))
        }
    }
}

impl Default for HttpClient {
    fn default() -> Self {
        Self::new()
    }
}