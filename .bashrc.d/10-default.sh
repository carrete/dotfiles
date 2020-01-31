#!/usr/bin/env bash
# -*- mode: sh; coding: utf-8; tab-width: 4; indent-tabs-mode: nil -*-

PATH=/usr/local/sbin:$PATH
export PATH

[[ -z ${PS1:-} ]] && return

GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
export GCC_COLORS

HISTCONTROL=ignoreboth
export HISTCONTROL

HISTFILESIZE=2000
export HISTFILESIZE

HISTSIZE=1000
export HISTSIZE

LS_OPTIONS='--group-directories-first --time-style=long-iso'
export LS_OPTIONS

shopt -s checkwinsize
shopt -s globstar
shopt -s histappend

if command -v lesspipe > /dev/null 2>&1; then
  eval "$(SHELL=/bin/sh lesspipe)"
fi

if command -v dircolors > /dev/null 2>&1; then
  eval "$(dircolors -b "$HOME"/.dircolors.nord)"

  alias ls='ls $LS_OPTIONS --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias ll='ls $LS_OPTIONS -lF'
alias la='ll -A'

readonly BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
export BASH_COMPLETION_COMPAT_DIR

if ! shopt -oq posix; then
  if [ -f "$BREW_PREFIX"/etc/profile.d/bash_completion.sh ]; then
    # shellcheck source=/dev/null
    . "$BREW_PREFIX"/etc/profile.d/bash_completion.sh
  elif [ -f /etc/bash_completion ]; then
    # shellcheck source=/dev/null
    . /etc/bash_completion
  fi
fi
