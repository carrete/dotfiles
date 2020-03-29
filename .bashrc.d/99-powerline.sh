#!/usr/bin/env bash
# -*- mode: sh; coding: utf-8; tab-width: 4; indent-tabs-mode: nil -*-

[[ -z ${PS1:-} ]] && return

readonly GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWDIRTYSTATE

readonly GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWSTASHSTATE

readonly GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUNTRACKEDFILES

readonly GIT_PS1_SHOWUPSTREAM=auto
export GIT_PS1_SHOWUPSTREAM

readonly GIT_PS1_DESCRIBE_STYLE=branch
export GIT_PS1_DESCRIBE_STYLE

function colors() {
    for fg_color in {0..8}; do
        set_foreground=$(tput setaf $fg_color)
        for bg_color in {0..8}; do
            set_background=$(tput setab $bg_color)
            echo -n $set_background$set_foreground
            printf ' F:%s B:%s ' $fg_color $bg_color
        done
        echo $(tput sgr0)
    done
}

PS1='$(tput sgr0)[$(tput setaf 8)\u$(tput sgr0):$(tput setaf 4)$(tput bold)\w$(tput sgr0)]$(tput setaf 2)$(__git_ps1 " (%s)")$(tput sgr0)\n\$ '

export PS1
