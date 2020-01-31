#!/usr/bin/env bash
# -*- mode: sh; coding: utf-8; tab-width: 4; indent-tabs-mode: nil -*-

[[ -z ${PS1:-} ]] && return

readonly LESSHISTSIZE=0
export LESSHISTSIZE

readonly LESSHISTFILE=-
export LESSHISTFILE

export GROFF_NO_SGR=1
export GROFF_NO_SGR

# http://www.bytesizedworkbench.com/blog/2017/10/24/the-joy-of-alacritty/

LESS_TERMCAP_mb=$(
  tput bold
  tput setaf 2
) # green
export LESS_TERMCAP_mb
LESS_TERMCAP_md=$(
  tput bold
  tput setaf 6
) # cyan
export LESS_TERMCAP_md
LESS_TERMCAP_se=$(
  tput rmso
  tput sgr0
)
export LESS_TERMCAP_se
LESS_TERMCAP_so=$(
  tput bold
  tput setaf 3
  tput setab 4
) # yellow on blue
export LESS_TERMCAP_so
LESS_TERMCAP_ue=$(
  tput rmul
  tput sgr0
)
export LESS_TERMCAP_ue
LESS_TERMCAP_us=$(
  tput smul
  tput bold
  tput setaf 7
) # white
export LESS_TERMCAP_us
LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_me
LESS_TERMCAP_mh=$(tput dim)
export LESS_TERMCAP_mh
LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mr
LESS_TERMCAP_ZN=$(tput ssubm)
export LESS_TERMCAP_ZN
LESS_TERMCAP_ZO=$(tput ssupm)
export LESS_TERMCAP_ZO
LESS_TERMCAP_ZV=$(tput rsubm)
export LESS_TERMCAP_ZV
LESS_TERMCAP_ZW=$(tput rsupm)
export LESS_TERMCAP_ZW
