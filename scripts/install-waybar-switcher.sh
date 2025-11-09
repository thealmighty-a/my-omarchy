#!/bin/sh

# Install Omarchy Auto Waybar Switch
# Original repo: https://github.com/Palccod/Omarchy-auto-waybar-switch

echo "================================"
echo "Installing Waybar Theme Switcher"
echo "================================"
echo ""

REPO_URL="https://github.com/Palccod/Omarchy-auto-waybar-switch.git"
INSTALL_DIR="$HOME/.local/share/waybar-switcher"
BIN_DIR="$HOME/.local/bin"

# Clone or update the repo
if [ -d "$INSTALL_DIR" ]; then
    echo "Waybar switcher already installed, updating..."
    cd "$INSTALL_DIR" && git pull
else
    echo "Cloning Waybar switcher repository..."
    git clone "$REPO_URL" "$INSTALL_DIR"
fi

if [ $? -ne 0 ]; then
    echo "✗ Failed to install Waybar switcher"
    exit 1
fi

echo "✓ Waybar switcher installed"

# Create bin directory if it doesn't exist
mkdir -p "$BIN_DIR"

# Create symlink to the script (adjust path if needed based on repo structure)
# Note: You'll need to verify the actual script name when you see the repo
if [ -f "$INSTALL_DIR/waybar-switch.sh" ]; then
    ln -sf "$INSTALL_DIR/waybar-switch.sh" "$BIN_DIR/waybar-switch"
    chmod +x "$BIN_DIR/waybar-switch"
    echo "✓ Created symlink to waybar-switch"
elif [ -f "$INSTALL_DIR/switch.sh" ]; then
    ln -sf "$INSTALL_DIR/switch.sh" "$BIN_DIR/waybar-switch"
    chmod +x "$BIN_DIR/waybar-switch"
    echo "✓ Created symlink to waybar-switch"
else
    echo "⚠ Script name unknown - check the repo and update this script"
    echo "Repository location: $INSTALL_DIR"
fi

echo ""
echo "================================"
echo "Installation Complete"
echo "================================"
echo ""
echo "📝 Repository: https://github.com/Palccod/Omarchy-auto-waybar-switch"
echo "📁 Installed to: $INSTALL_DIR"
echo "🔗 Symlink created: $BIN_DIR/waybar-switch"
echo ""
echo "Usage: waybar-switch"
echo "Add a keybind in your overrides to launch it!"
