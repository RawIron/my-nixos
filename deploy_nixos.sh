#!/usr/bin/env bash

sudo rclone sync ~/workspace/my-nixos /etc/nixos --exclude-from rclone-exclude.txt --verbose
