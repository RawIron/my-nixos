#!/usr/bin/env bash

extra_opts="$*"

sudo rclone sync ~/workspace/my-nixos /etc/nixos --exclude-from rclone-exclude.txt --verbose ${extra_opts}
