function syxalias {
	# tput setaf 238 &&
	tput setaf 23 &&
	echo ":: $@" &&
	tput setaf 245 &&
	$@
}
function syxaliascolour {
	tput setaf 23
}
function syxaliascolourafter {
	tput setaf 245
}

# Pulling
alias gpo='syxalias git pull origin'
alias gpod='syxalias git checkout dev && git pull origin dev'
alias gpom='syxalias git checkout master && git pull origin master'
alias gpos='syxalias git checkout staging && git pull origin staging'
alias gs='syxalias git status'
function gcc {
	echo "$(syxaliascolour)>> Git Commit All -m \"$1\"$(syxaliascolourafter)"
	# syxalias git add . && git commit -m $1
	git add . && git commit -m $1
}
function gccx {
	echo "$(syxaliascolour)>> Git Commit All $(syxaliascolourafter)"
	# syxalias git add . && git commit -m $1
	git add . && git commit
}
alias gcx='syxalias git commit'
alias gcca='git commit --amend'
alias cko='syxalias git checkout $@'
function gccp {
	br="$(git rev-parse --abbrev-ref HEAD)"
	echo "$(syxaliascolour):: git push origin $(tput setaf 39)$br"
	syxaliascolour
	git push origin $br
}
function gccpu {
	br="$(git rev-parse --abbrev-ref HEAD)"
	echo "$(syxaliascolour):: git push origin $(tput setaf 39)--set-upstream $(tput setaf 39)$br"
	syxaliascolour
	git push origin --set-upstream $br
}
# alias gccp='syxalias 
# echo "  🌃 $(tput setaf 39 && tput bold) Push $(tput setaf 1 && git rev-parse --abbrev-ref HEAD) $(tput setaf 39)to Origin" && tput sgr0 && tput setaf 39 && git push origin'

# alias gccpu='
# echo "  🌃 $(tput setaf 39 && tput bold) Push $(tput setaf 1 && git rev-parse --abbrev-ref HEAD) $(tput setaf 39)to Origin (new branch)" && tput sgr0 && tput setaf 39 && git push origin -u $(git rev-parse --abbrev-ref HEAD)'

# alias gccph='echo "  🌃 $(tput setaf 39 && tput bold) Push $(tput setaf 1 && git rev-parse --abbrev-ref HEAD) $(tput setaf 39)to Origin" && tput sgr0 && tput setaf 39 && git push heroku'

alias gl='syxalias git log'
alias glp='syxalias git log -p'


alias gqconv='
echo "  🌃 $(tput setaf 39) 💠  Git Branch Converge 💠" && git merge'

# return current Git branch
alias gcb='git rev-parse --abbrev-ref HEAD' # git current branch

# GIT GRAPH
alias ggraph='git log --graph --full-history --all --color \
        --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"'

alias gbl="echo '$(syxaliascolour)  { git branch LIST }$(syxaliascolourafter)' && git for-each-ref --count=20 --format='%(authorname),%(color:yellow)%(refname:short)%(color:reset),%(color:green)%(committerdate:relative)%(color:reset)' --sort=-committerdate refs/heads/ | column -t -s ','"

alias ckox="yarn run grecent"