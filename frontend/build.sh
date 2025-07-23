#!/bin/bash
# Reengkigo Unified Build System - Rebuilt from scratch
# Frontend/build.sh - Main build script for iPhone and Galaxy devices

set -e

# =============================================================================
# Configuration and Constants
# =============================================================================

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Project paths
RUST_LIB_PATH="./rust-lib"
FLUTTER_PROJECT_PATH="./reengkigo_flutter"

# Default build settings
BUILD_IOS=true
BUILD_ANDROID=true
BUILD_EXTENDED=false
CLEANUP_BINARIES=false

# =============================================================================
# Helper Functions
# =============================================================================

show_help() {
    echo -e "${BLUE}======================================${NC}"
    echo -e "${BLUE}  Reengkigo Unified Build System${NC}"
    echo -e "${BLUE}======================================${NC}"
    echo ""
    echo "Usage: $0 [OPTIONS]"
    echo ""
    echo "Options:"
    echo "  --ios-only          Build only iOS (iPhone) libraries"
    echo "  --android-only      Build only Android (Galaxy) libraries" 
    echo "  --extended          Include additional architectures (simulators, emulators)"
    echo "  --cleanup           Remove build artifacts and unnecessary libraries"
    echo "  --help              Show this help message"
    echo ""
    echo "Default behavior: Build iPhone + Galaxy devices only"
    echo ""
    echo "Examples:"
    echo "  $0                  # iPhone + Galaxy (default)"
    echo "  $0 --ios-only       # iPhone only"
    echo "  $0 --android-only   # Galaxy only"
    echo "  $0 --extended       # All architectures"
    echo "  $0 --cleanup        # Build and cleanup"
    echo ""
}

parse_arguments() {
    while [[ $# -gt 0 ]]; do
        case $1 in
            --ios-only)
                BUILD_IOS=true
                BUILD_ANDROID=false
                shift
                ;;
            --android-only)
                BUILD_IOS=false
                BUILD_ANDROID=true
                shift
                ;;
            --extended)
                BUILD_EXTENDED=true
                shift
                ;;
            --cleanup)
                CLEANUP_BINARIES=true
                shift
                ;;
            --help)
                show_help
                exit 0
                ;;
            *)
                echo -e "${RED}Unknown option: $1${NC}"
                show_help
                exit 1
                ;;
        esac
    done
}

verify_prerequisites() {
    echo -e "${BLUE}🔍 Verifying prerequisites...${NC}"
    
    # Check directories
    if [ ! -d "$RUST_LIB_PATH" ]; then
        echo -e "${RED}Error: Rust library directory not found at $RUST_LIB_PATH${NC}"
        exit 1
    fi
    
    if [ ! -d "$FLUTTER_PROJECT_PATH" ]; then
        echo -e "${RED}Error: Flutter project directory not found at $FLUTTER_PROJECT_PATH${NC}"
        exit 1
    fi
    
    # Check tools
    if ! command -v cargo &> /dev/null; then
        echo -e "${RED}Error: Cargo (Rust) not found. Please install Rust.${NC}"
        exit 1
    fi
    
    if ! command -v flutter &> /dev/null; then
        echo -e "${RED}Error: Flutter not found. Please install Flutter.${NC}"
        exit 1
    fi
    
    echo -e "${GREEN}✓ Prerequisites verified${NC}"
}

