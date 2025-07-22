#!/bin/bash
# frontend/rust-lib/build.sh
set -e

echo "🚀 Building Reengkigo FFI libraries for all platforms..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}======================================${NC}"
echo -e "${BLUE}  Reengkigo FFI Complete Build Script${NC}"
echo -e "${BLUE}======================================${NC}"

# Check if we're in the right directory
if [ ! -f "Cargo.toml" ]; then
    echo -e "${RED}Error: Please run this script from the rust-lib directory${NC}"
    exit 1
fi

# Install required targets for mobile only
echo -e "${YELLOW}📦 Installing required Rust targets for mobile...${NC}"
rustup target add aarch64-apple-ios
rustup target add aarch64-linux-android

# Get build flags from environment variables set by frontend/build.sh
BUILD_EXTENDED=${BUILD_EXTENDED:-false}
BUILD_IOS=${BUILD_IOS:-true}
BUILD_ANDROID=${BUILD_ANDROID:-true}

echo -e "${YELLOW}Build configuration: iOS=$BUILD_IOS, Android=$BUILD_ANDROID, Extended=$BUILD_EXTENDED${NC}"

if [ "$BUILD_IOS" == "true" ]; then
    echo -e "${YELLOW}📱 Building iOS XCFramework...${NC}"
    ./build_xcframework.sh "$BUILD_EXTENDED"
else
    echo -e "${YELLOW}📱 Skipping iOS build (disabled)${NC}"
fi

if [ "$BUILD_ANDROID" == "true" ]; then
    echo -e "${YELLOW}🤖 Building Android libraries...${NC}"
    export ANDROID_NDK_HOME=~/Library/Android/sdk/ndk/27.0.12077973
    if [ -d "$ANDROID_NDK_HOME" ]; then
        ./build_android.sh "$BUILD_EXTENDED"
    else
        echo -e "${YELLOW}⚠️  Android NDK not found at: $ANDROID_NDK_HOME${NC}"
        echo -e "${YELLOW}   Install Android NDK to build Android libraries${NC}"
    fi
else
    echo -e "${YELLOW}🤖 Skipping Android build (disabled)${NC}"
fi

echo -e "${GREEN}✅ Build completed successfully!${NC}"
echo -e "${GREEN}📁 Check the following directories:${NC}"
echo -e "   • iOS: ../reengkigo_flutter/ios/Frameworks/"
echo -e "   • Android: ../reengkigo_flutter/android/app/src/main/jniLibs/"
echo -e ""
