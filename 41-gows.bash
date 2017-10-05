#!/usr/bin/env bash

# Change to eclipse go project and set GOPATH accordingly
gows() {
    # Change directory to a project
    ews "$1"

    # Set the current directory as the primary gopath
    add-gopath "$(pwd)"

    # If we can unambiguously determine a go import for the project
    # then change directory to it.  Otherwise change directory to src
    # so that we can tell from PS1 whether or not we found the repo
    local matched_repos=( $(find . -depth 4 -name $1) )
    if [ "${#matched_repos[@]}" == 1 ]; then
        cd "${matched_repos[0]}"
    else
        mkdir -p src
        cd src
    fi
}

# Register _ews_complete to provide completion gows also
complete -F _ews_complete gows
