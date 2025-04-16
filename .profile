# Scripts path
export PATH="$HOME/.local/bin:$PATH"

# Critical tool shortcuts
alias v="vim"
alias g="git"
alias y="yarn"
alias np="npm"
alias p="pnpm"
alias nd="node"
alias e="ember"

# Add the following line (without #) to your git-completion.bash to enable autocompletion with the 'g' alias
# __git_complete g __git_main

# Yarn related commands

alias yb="yarn build"
alias ys="yarn start"
alias yfi="yarn install --force"
alias yi="yarn install"
alias ylk="yarn link"
alias yulk="yarn unlink"

# Pnpm

alias ps="pnpm run start"
alias pb="pnpm run build"
alias pi="pnpm install"

# Ember

alias es="ember serve"

# General Workflow streamlining

# Usage hgrep [search term]
alias hgrep = history | grep

# Git workflow streamlining

alias fzb="~/.local/bin/fsb.sh"

# Git shorthand aliases

alias gpr="git pull --rebase"
alias gm="git merge"
alias gri="git rebase -i"
alias gc="git commit"
alias gpo="git push origin"
alias gchb="git checkout -b"
alias gch="git checkout"
alias gsu="git branch --set-upstream-to-origin"
alias gre="git reset"
alias gres="git reset --soft" #Add head~ at the end of line
alias greh"git reset --hard" #Add head~ at the end of line
alias gcp "git cherry-pick" #add commit hash
