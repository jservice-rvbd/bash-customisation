#!/usr/bin/env bash

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
  colorflag="--color"
else # OS X `ls`
  colorflag="-G"
fi

# Always use color output for `ls`
alias ls="command ls ${colorflag}"

# List all files in long format
alias ll='ls -lh'

# List all files in long format, including dot files
alias la="ls -lha"

# List only directories
alias lsd='ls -l | grep "^d"'
