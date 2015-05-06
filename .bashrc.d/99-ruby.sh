#!/usr/bin/env bash
# -*- mode: sh; coding: utf-8; tab-width: 4; indent-tabs-mode: nil -*-

BUNDLE_PATH=$(ruby -e 'puts Gem.user_dir')
export BUNDLE_PATH

PATH=$BUNDLE_PATH/bin:$PATH
export PATH
