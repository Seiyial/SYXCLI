# Pulling
alias gpo='
echo "  🌄 $(tput setaf 39 && tput bold) Pulling Origin..." && tput sgr0 && tput setaf 39 && git pull origin'
alias gpod='
echo "  🌃 $(tput setaf 39 && tput bold) △  Checkout △" && tput sgr0 && tput setaf 39 && git checkout develop && echo "  🌄 $(tput setaf 39 && tput bold) Pulling Origin..." && tput sgr0 && tput setaf 39 && git pull origin develop'
alias gpom='
echo "  🌃 $(tput setaf 39 && tput bold) △  Checkout △" && tput sgr0 && tput setaf 39 && git checkout master && echo "  🌄 $(tput setaf 39 && tput bold) Pulling Origin..." && tput sgr0 && tput setaf 39 && git pull origin master'
alias gpos='
echo "  🌃 $(tput setaf 39 && tput bold) △  Checkout △" && tput sgr0 && tput setaf 39 && git checkout staging && echo "  🌄 $(tput setaf 39 && tput bold) Pulling Origin..." && tput sgr0 && tput setaf 39 && git pull origin staging'

alias gs='
echo "  🎇 $(tput setaf 39 && tput bold) Repo Status" && tput sgr0 && tput setaf 39 && git status'
alias gcc='
echo "  🎑 $(tput setaf 39 && tput bold) Full Commit" && tput sgr0 && tput setaf 39 && git add . && git commit -m'
alias gcca='git commit --amend'
alias cko='
echo "  🌃 $(tput setaf 39 && tput bold) △  Checkout △" && tput sgr0 && tput setaf 39 && git checkout'
alias gccp='
echo "  🌃 $(tput setaf 39 && tput bold) Push $(tput setaf 1 && git rev-parse --abbrev-ref HEAD) $(tput setaf 39)to Origin" && tput sgr0 && tput setaf 39 && git push origin'

alias gccpu='
echo "  🌃 $(tput setaf 39 && tput bold) Push $(tput setaf 1 && git rev-parse --abbrev-ref HEAD) $(tput setaf 39)to Origin (new branch)" && tput sgr0 && tput setaf 39 && git push origin -u $(git rev-parse --abbrev-ref HEAD)'

alias gccph='echo "  🌃 $(tput setaf 39 && tput bold) Push $(tput setaf 1 && git rev-parse --abbrev-ref HEAD) $(tput setaf 39)to Origin" && tput sgr0 && tput setaf 39 && git push heroku'

alias gl='git log'
alias glp='git log -p'