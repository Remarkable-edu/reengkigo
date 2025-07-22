#!/bin/bash
# Setup FFI for iOS project
# This script modifies the iOS project to include the Rust FFI library

set -e

PROJECT_FILE="Runner.xcodeproj/project.pbxproj"
FRAMEWORKS_DIR="Runner/Frameworks"
XCFRAMEWORK_NAME="dartffi.xcframework"

echo "🔧 Setting up FFI for iOS project..."

# Check if project file exists
if [ ! -f "$PROJECT_FILE" ]; then
    echo "❌ Error: Xcode project file not found"
    exit 1
fi

# Check if XCFramework exists
if [ ! -d "$FRAMEWORKS_DIR/$XCFRAMEWORK_NAME" ]; then
    echo "❌ Error: $XCFRAMEWORK_NAME not found in $FRAMEWORKS_DIR"
    echo "Please run the build script first: cd ../../ && ./build.sh"
    exit 1
fi

echo "✅ Found $XCFRAMEWORK_NAME"

# Backup original project file
cp "$PROJECT_FILE" "$PROJECT_FILE.backup.$(date +%s)"
echo "📦 Backed up project file"

# Use a simple approach: Add library search paths and link flags via build settings
# We'll modify the project to include our static library

# Add framework search path to Runner app configurations
if ! grep -q "FRAMEWORK_SEARCH_PATHS.*Frameworks" "$PROJECT_FILE"; then
    echo "📁 Adding framework search paths..."
    
    # Add to Debug configuration after LD_RUNPATH_SEARCH_PATHS
    sed -i '' '/97C147061CF9000F007C117D.*Debug/,/};/{
        /);$/{
            a\
				FRAMEWORK_SEARCH_PATHS = (\
					"$(inherited)",\
					"$(PROJECT_DIR)/Runner/Frameworks",\
				);
        }
    }' "$PROJECT_FILE"
    
    # Add to Release configuration after LD_RUNPATH_SEARCH_PATHS  
    sed -i '' '/97C147071CF9000F007C117D.*Release/,/};/{
        /);$/{
            a\
				FRAMEWORK_SEARCH_PATHS = (\
					"$(inherited)",\
					"$(PROJECT_DIR)/Runner/Frameworks",\
				);
        }
    }' "$PROJECT_FILE"
fi

# Add other linker flags to Runner app configurations
if ! grep -q "OTHER_LDFLAGS.*force_load.*libdart_ffi" "$PROJECT_FILE"; then
    echo "🔗 Adding linker flags..."
    
    # Add to Debug configuration after FRAMEWORK_SEARCH_PATHS
    sed -i '' '/97C147061CF9000F007C117D.*Debug/,/};/{
        /FRAMEWORK_SEARCH_PATHS = (/,/);/{
            /);$/{
                a\
				OTHER_LDFLAGS = (\
					"$(inherited)",\
					"-force_load",\
					"$(PROJECT_DIR)/Runner/Frameworks/dartffi.xcframework/ios-arm64-simulator/libdart_ffi_sim.a",\
				);
            }
        }
    }' "$PROJECT_FILE"
    
    # Add to Release configuration after FRAMEWORK_SEARCH_PATHS
    sed -i '' '/97C147071CF9000F007C117D.*Release/,/};/{
        /FRAMEWORK_SEARCH_PATHS = (/,/);/{
            /);$/{
                a\
				OTHER_LDFLAGS = (\
					"$(inherited)",\
					"-force_load",\
					"$(PROJECT_DIR)/Runner/Frameworks/dartffi.xcframework/ios-arm64-simulator/libdart_ffi_sim.a",\
				);
            }
        }
    }' "$PROJECT_FILE"
fi

echo "✅ iOS FFI setup completed!"
echo "📱 The app should now be able to load the Rust FFI library"
echo ""
echo "Next steps:"
echo "1. Clean your build: flutter clean"
echo "2. Get dependencies: flutter pub get"  
echo "3. Run the app: flutter run"