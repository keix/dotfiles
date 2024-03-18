# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# This is ZSH settings file: ~/.zshrc
#

export PATH="$HOME/bin:$PATH"
#export PATH="$PATH:/opt/homebrew/bin"
export PATH="/opt/homebrew/bin:$PATH"
#export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
export PATH="$PATH:/opt/homebrew/opt/coreutils/libexec/gnubin"
export TERM="xterm-256color"

export OPENAI_API_KEY=`cat ~/.openai-api-key`
export NEW_YORK_TIMES_API_KEY=`cat ~/.new-york-times`
export BSKY_PASSWORD=`cat ~/.bsky-password`
export KEIX_ORG_AWS="kei@ec2-13-231-228-237.ap-northeast-1.compute.amazonaws.com"
export KEIX_ORG_PEM="~/.pem/keix.org.pem"
export WORDCHARS='*?_.[]~-=&;!#$%^(){}<>' 

bindkey -e

autoload -Uz colors
colors

autoload -Uz compinit
compinit

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# alias
#alias ls='ls --color=auto'
alias ls='ls -GF'
alias python='python3.11'
alias pip='pip3'
alias screen='/opt/homebrew/bin/screen'
alias python-config='python3-config'


# black	  0
# red	  1
# green	  2
# yellow  3
# blue	  4
# magenta 5
# cyan	  6
# white	  7

PROMPT="%F{161}%n%f%{${reset_color}%}@%F{161}%m%f %{${reset_color}%}%% "
RPROMPT='%F{161}[%f %~ %F{161}]%f'

#export LSCOLORS=exfxcxdxbxegedabagacad
export LSCOLORS=Gxfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# git設定
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
precmd () { vcs_info }
# RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

colorlist() {
	for color in {000..015}; do
		print -nP "%F{$color}$color %f"
	done
	printf "\n"
	for color in {016..255}; do
		print -nP "%F{$color}$color %f"
		if [ $(($((color-16))%6)) -eq 5 ]; then
			printf "\n"
		fi
	done
}

command_not_found_handler () {
    fortune|pokemonsay
    echo "Command not found: $1"
    return 127
}


source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

