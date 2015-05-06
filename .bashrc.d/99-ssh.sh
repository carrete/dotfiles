#!/usr/bin/env bash
# -*- mode: sh; coding: utf-8; tab-width: 4; indent-tabs-mode: nil -*-

# http://www.cygwin.com/ml/cygwin/2001-06/msg00537.html

[[ -z ${PS1:-} ]] && return

GPG_TTY="$(tty)"
export GPG_TTY

SSH_ENVIRONMENT="$HOME"/.ssh/environment

start_sshagent() {
  ssh-agent | sed 's/^echo/#echo/' > "$SSH_ENVIRONMENT"
  chmod 0600 "$SSH_ENVIRONMENT"
  # shellcheck source=/dev/null
  . "$SSH_ENVIRONMENT" > /dev/null
  ssh-add
}

if [[ -z $GDMSESSION ]]; then
  if [[ -f $SSH_ENVIRONMENT ]]; then
    # shellcheck source=/dev/null
    . "$SSH_ENVIRONMENT" > /dev/null
  fi
  ps -p "${SSH_AGENT_PID:-0}" | grep -cq ssh-agent > /dev/null || {
    start_sshagent
  }
fi

unset SSH_ENVIRONMENT
