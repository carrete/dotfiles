#!/usr/bin/env bash
# -*- mode: sh; coding: utf-8; tab-width: 4; indent-tabs-mode: nil -*-
# set -euo pipefail
# IFS=$'\n\t'

for SCRIPT in "$HOME"/.bashrc.d/*.sh
do
    if [[ -r $SCRIPT ]]
    then
        # shellcheck source=/dev/null
        . "$SCRIPT"
    fi
done

if command -v direnv > /dev/null 2>&1
then
    eval "$(direnv hook bash)"
fi
