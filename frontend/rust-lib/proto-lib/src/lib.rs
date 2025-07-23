pub mod login {
    include!(concat!(env!("OUT_DIR"), "/login.rs"));
}

pub use login::*;