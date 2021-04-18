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

alias nodeg='echo "$(syxaliascolour) >> Global NodeJS$(syxaliascolourafter)" && cd ~/.config/yarn/global/node_modules && node'

alias yr='syxalias yarn run $@'
alias yi='syxalias yarn install'
alias ys='syxalias yarn start'
alias yd='syxalias yarn dev'
alias yt='syxalias yarn test'
alias yis='syxalias yarn install && yarn start'
alias yya='syxalias yarn add $@'
alias yyga='syxalias yarn global add $@'
alias yyad='syxalias yarn add --dev $@'
alias yyr='syxalias yarn remove $@'
alias yr='syxalias yarn remove $@'