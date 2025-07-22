set -e

echo "Building iOS XCFramework..."

# library config
LIB_NAME="dart_ffi"
XCFRAMEWORK_NAME="dartffi"
OUTPUT_DIR="../ffi_binary/ios/Frameworks"

# Architecture selection based on argument
BUILD_EXTENDED=${1:-false}

if [ "$BUILD_EXTENDED" = "true" ]; then
    echo "Building for all iOS architectures (including simulators)"
    # All iOS targets
    IOS_TARGETS=(
        "aarch64-apple-ios"        # iPhone (ARM64)
        "x86_64-apple-ios"         # iOS Simulator (Intel Mac)
        "aarch64-apple-ios-sim"    # iOS Simulator (Apple Silicon Mac)
    )
    BUILD_SIMULATOR=true
else
    echo "Building for iPhone devices and simulators (default)"
    # iPhone + Simulator targets for better development experience
    IOS_TARGETS=(
        "aarch64-apple-ios"        # iPhone (ARM64)
        "aarch64-apple-ios-sim"    # iOS Simulator (Apple Silicon Mac - most common)
    )
    BUILD_SIMULATOR=true
fi

# Install required targets
for target in "${IOS_TARGETS[@]}"; do
    rustup target add "$target"
done

# Clean and prepare build directories
rm -rf "target/xcframework" 2>/dev/null || true
mkdir -p "${OUTPUT_DIR}"
mkdir -p "target/xcframework"

# Build for selected targets
for target in "${IOS_TARGETS[@]}"; do
    echo "Building $target..."
    cargo build --release --target "$target" -p dart-ffi
done

# Create simulator universal lib based on available targets
if [ "$BUILD_SIMULATOR" = "true" ]; then
    if [ "$BUILD_EXTENDED" = "true" ]; then
        echo "Creating universal simulator library (Intel + Apple Silicon)..."
        lipo -create \
            "target/x86_64-apple-ios/release/lib${LIB_NAME}.a" \
            "target/aarch64-apple-ios-sim/release/lib${LIB_NAME}.a" \
            -output "target/xcframework/lib${LIB_NAME}_sim.a"
    else
        echo "Creating Apple Silicon simulator library..."
        cp "target/aarch64-apple-ios-sim/release/lib${LIB_NAME}.a" "target/xcframework/lib${LIB_NAME}_sim.a"
    fi
fi

# Create headers directory and generate header file
mkdir -p "target/xcframework/headers"
cbindgen dart-ffi --config cbindgen.toml --crate dart-ffi --output "target/xcframework/headers/${LIB_NAME}.h"

# create XCFramework 
if [ "$BUILD_SIMULATOR" = "true" ]; then
    echo "Creating XCFramework with device and simulator support..."
    xcodebuild -create-xcframework \
        -library "target/aarch64-apple-ios/release/lib${LIB_NAME}.a" \
        -headers "target/xcframework/headers" \
        -library "target/xcframework/lib${LIB_NAME}_sim.a" \
        -headers "target/xcframework/headers" \
        -output "target/xcframework/${XCFRAMEWORK_NAME}.xcframework"
else
    echo "Creating XCFramework with device support only..."
    xcodebuild -create-xcframework \
        -library "target/aarch64-apple-ios/release/lib${LIB_NAME}.a" \
        -headers "target/xcframework/headers" \
        -output "target/xcframework/${XCFRAMEWORK_NAME}.xcframework"
fi

# Copy to output directory (prevent recursive copying)
if [ -d "target/xcframework/${XCFRAMEWORK_NAME}.xcframework" ]; then
    rm -rf "${OUTPUT_DIR}/${XCFRAMEWORK_NAME}.xcframework" 2>/dev/null || true
    cp -R "target/xcframework/${XCFRAMEWORK_NAME}.xcframework" "${OUTPUT_DIR}/"
fi

if [ -f "target/xcframework/headers/${LIB_NAME}.h" ]; then
    cp "target/xcframework/headers/${LIB_NAME}.h" "${OUTPUT_DIR}/"
fi

echo "✅ iOS XCFramework build!"