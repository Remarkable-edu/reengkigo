fn main() {
    prost_build::compile_protos(
        &["proto/calculator.proto"],
        &["proto/"],
    )
    .unwrap();
}
