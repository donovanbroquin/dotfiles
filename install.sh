#!/bin/sh

echo "Let's intall this fresh macOS 😎"

# Remove last login line from terminal
touch ~/.hushlogin

# Create default projects directory
mkdir ~/Projects

# Prepare SSH keys
mkdir ~/.ssh
cp /Users/donovan/Documents/Clés/SSH/id_* ~/.ssh
chmod 600 ~/.ssh/id_rsa
eval "$(ssh-agent -s)"
ssh-add --apple-use-keychain ~/.ssh/id_rsa

# Install Oh My Zsh
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install theme
git clone https://github.com/subnixr/minimal.git  ${ZSH_CUSTOM}/themes/minimal
ln -s ${ZSH_CUSTOM}/themes/minimal/minimal.zsh ${ZSH_CUSTOM}/themes/minimal.zsh-theme

# Cleanup ZSH files
rm -rf $HOME/.zshrc
ln -s $HOME/.dotfiles/.zshrc $HOME/.zshrc
source $HOME/.zshrc

# Install Homebrew
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install Homebrew utilities
brew update
brew tap homebrew/bundle
brew bundle --file ~/.dotfiles/Brewfile

# Prepare NVM
mkdir ~/.nvm

# -----------------------------------------------------------------------
# Configure macOS user settings
# -----------------------------------------------------------------------

# Dock size
defaults write com.apple.dock tilesize -int 35
defaults write com.apple.dock largesize -int 35

# Dock magnification
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock largesize -float 70

# Dock position
defaults write com.apple.dock orientation -string right

# Dock hide recent apps
defaults write com.apple.dock show-recents -bool false

# Dock auto hide
defaults write com.apple.dock autohide -bool true

# Keyboard speed
defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 15

# Sidebar icons
defaults write com.apple.sidebar iconSize -int 16
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1
defaults write -g NSTableViewDefaultSizeMode -int 1

# Restart all things
killall Dock
killall Finder
