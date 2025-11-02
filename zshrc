#!/usr/bin/env zsh

# Initialize zoxide
# Zsh uses 'zoxide init zsh' instead of 'bash'
eval "$(zoxide init zsh)"

# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments
#
# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Shell options for completion (Equivalent of 'bind "set completion-ignore-case on/show-all-if-ambiguous On"' in Bash)
# These are only set if the shell is interactive ($- contains 'i')
if [[ $- =~ i ]]; then
    # Enable case-insensitive and partial-word completion
    zstyle ':completion:*' list-colors $LS_COLORS
    zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

    # Show all possibilities immediately on tab (like show-all-if-ambiguous On)
    setopt auto_menu
    # Don't show options if there are more than 100 possibilities
    # setopt menu_complete # <-- Use this instead of auto_menu if you prefer tab to cycle through
fi

# --- Zoxide Functions and Aliases ---

# Original zoxide wrapper function (replaces 'alias z='_zq'')
function _zq() {
  if [ -n "$1" ]; then
    z "$1" && ls
  else
    z ~ && ls
  fi
}
alias z='_zq'

# 'zi' alias function (uses the zsh completion for zoxide)
# The original bash 'zi' was complex due to how Bash handles aliases and functions.
# In Zsh, we can define a function that wraps 'zoxide query -i' and then call 'z' on the result.
function _zi_func() {
  local target
  # Use zoxide's interactive query and pass the result to the 'z' function
  target=$(zoxide query -i "$1")
  if [ -n "$target" ]; then
    z "$target"
  fi
}
alias zi='_zi_func'

alias zs="z $HOME/.local/bin"

# --- System and Utility Aliases ---

# Sway/Graphics
alias gal="swayimg -f -g -o reverse -s fit"
alias ss="startw"

# sudo/Security wrappers
alias sureset="faillock --user $USER --reset"
# Zsh requires 'command sudo' to prevent infinite recursion if the alias is used inside the alias definition.
alias sudo="sureset && command sudo " # Note the trailing space for alias expansion (global alias equivalent)

alias smci="sureset && sudo make clean install"
alias smcu="sureset && sudo make clean uninstall"
alias snbi="sureset && sudo ninja -C build install"
alias snbu="sureset && sudo ninja -C build uninstall"

# Arch/Pacman
alias pacs="sudo pacman -S"
alias pacr="sudo pacman -Rcnsu"
alias pacqu="sudo pacman -Syy && sudo pacman -Qu"
alias pacfu="sudo pacman -Syyu"
alias pac="sudo pacman"

# Other utilities
alias grep="grep --color=auto"
alias pgg="ping -c 3 8.8.8.8"
alias v="nvim"
alias vv="faillock --user $USER --reset && sudoedit"
alias gc="git clone"

# Config editing
alias ebrc="v ~/.zshrc" # Changed to edit the new .zshrc
alias einitrc="v ~/.xinitrc"

# Hardware/File system
alias mthp="simple-mtpfs --device 1 ~/SamsungGalaxyA50/ && cd ~/SamsungGalaxyA50"
alias da='date "+%Y-%m-%d %A %T %Z"'
alias cat="bat" # Requires 'bat' to be installed

# dwl config/install
alias mdwl="cd ~/.local/programs/dwl-v0.7; cp config.def.h config.h; sudo make clean install; cd -"
alias edwl="cd ~/.local/programs/dwl-v0.7; v config.def.h"

# --- File Operations (Verbose by default) ---
alias cp='cp -rv'
alias scp='sudo cp -rv'
alias rm='rm -rv'
alias srm='sudo rm -rv'
alias mv='mv -v'
alias smv='sudo mv -v'
alias mdir='mkdir -p'
alias smdir='sudo mkdir -p'
alias ps='ps auxf'

# --- Directory Navigation Wrappers ---

# Custom cd function (will execute 'ls' after every successful directory change)
# The logic is fine, but we'll use 'command cd' to prevent recursion with the function.
#cd ()
#{
#    if [ -n "$1" ]; then
#        command cd "$@" && ls
#    else
#        command cd ~ && ls
#    fi
#}

# Directory shortcuts
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Listing aliases
# Note: 'ls' aliases are often tricky. Your original had 'l' then redefined 'ls'.
# I'm keeping your final 'ls' definition and adjusting 'l' to use colors.
alias l='ls -aFhC --color=always' # Added --color=always for Zsh/ls compatibility
alias ll="ls -Fls"              # long listing format
alias ls="ls -aFh --color=never" # The final 'ls' alias from your bashrc
alias lf="ls -l | egrep -v '^d'"  # files only
alias ldir="ls -l | egrep '^d'"   # directories only
alias mx='chmod +x'

# --- Extract Function ---

# This function is pure bash/shell syntax and works fine in Zsh.
extract() {
    for archive in "$@"; do
        if [ -f "$archive" ]; then
            case $archive in
            *.tar.bz2) tar xvjf $archive ;;
            *.tar.gz) tar xvzf $archive ;;
            *.bz2) bunzip2 $archive ;;
            *.rar) rar x $archive ;;
            *.gz) gunzip $archive ;;
            *.tar) tar xvf $archive ;;
            *.tbz2) tar xvjf $archive ;;
            *.tgz) tar xvzf $archive ;;
            *.zip) unzip $archive ;;
            *.Z) uncompress $archive ;;
            *.7z) 7z x $archive ;;
            *) echo "don't know how to extract '$archive'..." ;;
            esac
        else
            echo "'$archive' is not a valid file!"
        fi
    done
}


# Function 'zf'
# This function is pure bash/shell syntax and works fine in Zsh.
zf() {
    z    "$(find "$USER" -type d \( -name "DATA:D" -or -name "DATA:C" \) -prune -o -type d -print | fzf)"
}

source ~/.config/zshplugin/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
#source ~/.config/zshplugin/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source ~/.config/zshplugin/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
