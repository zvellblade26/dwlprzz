#!/usr/bin/env zsh

# Add ~/.local/bin to PATH
export PATH=$PATH:"$HOME/.local/bin"

# Default programs:
export EDITOR="nvim"
export VISUAL="nvim"
export TERMINAL="foot"
export BROWSER="librewolf"

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"
setopt inc_append_history

# Start the dwl window manager
startw
