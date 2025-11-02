#!/usr/bin/env bash
eval "$(zoxide init bash)"
alias l='ls -aFhC' # add colors and file type extensions
function _zq() {
  if [ -n "$1" ]; then
    z "$1" && l
  else
    z ~ && l
  fi
}
alias z='_zq'
alias zi='function _zy(){ zi "$1" && l; }; _zy'
alias zs="z $HOME/.local/bin"

export PATH=$PATH:"$HOME/.local/bin"

iatest=$(expr index "$-" i)
if [[ $iatest -gt 0 ]]; then bind "set completion-ignore-case on"; fi
if [[ $iatest -gt 0 ]]; then bind "set show-all-if-ambiguous On"; fi

export EDITOR=nvim
export VISUAL=nvim

alias gal="swayimg -f -g -o reverse -s fit"
alias ss="startw"
alias sureset="faillock --user $USER --reset"
alias sudo="sureset && sudo $@"
alias smci="sureset && sudo make clean install"
alias smcu="sureset && sudo make clean uninstall"
alias snbi="sureset && sudo ninja -C build install"
alias snbu="sureset && sudo ninja -C build uninstall"
alias grep="grep --color=auto"
alias pacs="sudo pacman -S"
alias pacr="sudo pacman -Rcnsu"
alias pacqu="sudo pacman -Syy && sudo pacman -Qu"
alias pac="sudo pacman"
alias pgg="ping -c 3 8.8.8.8"
alias v="nvim"
alias vv="faillock --user $USER --reset && sudoedit"
alias gc="git clone"
alias ebrc="v ~/.bashrc"
alias einitrc="v ~/.xinitrc"
alias mthp="simple-mtpfs --device 1 ~/SamsungGalaxyA50/ && cd ~/SamsungGalaxyA50"
alias da='date "+%Y-%m-%d %A %T %Z"'
alias cat="bat"
alias mdwl="cd ~/.local/programs/dwl-v0.7; cp config.def.h config.h; sudo make clean install; cd -"
alias edwl="cd ~/.local/programs/dwl-v0.7; v config.def.h"


alias cp='cp -rv'
alias scp='sudo cp -rv'
alias rm='rm -rv'
alias srm='sudo rm -rv'
alias mv='mv -v'
alias smv='sudo mv -v'
alias mdir='mkdir -p'
alias smdir='sudo mkdir -p'
alias ps='ps auxf'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

cd ()
{
	if [ -n "$1" ]; then
		builtin cd "$@" && ls
	else
		builtin cd ~ && ls
	fi
}

alias ll="ls -Fls"                # long listing format
#alias ls="ls -aFh --color=always" # add colors and file type extensions
alias ls="ls -aFh --color=never" # add colors and file type extensions
alias lf="ls -l | egrep -v '^d'"  # files only
alias ldir="ls -l | egrep '^d'"   # directories only

alias mx='chmod +x'

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
PS1=' \[$(tput setaf 33)\]\w \[$(tput setaf 69)\]\[$(tput setaf 105)\]  \[$(tput setaf 148)\]'
zf() {
	z	"$(find "$USER" -type d \( -name "DATA:D" -or -name "DATA:C" \) -prune -o -type d -print | fzf)"
}
