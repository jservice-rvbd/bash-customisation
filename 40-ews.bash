#!/usr/bin/env bash

# Export workspace variable
export ECLIPSE_WORKSPACE="$HOME/Workspace"

# Change directory to the named eclipse workspace project
ews() {
    # Change directory to a project
    cd "$ECLIPSE_WORKSPACE/$1"
}

# Provide a list of eclipse projects to tab complete ews command
_ews_complete()
{
    local cur_word proj_list

    # COMP_WORDS is an array of words in the current command line.
    # COMP_CWORD is the index of the current word (the one the cursor is
    # in). So COMP_WORDS[COMP_CWORD] is the current word.
    cur_word="${COMP_WORDS[COMP_CWORD]}"

    # Get a list of projects in the eclipse workspace.
    proj_list=$(ls "$ECLIPSE_WORKSPACE")

    # COMPREPLY is the array of possible completions, generated with
    # the compgen builtin.  Complete from the list of eclipse projects.
    COMPREPLY=( $(compgen -W "${proj_list}" -- ${cur_word}) )

    return 0
}

# Register _ews_complete to provide tab completion for ews
complete -F _ews_complete ews
