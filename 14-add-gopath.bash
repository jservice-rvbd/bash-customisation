#!/usr/bin/env bash

add-gopath() {
    declare -a gopaths binpaths

    for path in "$@"; do
        gopaths=( "${gopaths[@]}" "$path" )
        binpaths=( "${binpaths[@]}" "$path/bin" )
    done

    GOPATH=$(prepend-unique "$GOPATH" "${gopaths[@]}")
    PATH=$(prepend-unique "$PATH" "${binpaths[@]}")
}
