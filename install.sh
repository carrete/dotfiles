#!/usr/bin/env bash
# -*- mode: sh; coding: utf-8; tab-width: 4; indent-tabs-mode: nil -*-
set -euo pipefail
IFS=$'\n\t'

function backup {
    FILE="$1"
    BACKUP="$FILE".orig

    if [[ ! -f "$BACKUP" ]]
    then
        cp -a "$FILE" "$BACKUP"
    fi
}

function prepare {(
    cd "$HOME"
    rm -rf                                                                      \
        .bashrc.d*                                                              \
        .byobu*                                                                 \
        .config/autostart*                                                      \
        .git*                                                                   \
        .less*                                                                  \
        .liquidprompt*                                                          \
        .local/share/applications*                                              \
        .local/share/recently-used.xbel*                                        \
        .vim*                                                                   \
        bin                                                                     \
    #
    for FILE in .bashrc .profile
    do
        backup "$FILE"
    done
)}

prepare
ln -s "$PWD"/.bashrc.d "$PWD"/bin "$HOME"
rsync -rq tvaughan/ "$HOME"/

exit 0
