#!/usr/bin/env bash

# Set up Go paths
export GOPATH="$HOME/go"
export GOROOT="/usr/local/opt/go/libexec"
add-path "$GOPATH/bin" "$GOROOT/bin"
