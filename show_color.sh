#!/usr/bin/env bash

theme_name="Breeze-Dark"

colors="
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

for color in ${colors}; do
  red="${color:0:2}"
  green="${color:2:2}"
  blue="${color:4:2}"
  printf '\e[38;2;%d;%d;%dm%s\e[0m\n' 0x${red} 0x${green} 0x${blue} \
    "the ${theme_name} theme colors are shown here"
done

