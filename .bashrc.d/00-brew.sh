#!/usr/bin/env bash
# -*- mode: sh; coding: utf-8; tab-width: 4; indent-tabs-mode: nil -*-

if command -v brew > /dev/null 2>&1; then
  readonly BREW_PREFIX=$(brew --prefix)
  export BREW_PREFIX

  readonly HOMEBREW_INSTALL_CLEANUP=1
  export HOMEBREW_INSTALL_CLEANUP

  EXTRA_MANPATH=""
  EXTRA_PATH=""

  for PACKAGE in coreutils curl findutils gawk gnu-sed gnu-tar grep make sqlite unzip; do
    PACKAGE_PATH=$BREW_PREFIX/opt/$PACKAGE
    LIBEXEC_PATH=$PACKAGE_PATH/libexec
    EXTRA_MANPATH=$PACKAGE_PATH/man:$LIBEXEC_PATH/gnuman:$EXTRA_MANPATH
    EXTRA_PATH=$PACKAGE_PATH/bin:$LIBEXEC_PATH/gnubin:$EXTRA_PATH
  done

  MANPATH=$EXTRA_MANPATH:$MANPATH
  export MANPATH

  PATH=$EXTRA_PATH:$PATH
  export PATH
else
  readonly BREW_PREFIX=/usr
  export BREW_PREFIX
fi
