#!/usr/bin/env bash

# Swap two file(names)
swap() {
    b="$1.$RANDOM"
    mv "$1" "$b"
    mv "$2" "$1"
    mv "$b" "$2"
}

# For when you typed `cd` but didn't mean to
uncd() {
    cd "$OLDPWD"
}
