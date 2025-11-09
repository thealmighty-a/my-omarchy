#!/bin/sh

# Install GNU Stow
# Stow is used to manage dotfiles via symlinks

echo "Installing GNU Stow..."

yay -S --noconfirm --needed stow

if [ $? -eq 0 ]; then
    echo "✓ GNU Stow installed successfully"
else
    echo "✗ Failed to install GNU Stow"
    exit 1
fi
