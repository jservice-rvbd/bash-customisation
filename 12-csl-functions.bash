#!/usr/bin/env bash

unique-from() {
    local item newlist
    declare -A uniqitems

    # We want the unique items from the colon-separated list
    # in $1, and we want to keep them in order, so no sort|uniq
    while read -d ':' item; do
        if [ -z "$item" ]; then
            continue
        fi
        if [ -z "${uniqitems[$item]}" ]; then
            uniqitems[$item]=1
            newlist="$newlist:$item"
        fi
    done <<< "$1:"

    # Output without the leading colon
    echo "$newlist" | cut -c 2-
}

prepend-unique() {
    local oldlist arglist newlist

    oldlist="$1"; shift
    arglist="$(echo "$@" | awk '{ OFS = ":"; $1 = $1; print $0 }')"
    newlist="$(unique-from "$arglist:$oldlist")"

    echo "$newlist"
}

append-unique() {
    local oldlist arglist newlist

    oldlist="$1"; shift
    arglist="$(echo "$@" | awk '{ OFS = ":"; $1 = $1; print $0 }')"
    newlist="$(unique-from "$oldlist:$arglist")"

    echo "$newlist"
}
