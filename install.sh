#!/bin/bash

#installing neovim

brew install neovim
echo "🚀 Installed neovim"

#installing ripgrep
echo "🚀 Installed ripgrep"
brew install ripgrep

rm -rf "$HOME/.config/nvim/"

# create symbolic link
ln -s "$PWD/nvim/" "$HOME/.config/"
echo "📂 Added neovim to the correct directory"
echo "✅ Finished installing neovim"
