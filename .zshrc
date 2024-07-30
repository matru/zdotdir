#!/bin/zsh
#
# .zshrc - Zsh file loaded on interactive shell sessions.
#

# Compfix setup (https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/compfix.zsh):
ZSH_DISABLE_COMPFIX="false"
setopt extended_glob

# Autoload functions you might want to use with antidote.
ZFUNCDIR=${ZFUNCDIR:-$ZDOTDIR/functions}
fpath=($ZFUNCDIR $fpath)
autoload -Uz $fpath[1]/*(.:t)

# Source zstyles you might use with antidote.
[[ -e ${ZDOTDIR:-~}/.zstyles ]] && source ${ZDOTDIR:-~}/.zstyles

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# Clone antidote if necessary.
# [[ -d ${ZDOTDIR:-~}/.antidote ]] ||
  # git clone https://github.com/mattmc3/antidote ${ZDOTDIR:-~}/.antidote

# Create an amazing Zsh config using antidote plugins.
# source ${ZDOTDIR:-~}/.antidote/antidote.zsh
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
antidote load
