# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

# Created by newuser for 5.9
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

plugins=(archlinux 
	bundler 
	docker 
	jsontools 
	web-search 
	tig 
	gitfast 
	colored-man-pages
	colorize 
	command-not-found 
	cp 
	dirhistory 
	sudo
	grc)
# /!\ zsh-syntax-highlighting and then zsh-autosuggestions must be at the end

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# Check for termianl capabilities (use from TTY)
if zmodload zsh/terminfo && (( terminfo[colors] >= 256 )); then
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
else
  [[ ! -f ~/.p10k-tty.zsh ]] || source ~/.p10k-tty.zsh
fi

# Load grc for colors
[[ ! -f /etc/grc.zsh ]] || source /etc/grc.zsh

# Load ssh keys into keychain (tmp)
eval $(keychain --eval --quiet ~/.ssh/id_ecdsa)
