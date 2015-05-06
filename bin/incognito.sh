#!/usr/bin/env bash
# -*- mode: sh; coding: utf-8; tab-width: 4; indent-tabs-mode: nil -*-
set -euo pipefail
IFS=$'\n\t'

open -a '/Applications/Chromium.app/Contents/MacOS/Chromium' "$@" --args        \
    --enable-dom-distiller                                                      \
    --incognito                                                                 \
    --remote-debugging-port=9222                                                \
#
