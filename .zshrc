# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/opt/homebrew/bin:.composer/vendor/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="minimal"

# Plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# NVM configuration
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

#------------------------------------------
# Aliases
#------------------------------------------
# Replace basic ls
alias ls="exa"

# Replace terminal editors by neovim because it is 🔥
alias vi="nvim"
alias vim="nvim"
alias nano="nvim"

# Laravel aliases 😎
alias art="php artisan"
alias artmf="php artisan migrate:fresh"