generate_protobuf_files() {
    echo -e "${BLUE}🔧 Generating protobuf files...${NC}"
    
    # Check if protoc is available
    if ! command -v protoc &> /dev/null; then
        echo -e "${YELLOW}⚠️  protoc not found, skipping protobuf generation${NC}"
        return
    fi
    
    # Add dart protoc plugin to PATH
    export PATH="$PATH:$HOME/.pub-cache/bin"
    
    # Check if protoc-gen-dart is available
    if ! command -v protoc-gen-dart &> /dev/null; then
        echo -e "${YELLOW}⚠️  protoc-gen-dart not found, installing...${NC}"
        cd "$FLUTTER_PROJECT_PATH"
        dart pub global activate protoc_plugin 21.1.2
        cd ..
    fi
    
    # Generate protobuf files for Flutter
    if [ -d "proto" ]; then
        # Count .proto files
        proto_count=$(find proto -name "*.proto" -type f | wc -l)
        
        if [ "$proto_count" -gt 0 ]; then
            echo -e "${BLUE}  Generating Dart protobuf files...${NC}"
            echo -e "${BLUE}    Found $proto_count proto file(s)${NC}"
            
            cd "$FLUTTER_PROJECT_PATH"
            
            # Create generated directory if it doesn't exist
            mkdir -p lib/generated
            
            # Find and process all .proto files
            find ../proto -name "*.proto" -type f | while read proto_file; do
                proto_name=$(basename "$proto_file")
                echo -e "${BLUE}      Processing: $proto_name${NC}"
                
                # Generate protobuf files for each .proto file
                protoc --dart_out=lib/generated --proto_path=../proto "$proto_file"
                
                if [ $? -ne 0 ]; then
                    echo -e "${RED}      ✗ Failed to generate: $proto_name${NC}"
                fi
            done
            
            # Check if any files were generated
            generated_files=$(find lib/generated -name "*.pb.dart" -type f | wc -l)
            
            if [ "$generated_files" -gt 0 ]; then
                echo -e "${GREEN}    ✓ Protobuf files generated successfully${NC}"
                echo -e "${BLUE}    Generated files:${NC}"
                ls -la lib/generated/*.pb.dart 2>/dev/null || echo "      No protobuf files found"
            else
                echo -e "${RED}    ✗ No protobuf files were generated${NC}"
            fi
            
            cd ..
        else
            echo -e "${YELLOW}    ⚠️  No .proto files found in proto/ directory${NC}"
        fi
    else
        echo -e "${YELLOW}    ⚠️  Proto directory not found${NC}"
    fi
    
    echo -e "${GREEN}✅ Protobuf generation completed${NC}"
}

# =============================================================================
# Build Functions
# =============================================================================

build_rust_libraries() {
    echo -e "${YELLOW}🔧 Building Rust libraries...${NC}"
    
    cd "$RUST_LIB_PATH"
    
    # Make scripts executable
    chmod +x build.sh
    chmod +x build_xcframework.sh 2>/dev/null || true
    chmod +x build_android.sh 2>/dev/null || true
    
    # Export build configuration
    export BUILD_IOS
    export BUILD_ANDROID
    export BUILD_EXTENDED
    
    # Call rust build script
    if [ -f "build.sh" ]; then
        ./build.sh
    else
        echo -e "${RED}Error: rust-lib/build.sh not found${NC}"
        exit 1
    fi
    
    cd ..
    echo -e "${GREEN}✅ Rust libraries built${NC}"
}

copy_ios_libraries() {
    if [ "$BUILD_IOS" != "true" ]; then
        return
    fi
    
    echo -e "${BLUE}  📱 Copying iOS libraries...${NC}"
    
    local ios_source="ffi_binary/ios/Frameworks"
    local ios_dest="$FLUTTER_PROJECT_PATH/ios/Runner/Frameworks"
    
    if [ -d "$ios_source" ] && [ "$(ls -A $ios_source 2>/dev/null)" ]; then
        mkdir -p "$ios_dest"
        cp -R "$ios_source/"* "$ios_dest/" 2>/dev/null || true
        echo -e "${GREEN}    ✓ iOS frameworks copied to Flutter project${NC}"
    else
        echo -e "${YELLOW}    ⚠️  No iOS frameworks found to copy${NC}"
    fi
}



copy_android_libraries() {
    if [ "$BUILD_ANDROID" != "true" ]; then
        return
    fi
    
    echo -e "${BLUE}  🤖 Copying Android libraries...${NC}"
    
    local android_source="ffi_binary/android/app/src/main/jniLibs"
    local android_dest="$FLUTTER_PROJECT_PATH/android/app/src/main/jniLibs"
    
    if [ -d "$android_source" ] && [ "$(ls -A $android_source 2>/dev/null)" ]; then
        # Remove existing jniLibs to ensure clean copy
        rm -rf "$android_dest"
        mkdir -p "$android_dest"
        
        if [ "$BUILD_EXTENDED" == "true" ]; then
            echo -e "${BLUE}    Copying all architectures (extended mode)...${NC}"
            cp -R "$android_source/"* "$android_dest/" 2>/dev/null || true
        else
            echo -e "${BLUE}    Copying iPhone/Galaxy architectures only...${NC}"
            # Only copy ARM architectures
            if [ -d "$android_source/arm64-v8a" ]; then
                mkdir -p "$android_dest/arm64-v8a"
                cp -R "$android_source/arm64-v8a/"* "$android_dest/arm64-v8a/" 2>/dev/null || true
            fi
            if [ -d "$android_source/armeabi-v7a" ]; then
                mkdir -p "$android_dest/armeabi-v7a"
                cp -R "$android_source/armeabi-v7a/"* "$android_dest/armeabi-v7a/" 2>/dev/null || true
            fi
            echo -e "${BLUE}    Skipped x86/x86_64 (emulator architectures)${NC}"
        fi
        
        echo -e "${GREEN}    ✓ Android libraries copied to Flutter project${NC}"
        
        # Show what was copied
        echo -e "${BLUE}    Copied architectures:${NC}"
        ls -la "$android_dest" | grep -v "^total" | grep -v "^\.$" | grep -v "^\.\.$" || echo "      No architectures found"
    else
        echo -e "${YELLOW}    ⚠️  No Android libraries found to copy${NC}"
    fi
}

copy_libraries_to_flutter() {
    echo -e "${YELLOW}📱 Copying libraries to Flutter project...${NC}"
    
    copy_ios_libraries
    copy_android_libraries
    
    echo -e "${GREEN}✅ Library copying completed${NC}"
}

cleanup_build_artifacts() {
    if [ "$CLEANUP_BINARIES" != "true" ]; then
        return
    fi
    
    echo -e "${YELLOW}🧹 Cleaning up build artifacts...${NC}"
    
    # Clean Rust build artifacts
    if [ -d "$RUST_LIB_PATH/target" ]; then
        echo -e "${BLUE}  Removing Rust debug builds...${NC}"
        find "$RUST_LIB_PATH/target" -name "debug" -type d -exec rm -rf {} + 2>/dev/null || true
        find "$RUST_LIB_PATH/target" -name "*.d" -type f -delete 2>/dev/null || true
        find "$RUST_LIB_PATH/target" -name "*.rlib" -type f -delete 2>/dev/null || true
    fi
    
    # Clean intermediate files
    echo -e "${BLUE}  Removing intermediate build files...${NC}"
    rm -rf "$RUST_LIB_PATH/.cargo" 2>/dev/null || true
    
    # Clean source directories (keep only Flutter project libraries)
    if [ "$CLEANUP_BINARIES" == "true" ]; then
        echo -e "${BLUE}  Cleaning source library directories...${NC}"
        # Optionally clean source dirs - but keep them for now
        # rm -rf android ios 2>/dev/null || true
    fi
    
    echo -e "${GREEN}✅ Cleanup completed${NC}"
}

# =============================================================================
# Main Build Process
# =============================================================================

main() {
    echo -e "${BLUE}======================================${NC}"
    echo -e "${BLUE}  Reengkigo Unified Build System${NC}" 
    echo -e "${BLUE}======================================${NC}"
    echo ""
    
    # Parse command line arguments
    parse_arguments "$@"
    
    # Show build configuration
    echo -e "${YELLOW}📋 Build Configuration:${NC}"
    echo -e "  iOS: $([ "$BUILD_IOS" == "true" ] && echo -e "${GREEN}✓ Enabled${NC}" || echo -e "${RED}✗ Disabled${NC}")"
    echo -e "  Android: $([ "$BUILD_ANDROID" == "true" ] && echo -e "${GREEN}✓ Enabled${NC}" || echo -e "${RED}✗ Disabled${NC}")"
    echo -e "  Extended Architectures: $([ "$BUILD_EXTENDED" == "true" ] && echo -e "${GREEN}✓ Enabled${NC}" || echo -e "${RED}✗ Disabled${NC}")"
    echo -e "  Cleanup: $([ "$CLEANUP_BINARIES" == "true" ] && echo -e "${GREEN}✓ Enabled${NC}" || echo -e "${RED}✗ Disabled${NC}")"
    echo ""
    
    # Verify prerequisites
    verify_prerequisites
    
    # Generate protobuf files
    generate_protobuf_files
    
    # Build Rust libraries
    build_rust_libraries
    
    # Copy libraries to Flutter project
    copy_libraries_to_flutter
    
    # Optional cleanup
    cleanup_build_artifacts
    
    # Final status
    echo ""
    echo -e "${GREEN}🎉 Build completed successfully!${NC}"
    echo -e "${GREEN}📁 Libraries ready for Flutter FFI integration${NC}"
    echo ""
    
    # Show library locations
    if [ "$BUILD_IOS" == "true" ]; then
        echo -e "${BLUE}iOS Frameworks:${NC} $FLUTTER_PROJECT_PATH/ios/Runner/Frameworks/"
    fi
    if [ "$BUILD_ANDROID" == "true" ]; then
        echo -e "${BLUE}Android Libraries:${NC} $FLUTTER_PROJECT_PATH/android/app/src/main/jniLibs/"
    fi
    echo ""
    
    echo -e "${BLUE}Next steps:${NC}"
    echo -e "  • Test with: flutter run"
    echo ""
}

# =============================================================================
# Script Execution
# =============================================================================

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi