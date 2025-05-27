#!/usr/bin/env bash

sudo rclone check ~/workspace/my-nixos /etc/nixos --exclude-from rclone-exclude.txt --verbose
