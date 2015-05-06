#!/usr/bin/env bash
# -*- mode: sh; coding: utf-8; tab-width: 4; indent-tabs-mode: nil -*-
set -euo pipefail
IFS=$'\n\t'

open -a '/Applications/Emacs.app/Contents/MacOS/bin/emacsclient' "$@" --args -a "" -c
