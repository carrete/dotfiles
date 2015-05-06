#!/usr/bin/env bash
# -*- mode: sh; coding: utf-8; tab-width: 4; indent-tabs-mode: nil -*-

[[ -z ${PS1:-} ]] && return

readonly LESSHISTSIZE=0
export LESSHISTSIZE

readonly LESSHISTFILE=-
export LESSHISTFILE

export GROFF_NO_SGR=1
export GROFF_NO_SGR

readonly LESS_TERMCAP_mb=$'\e[1;31m'
export LESS_TERMCAP_mb
readonly LESS_TERMCAP_md=$'\e[1;33m'
export LESS_TERMCAP_md
readonly LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_me
readonly LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_se
readonly LESS_TERMCAP_so=$'\e[01;44;37m'
export LESS_TERMCAP_so
readonly LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_ue
readonly LESS_TERMCAP_us=$'\e[01;37m'
export LESS_TERMCAP_us
