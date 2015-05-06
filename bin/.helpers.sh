#!/usr/bin/env bash
# -*- mode: sh; coding: utf-8; tab-width: 4; indent-tabs-mode: nil -*-
set -euo pipefail
IFS=$'\n\t'

function strip {
    echo -n "${1//[[:space:]]/}"
}

function get-virtualbox-vm-ip-addr {
    VBoxManage guestproperty get "$1" "/VirtualBox/GuestInfo/Net/0/V4/IP" | awk '{ print $2 }'
}
