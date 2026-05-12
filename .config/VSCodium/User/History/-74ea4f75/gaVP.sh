#!/usr/bin/env bash

if pgrep -u "$USER" -x systemd-inhibit >/dev/null && \
   pgrep -u "$USER" -af "^systemd-inhibit --what=idle sleep infinity$" >/dev/null; then
    echo true
else
    echo false
fi