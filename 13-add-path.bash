#!/usr/bin/env bash

add-path() {
    # Add directories to PATH
    PATH=$(prepend-unique "$PATH" "$@")
}
