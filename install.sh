#!/bin/sh

echo "Let's intall this fresh macOS 😎"

# Remove last login line from terminal
touch .hushlogin

# Create default projects directory
mkdir ~/Projects

# Prepare SSH keys
mkdir ~/.ssh
cp /Users/donovan/Documents/Clés/SSH/id_* ~/.ssh
chmod 600 ~/.ssh/id_rsa
eval "$(ssh-agent -s)"
ssh-add -apple-use-keychain ~/.ssh/id_rsa

# Install Oh My Zsh
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install Homebrew
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Cleanup ZSH files
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc

# Install Homebrew utilities
brew update
brew tap homebrew/bundle
brew bundle --file ~/.dotfiles/Brewfile

# -----------------------------------------------------------------------
# Configure macOS user settings
# -----------------------------------------------------------------------

# Dock size
defaults write com.apple.dock tilesize -int 35

# Dock magnification
defaults write com.apple.dock largesize -int 60
