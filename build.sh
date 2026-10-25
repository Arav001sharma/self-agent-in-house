#!/bin/bash
set -e

echo "🚀 Building Lil' Agents for macOS (Intel x86_64, macOS 13.0+)..."

# Ensure build directories exist
mkdir -p build/AppIcon.iconset
APP_PATH="/Applications/LilAgents.app"

# 1. Compile Swift sources
echo "📦 Compiling Swift sources with swiftc..."
swiftc \
    -target x86_64-apple-macos13.0 \
    -parse-as-library \
    -O \
    LilAgents/*.swift \
    -o build/LilAgents

# 2. Generate AppIcon.icns if needed
if [ ! -f build/AppIcon.icns ]; then
    echo "🎨 Generating AppIcon.icns..."
    cp LilAgents/Assets.xcassets/AppIcon.appiconset/*.png build/AppIcon.iconset/
    iconutil -c icns build/AppIcon.iconset -o build/AppIcon.icns
fi

# 3. Assemble App Bundle
echo "📂 Assembling /Applications/LilAgents.app..."
# Close running instance if any
pkill LilAgents 2>/dev/null || true

rm -rf "$APP_PATH"
mkdir -p "$APP_PATH/Contents/MacOS"
mkdir -p "$APP_PATH/Contents/Resources/Sounds"

# Copy binary & set permissions
cp build/LilAgents "$APP_PATH/Contents/MacOS/LilAgents"
chmod +x "$APP_PATH/Contents/MacOS/LilAgents"

# Copy Resources
cp build/AppIcon.icns "$APP_PATH/Contents/Resources/AppIcon.icns"
cp LilAgents/*.mov "$APP_PATH/Contents/Resources/"
cp LilAgents/Sounds/* "$APP_PATH/Contents/Resources/Sounds/"

# Copy Menu Icons
cp LilAgents/Assets.xcassets/MenuBarIcon.imageset/bubble-icon.png "$APP_PATH/Contents/Resources/MenuBarIcon.png"
cp LilAgents/Assets.xcassets/MenuBarIcon.imageset/bubble-icon@2x.png "$APP_PATH/Contents/Resources/MenuBarIcon@2x.png"
cp LilAgents/Assets.xcassets/MenuBarIcon.imageset/bubble-icon@3x.png "$APP_PATH/Contents/Resources/MenuBarIcon@3x.png"
cp LilAgents/Assets.xcassets/bruce-hang.imageset/bruce-hang.png "$APP_PATH/Contents/Resources/" 2>/dev/null || true

# Write Info.plist
cat << 'EOF' > "$APP_PATH/Contents/Info.plist"
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundleExecutable</key>
    <string>LilAgents</string>
    <key>CFBundleIdentifier</key>
    <string>com.ryanstephen.LilAgents</string>
    <key>CFBundleName</key>
    <string>Lil' Agents</string>
    <key>CFBundleDisplayName</key>
    <string>Lil' Agents</string>
    <key>CFBundleIconFile</key>
    <string>AppIcon</string>
    <key>CFBundlePackageType</key>
    <string>APPL</string>
    <key>CFBundleShortVersionString</key>
    <string>1.0.0</string>
    <key>CFBundleVersion</key>
    <string>1</string>
    <key>LSMinimumSystemVersion</key>
    <string>13.0</string>
    <key>LSUIElement</key>
    <true/>
    <key>NSHighResolutionCapable</key>
    <true/>
</dict>
</plist>
EOF

# 4. Ad-hoc codesign
echo "🔏 Code signing bundle..."
codesign --force --deep --sign - "$APP_PATH"

echo "✅ Lil' Agents installed successfully at $APP_PATH!"
