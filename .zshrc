# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/opt/homebrew/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="cdimascio-lambda"

# Plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

#------------------------------------------
# Aliases
#------------------------------------------
# Replace basic ls
alias ls="eza"

# Replace terminal editors by neovim because it is 🔥
alias vi="nvim"
alias vim="nvim"
alias nano="nvim"