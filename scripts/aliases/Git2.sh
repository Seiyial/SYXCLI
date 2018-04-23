
alias grb='git rebase'

alias gqconv='
echo "  🌃 $(tput setaf 39) 💠  Git Branch Converge 💠" && git merge'

alias gcb='git rev-parse --abbrev-ref HEAD' # git current branch

alias ggraph='git log --graph --full-history --all --color \
        --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'
        
alias gbl='git branch -l'