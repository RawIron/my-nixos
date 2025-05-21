#!/usr/bin/env bash

declare -A themes

themes[Breeze-Dark]="
  26292D
  ED1515
  11D116
  F67400
  1E92FF
  9B59B6
  1ABC9C
  EFF0F1
  4F5255
  C0392B
  1CDC9A
  FDBC4B
  3DAEE9
  8E44AD
  16A085
  FCFCFC
  31363B
  EFF0F1
"

themes[i3bar]="
31363b20
ffffff
666666
4c7899
285577
333333
5f676a
222222
888888
2f343a
900000
"


show() {
  local name="$1"; shift
  local colours="$*"

  for color in ${colours}; do
    red="${color:0:2}"
    green="${color:2:2}"
    blue="${color:4:2}"
    printf '\e[38;2;%d;%d;%dm%s\e[0m\n' 0x${red} 0x${green} 0x${blue} \
      "the ${name} theme color ${color} is shown here"
  done
  echo
}

do_all() {
  for name in "${!themes[@]}"; do
    echo "  --- " $name " ---"
    show ${name} ${themes[$name]}
  done
}

do_one() {
  local name="$1"

  if [[ ${themes[$name]} ]]; then
    echo "  --- " $name " ---"
    show ${name} ${themes[$name]}
  fi
}


selected="${1:-"all"}"

if [[ "$selected" == "all" ]]; then
  do_all
else
  do_one "$selected"
fi

