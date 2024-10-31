#!/bin/bash

# Fuzzy search Git branches in a repo
# Looks for local and remote branches
function fsb() {
    local pattern=
    local rebase=0
    local merge=0
    local with_origin=0

    while getopts "rmo" opt; do
        case $opt in
            r) rebase=1 ;;
            m) merge=1 ;;
            o) with_origin=1 ;;
            *) echo "Usage: $0 [-r] [-m] [-o] <pattern>"; return 1;;
        esac
    done

    shift $((OPTIND - 1))

    pattern="$*"

    local branches branch
    branches=$(git branch --all | awk 'tolower($0) ~ /'"$pattern"'/') &&
    branch=$(echo "$branches" |
            fzf-tmux -p --reverse -1 -0 +m) &&
    if [ "$branch" = "" ]; then
        echo "[$0] No branch matches the provided pattern"; return;
    fi
    local branch_name
    branch_name="$(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")"

    local git_command = "git checkout"
    if [ $rebase -eq 1]; then
        git_command = "git rebase"
    fi

    if [$merge -eq 1]; then
        git_command = "git merge"
    fi

    if [$with_origin -eq 1]; then
        git_command = "$git_command origin/"
    fi

    echo

    eval "$git_command$branch_name"
}
fsb "$@"
