#!/usr/bin/env zsh

### User configuration ###

# Enable Powerlevel10k instant prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

setopt autocd
setopt prompt_subst

ZSH="$HOME/.zsh"
ZSH_THEME="p10k"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search)

 ################################
### DO NO TOUCH ANYTHING BELOW ###
 ################################

### User scripts directory ###
if [ ! -d "$ZSH" ]; then
	mkdir -p $HOME/.zsh/
	ZSH="$HOME/.zsh"
fi

### Load plugins ###
for p in $plugins; do
	if [ -e "$ZSH/plugins/$p.zsh" ];then
		source "$ZSH/plugins/$p.zsh";
	elif [ -e "$ZSH/plugins/$p/$p.zsh" ];then
		source "$ZSH/plugins/$p/$p.zsh";
	elif [ -e "/usr/share/zsh/plugins/$p.zsh" ];then
		source "/usr/share/zsh/plugins/$p.zsh";
	elif [ -e "/usr/share/zsh/plugins/$p/$p.zsh" ];then
		source "/usr/share/zsh/plugins/$p/$p.zsh";
	fi
done && unset p

### Load the theme ###
if [ "$ZSH_THEME" = "p10k" ]; then
	source "/usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme"
else
	if [ -e "$ZSH/themes/$t.zsh-theme" ]; then
		source "$ZSH/themes/$t.zsh-theme";
	elif [ -e "$ZSH/themes/$t/$t.zsh-theme" ]; then
		source "$ZSH/themes/$t/$t.zsh-theme";
	elif [ -e "/usr/share/zsh/themes/$t.zsh-theme" ]; then
		source "/usr/share/zsh/themes/$t.zsh-theme";
	elif [ -e "/usr/share/zsh/themes/$t/$t.zsh-theme" ]; then
		source "/usr/share/zsh/themes/$t/$t.zsh-theme";
	fi
fi

### Load user librarys ###
for l in $ZSH/lib/*.zsh; do
	if [ -e "$l" ]; then
		source $l
	fi
done && unset l

### Load system librarys ###
for l in /usr/share/zsh/lib/*.zsh; do
	if [ -e "$l" ]; then
		source $l
	fi
done && unset l

# To customize prompt, run `p10k configure` or edit ~/Configurations/zsh/.p10k.zsh.
[[ ! -f ~/Configurations/zsh/.p10k.zsh ]] || source ~/Configurations/zsh/.p10k.zsh
