#!/bin/bash

_printIntro() {
  echo "-------------------- A Xray Script By Mojtaba -------------------"
  echo " Version            : $(_green v2.0)"
  echo " Github             : https://github.com/mojtabaesl/grayvpn"
}

_import() {
  source "$1"
}

_exists() {
  command -v "$1" >/dev/null 2>&1
}

_line() {
  printf "\n%-70s\n\n" "-" | sed 's/\s/-/g'
}

_emptyRow() {
  echo -e ""
}

_red() {
  printf '\033[0;31;31m%b\033[0m' "$1"
}

_green() {
  printf '\033[0;31;32m%b\033[0m' "$1"
}

_yellow() {
  printf '\033[0;31;33m%b\033[0m' "$1"
}

_blue() {
  printf '\033[0;31;36m%b\033[0m' "$1"
}

_neutral() {
  printf "$1"
}
