#!/usr/bin/env bash
# -*- mode: sh; coding: utf-8; tab-width: 4; indent-tabs-mode: nil -*-

VIRTUALENVWRAPPER_PYTHON=$(command -v python3)
export VIRTUALENVWRAPPER_PYTHON

PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV=true
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV

# shellcheck source=/dev/null
source "$(command -v virtualenvwrapper.sh)"
