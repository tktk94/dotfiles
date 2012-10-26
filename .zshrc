# .zshrc
# Kaoru Takata(@tkt_94)

# General Settiongs
export LANG=ja_JP.UTF-8
export KCODE=u
export AUTOFEATURE=true

bindkey -v

setopt no_beep
setopt auto_cd
setopt auto_pushd
setopt correct
setopt magic_equal_subst
setopt notify

# PATH
PATH=$PATH:/sbin:/usr/sbin:$HOME/bin:$HOME/local/bin

# History
HISTFILE=~/.zsh_history
HISTSIZE=10000000
HISTFILESIZE=10000000
SAVEHIST=10000000

# Prompt
autoload -U compinit; compinit
setopt auto_list
setopt auto_menu
setopt list_packed
setopt list_types
bindkey "^[[Z" reverse-menu-complete
zstyle ':completion:*default' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:cd:*' tag-order local-directories path-directories
zstyle ':completion:*' list-colors 'di=;00;38;05;44' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=00;38;05;44' 'cd=00;38;05;44'
export LANG=ja_JP.UTF-8
export TERM=xterm-256color
autoload colors
colors
case ${UID} in
0)
  PROMPT="%B%{${fg[red]}%}%/#%{${reset_color}%}%b "
  PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
  SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
    PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
  ;;
*)
  PROMPT="%{${fg[red]}%}%/%%%{${reset_color}%} "
  PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
  SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
  [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
    PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
  ;;
esac

#Word Splitting
WORDCHARS='*?_-.[]~+&!#$%^(){}<>'

# alias
case "$OSTYPE" in
	freebsd*|darwin*)
		alias ls='ls -al -G -w'
	;;
	*)
		alias ls='ls -al --color=auto'
	;;
esac
alias ll='ls -la --color=tty'
alias lla='ls -A'
alias wget='wget --no-check-certificate'
alias findg='find ./ -type f | grep"'
alias less='less --tabs=4 --LONG-PROMPT --RAW-CONTROL-CHARS --ignore-case'
alias grep='grep --color=auto'
alias grepc='grep --color=force'
alias ps='ps -ael'

# Editor
if which vim; then
	export EDITOR="vim"
	alias vi='vim'
	alias view='vim -R'
elif which vi; then
	export EDITOR=vi
fi > /dev/null 2>&1

# Pager
export PAGER='less'

# Setup Option
setopt APPEND_HISTORY
setopt AUTO_CD
setopt AUTO_LIST
setopt AUTO_MENU
setopt AUTO_PARAM_SLASH
setopt AUTO_PARAM_KEYS
setopt CHECK_JOBS
setopt CORRECT
setopt CORRECT_ALL
setopt EXTENDED_GLOB
setopt EXTENDED_HISTORY
setopt GLOB_DOTS
setopt HASH_CMDS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_NO_STORE
setopt HIST_IGNORE_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt INC_APPEND_HISTORY
setopt LIST_TYPES
setopt MARK_DIRS
setopt NUMERIC_GLOB_SORT
setopt NOBEEP
setopt NO_FLOW_CONTROL
setopt PROMPT_SUBST
setopt RM_STAR_WAIT
setopt SHARE_HISTORY
setopt AUTOPUSHD
setopt PUSHD_IGNORE_DUPS

# function

# ls after cd
function cd(){
		builtin cd $@ && ls;
}
