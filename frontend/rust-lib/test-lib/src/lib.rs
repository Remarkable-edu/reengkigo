pub mod proto {
    pub mod v1 {
        include!(concat!(env!("OUT_DIR"), "/calculator.v1.rs"));
    }
}

use proto::v1::{CalculationRequest, CalculationResponse, TextRequest, TextResponse};

pub fn add(req: CalculationRequest) -> CalculationResponse {
    CalculationResponse {
        result: req.number_a + req.number_b,
    }
}

pub fn multiply(req: CalculationRequest) -> CalculationResponse {
    CalculationResponse {
        result: req.number_a * req.number_b,
    }
}

pub fn concatenate(req: TextRequest) -> TextResponse {
    TextResponse {
        result: format!("{} {}", req.text_a, req.text_b),
    }
}
