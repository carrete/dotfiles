#!/usr/bin/env bash
# -*- mode: sh; coding: utf-8; tab-width: 4; indent-tabs-mode: nil -*-

[[ -z ${PS1:-} ]] && return

LIQUIDPROMPT=$BREW_PREFIX/share/liquidprompt

if [[ -f $LIQUIDPROMPT/liquidprompt ]]; then
  LIQUIDPROMPT=$LIQUIDPROMPT/liquidprompt
fi

# shellcheck source=/dev/null
. "$LIQUIDPROMPT"
