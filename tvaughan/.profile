#!/usr/bin/env bash
# -*- mode: sh; coding: utf-8; tab-width: 4; indent-tabs-mode: nil -*-
# set -euo pipefail
# IFS=$'\n\t'

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
umask 022

PATH="$HOME"/bin:"$HOME"/.local/bin:"$PATH"
export PATH

if [ -n "$BASH_VERSION" ]; then
  if [ -f "$HOME"/.bashrc ]; then
    # shellcheck source=/dev/null
    . "$HOME/.bashrc"
  fi
fi

# https://github.com/direnv/direnv/wiki/Tmux
alias tmux="direnv exec / tmux"

case $TERM in
xterm*)
  [ -z "$TMUX" ] && { tmux attach-session -t default || exec tmux new-session -s default && exit; } || true
  ;;
esac
