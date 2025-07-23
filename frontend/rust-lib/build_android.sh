#!/bin/bash
# build android for Rust FFI
# target : galaxy 
# 2025-07-21 garfield

set -e

echo "Building Android JNI libraries..."



# library config
LIB_NAME="dart_ffi"
OUTPUT_DIR="../ffi_binary/android/app/src/main/jniLibs"

# Android NDK library 
if [ -z "$ANDROID_NDK_HOME" ]; then
    export ANDROID_NDK_HOME=~/Library/Android/sdk/ndk/27.0.12077973
fi

# Architecture selection based on argument
BUILD_EXTENDED=${1:-false}

if [ "$BUILD_EXTENDED" = "true" ]; then
    echo "Building for all Android architectures (including emulators)"
    # All Android targets
    ANDROID_TARGETS=(
        "aarch64-linux-android"    # ARM64 (Galaxy S series, modern devices)
        "armv7-linux-androideabi"  # ARMv7 (older Galaxy devices)
        "x86_64-linux-android"     # x86_64 (Android emulator, Intel devices)
        "i686-linux-android"       # x86 (Android emulator)
    )
else
    echo "Building for Galaxy devices only (ARM architectures)"
    # Galaxy-optimized targets only
    ANDROID_TARGETS=(
        "aarch64-linux-android"    # ARM64 (Galaxy S series, modern devices)
        "armv7-linux-androideabi"  # ARMv7 (older Galaxy devices)
    )
fi

# Install required targets
for target in "${ANDROID_TARGETS[@]}"; do
    rustup target add "$target"
done

# Clean and prepare output directories
rm -rf "${OUTPUT_DIR}" 2>/dev/null || true
mkdir -p "${OUTPUT_DIR}/arm64-v8a"
mkdir -p "${OUTPUT_DIR}/armeabi-v7a"

if [ "$BUILD_EXTENDED" = "true" ]; then
    mkdir -p "${OUTPUT_DIR}/x86_64"
    mkdir -p "${OUTPUT_DIR}/x86"
fi

# Cargo cross compile
mkdir -p .cargo
NDK_PATH=$(eval echo ${ANDROID_NDK_HOME})
TOOLCHAIN_PATH="${NDK_PATH}/toolchains/llvm/prebuilt/darwin-x86_64/bin"

# .cargo/config.toml 파일 생성 (링커 경로에서 API 레벨 제거)
cat > .cargo/config.toml << EOF
[target.aarch64-linux-android]
ar = "${TOOLCHAIN_PATH}/llvm-ar"
linker = "${TOOLCHAIN_PATH}/aarch64-linux-android21-clang"

[target.armv7-linux-androideabi]
ar = "${TOOLCHAIN_PATH}/llvm-ar"
linker = "${TOOLCHAIN_PATH}/armv7a-linux-androideabi21-clang"

[target.x86_64-linux-android]
ar = "${TOOLCHAIN_PATH}/llvm-ar"
linker = "${TOOLCHAIN_PATH}/x86_64-linux-android21-clang"

[target.i686-linux-android]
ar = "${TOOLCHAIN_PATH}/llvm-ar"
linker = "${TOOLCHAIN_PATH}/i686-linux-android21-clang"
EOF

# Android build - build only selected targets
for target in "${ANDROID_TARGETS[@]}"; do
    echo "Building $target..."
    
    # 아키텍처에 맞는 컴파일러 환경 변수 설정
    case "$target" in
        "aarch64-linux-android")
            export AR_aarch64_linux_android="${TOOLCHAIN_PATH}/llvm-ar"
            export CC_aarch64_linux_android="${TOOLCHAIN_PATH}/aarch64-linux-android21-clang"
            export CXX_aarch64_linux_android="${TOOLCHAIN_PATH}/aarch64-linux-android21-clang++"
            ;;
        "armv7-linux-androideabi")
            export AR_armv7_linux_androideabi="${TOOLCHAIN_PATH}/llvm-ar"
            export CC_armv7_linux_androideabi="${TOOLCHAIN_PATH}/armv7a-linux-androideabi21-clang"
            export CXX_armv7_linux_androideabi="${TOOLCHAIN_PATH}/armv7a-linux-androideabi21-clang++"
            ;;
        "x86_64-linux-android")
            export AR_x86_64_linux_android="${TOOLCHAIN_PATH}/llvm-ar"
            export CC_x86_64_linux_android="${TOOLCHAIN_PATH}/x86_64-linux-android21-clang"
            export CXX_x86_64_linux_android="${TOOLCHAIN_PATH}/x86_64-linux-android21-clang++"
            ;;
        "i686-linux-android")
            export AR_i686_linux_android="${TOOLCHAIN_PATH}/llvm-ar"
            export CC_i686_linux_android="${TOOLCHAIN_PATH}/i686-linux-android21-clang"
            export CXX_i686_linux_android="${TOOLCHAIN_PATH}/i686-linux-android21-clang++"
            ;;
    esac

    # Cargo 빌드 실행
    cargo build --release --target "$target" -p dart-ffi
    
    # Copy to appropriate ABI directory
    case "$target" in
        "aarch64-linux-android")
            cp "target/$target/release/lib${LIB_NAME}.so" "${OUTPUT_DIR}/arm64-v8a/"
            ;;
        "armv7-linux-androideabi")
            cp "target/$target/release/lib${LIB_NAME}.so" "${OUTPUT_DIR}/armeabi-v7a/"
            ;;
        "x86_64-linux-android")
            cp "target/$target/release/lib${LIB_NAME}.so" "${OUTPUT_DIR}/x86_64/"
            ;;
        "i686-linux-android")
            cp "target/$target/release/lib${LIB_NAME}.so" "${OUTPUT_DIR}/x86/"
            ;;
    esac
done

echo "✅ Android JNI Libs build!"