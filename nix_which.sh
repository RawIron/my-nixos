#!/usr/bin/env bash

# nix-which
# resolve the real Nix store binary behind wrappers/symlinks

cmd="$1"

real=$(readlink -f "$(which "$cmd")")
if [[ -x "$real" && "$(head -c2 "$real")" == "#!" ]]; then
  awk '/^exec /{print $2}' "$real" | tr -d '"'
else
  echo "$real"
fi
