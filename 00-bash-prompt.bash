#!/usr/bin/env bash

get-colors() {
  local num="$(tput colors 2>/dev/null)"
  if [ $? -eq 0 ]; then
    echo "$num"
  else
    echo 0
  fi
}

if [ $(get-colors) -ge 256 ]; then
  # solarized colours
  # http://ethanschoonover.com/solarized
  default=$(tput sgr0)
  white=$(tput setaf 254)
  red=$(tput setaf 160)
  green=$(tput setaf 64)
  yellow=$(tput setaf 136)
  blue=$(tput setaf 33)
  magenta=$(tput setaf 125)
  cyan=$(tput setaf 37)
  violet=$(tput setaf 61)
elif [ $(get-colors) -ge 8 ]; then
  # basic 8 color palette
  default=$(tput sgr0)
  white=$(tput setaf 0)
  red=$(tput setaf 1)
  green=$(tput setaf 2)
  yellow=$(tput setaf 3)
  blue=$(tput setaf 4)
  magenta=$(tput setaf 5)
  cyan=$(tput setaf 6)
  violet="$red"
else
  # tput not available so use ANSI colors
  default="\033[0m"
  white="\033[1;30m"
  red="\033[1;31m"
  green="\033[1;32m"
  yellow="\033[1;33m"
  blue="\033[1;34m"
  magenta="\033[1;35m"
  cyan="\033[1;36m"
  violet="$red"
fi

PROMPT_USER_COLOR=$magenta
PROMPT_PREPOSITION_COLOR=$default
PROMPT_DEVICE_COLOR=$yellow
PROMPT_DIR_COLOR=$blue
PROMPT_GIT_STATUS_COLOR=$cyan
PROMPT_GIT_PROGRESS_COLOR=$violet
PROMPT_SYMBOL_COLOR=$default

source "$(dirname "${BASH_SOURCE[0]}")/sexy-bash-prompt/prompt.bash"

PS1="${PS1/\\w/\\W}" # replace full pwd with short pwd
