# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# prompt
PS1='\n${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]
=> '

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
HISTTIMEFORMAT="%F %T "

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# editor
set -o vi
export EDITOR="vim"

# remember last directory
LAST_DIR=$HOME/.cache/last_dir
function cd()
{
  builtin cd "$@"
  pwd > $LAST_DIR
}
[ -f $LAST_DIR ] && cd `cat $LAST_DIR`

# autojump
. /etc/profile.d/autojump.bash

# translate English to Chinese using jianbing DNS TXT
function t()
{
  dig "$*.jianbing.org" +short txt | perl -pe's/\\(\d{1,3})/chr $1/eg; s/(^"|"$)//g'
}


########################
# variables
########################

# CMake
export CTEST_OUTPUT_ON_FAILURE=true

# Android development
export ANDROID=/opt/android/
export ANDROID_NDK=$ANDROID/ndk/
export ANDROID_SDK=$ANDROID/sdk/
export ANDROID_SOURCE=$HOME/OSP/Android/
export NDK_CCACHE=ccache
export USE_CCACHE=1

export PATH=~/.bin:~/.cabal/bin:$ANDROID_NDK:$ANDROID_SDK/tools:$ANDROID_SDK/platform-tools:$ANDROID/bin/:$PATH


########################
# aliases
########################
alias sudo='sudo env PATH=$PATH'
alias v='vim'
alias vi='vim'

alias ls='ls --color=auto'
alias ll='ls -AlF'
alias la='ls -A'
alias l='ls -CF'

alias grep='grep --color=auto -n'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias sqlite='sqlite3 -column -header'
alias gcc='gcc -Wall -std=c99'
alias ghc='ghc -Wall'
alias rscp='rsync -v -P -e ssh'
alias clip='xclip -sel clip'

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


# other custom configs
[ -f ~/.bash_local ] && . ~/.bash_local
