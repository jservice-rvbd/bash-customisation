#!/usr/bin/env bash

# Set up Go paths

for goroot in /usr/local/go /usr/local/opt/go/libexec; do
	if [ -d "$goroot" ]; then
		export GOROOT="$goroot"
		add-path "$GOROOT/bin"
		break
	fi
done

export GOPATH="$HOME/go"
add-path "$GOPATH/bin" "$GOROOT/bin"
