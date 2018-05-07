
alias gqconv='
echo "  🌃 $(tput setaf 39) 💠  Git Branch Converge 💠" && git merge'

# return current Git branch
alias gcb='git rev-parse --abbrev-ref HEAD' # git current branch

# GIT GRAPH
alias ggraph='git log --graph --full-history --all --color \
        --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'

# alias gbl='git branch -l'
# alias gbl="git for-each-ref --count=20 --sort=-committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"

# alias gbl='for branch in `git branch -l | grep -v HEAD`;do echo -e `git show --format="%ci %cr" $branch | head -n 1` \\t$branch; done | sort -r'

alias gbl="git for-each-ref --count=20 --format='%(authorname),%(color:yellow)%(refname:short)%(color:reset),%(color:green)%(committerdate:relative)%(color:reset)' --sort=-committerdate refs/heads/ | column -t -s ','"

alias ckox="yarn run grecent"
