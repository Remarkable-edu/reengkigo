use std::fs;
use std::path::Path;
use std::io::Write;

fn main() -> Result<(), Box<dyn std::error::Error>> {
    let proto_dir = "../../proto";
    
    // proto 디렉토리에서 모든 .proto 파일 찾기
    let mut proto_files = Vec::new();
    find_proto_files(proto_dir, &mut proto_files)?;
    
    if proto_files.is_empty() {
        println!("cargo:warning=No .proto files found in {}", proto_dir);
        return Ok(());
    }
    
    println!("cargo:warning=Found {} .proto files", proto_files.len());
    for file in &proto_files {
        println!("cargo:warning=  - {}", file);
    }
    
    // 모든 .proto 파일 컴파일
    prost_build::compile_protos(&proto_files, &[proto_dir])?;
    
    // 생성된 .rs 파일들을 기반으로 lib.rs 자동 생성
    generate_lib_rs_from_output()?;
    
    Ok(())
}

fn find_proto_files(dir: &str, proto_files: &mut Vec<String>) -> Result<(), Box<dyn std::error::Error>> {
    find_proto_files_recursive(dir, proto_files)?;
    Ok(())
}

fn find_proto_files_recursive(current_dir: &str, proto_files: &mut Vec<String>) -> Result<(), Box<dyn std::error::Error>> {
    let path = Path::new(current_dir);
    if !path.exists() {
        return Ok(());
    }
    
    for entry in fs::read_dir(path)? {
        let entry = entry?;
        let file_path = entry.path();
        
        if file_path.is_file() {
            if let Some(extension) = file_path.extension() {
                if extension == "proto" {
                    if let Some(file_str) = file_path.to_str() {
                        proto_files.push(file_str.to_string());
                    }
                }
            }
        } else if file_path.is_dir() {
            // 재귀적으로 하위 디렉토리 탐색
            if let Some(dir_str) = file_path.to_str() {
                find_proto_files_recursive(dir_str, proto_files)?;
            }
        }
    }
    
    Ok(())
}

fn generate_lib_rs_from_output() -> Result<(), Box<dyn std::error::Error>> {
    let out_dir = std::env::var("OUT_DIR")?;
    let out_path = Path::new(&out_dir);
    
    // OUT_DIR에서 .rs 파일들 찾기 (lib_generated.rs 제외)
    let mut rs_modules = Vec::new();
    
    for entry in fs::read_dir(out_path)? {
        let entry = entry?;
        let file_path = entry.path();
        
        if file_path.is_file() {
            if let Some(extension) = file_path.extension() {
                if extension == "rs" {
                    if let Some(file_name) = file_path.file_stem() {
                        if let Some(module_name) = file_name.to_str() {
                            // lib_generated.rs는 제외
                            if module_name != "lib_generated" {
                                rs_modules.push(module_name.to_string());
                            }
                        }
                    }
                }
            }
        }
    }
    
    rs_modules.sort(); // 일관된 순서로 정렬
    
    let lib_path = out_path.join("lib_generated.rs");
    
    let mut lib_content = String::new();
    lib_content.push_str("// Auto-generated lib.rs for proto modules\n");
    lib_content.push_str("// DO NOT EDIT MANUALLY\n\n");
    
    // 각 모듈에 대해 mod 선언 추가
    for module in &rs_modules {
        lib_content.push_str(&format!(
            "pub mod {} {{\n    include!(concat!(env!(\"OUT_DIR\"), \"/{}.rs\"));\n}}\n\n",
            module, module
        ));
    }
    
    // re-export 추가
    lib_content.push_str("// Re-export all types\n");
    for module in &rs_modules {
        lib_content.push_str(&format!("pub use {}::*;\n", module));
    }
    
    // 파일 쓰기
    let mut file = fs::File::create(lib_path)?;
    file.write_all(lib_content.as_bytes())?;
    
    println!("cargo:warning=Generated lib.rs with {} modules: {:?}", rs_modules.len(), rs_modules);
    
    Ok(())
}