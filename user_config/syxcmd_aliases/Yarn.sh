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

# alias yr='syxalias yarn run $@'
# alias yi='syxalias yarn install'
# alias ys='syxalias yarn start'
# alias yd='syxalias yarn dev'
# alias yc='syxalias yarn console'
# alias yt='syxalias yarn test'
# alias yis='syxalias yarn install && yarn start'
# alias yya='syxalias yarn add $@'
# alias yyga='syxalias yarn global add $@'
# alias yyad='syxalias yarn add --dev $@'
# function yyadt {
# 	foo=$@
# 	syxalias yarn add --dev @types/${foo// / \@types/}
# }
# alias yyr='syxalias yarn remove $@'
# alias yr='syxalias yarn remove $@'

alias yr='syxalias pnpm run $@'
alias yi='syxalias pnpm install'
alias ys='syxalias pnpm start'
alias yd='syxalias pnpm dev'
alias yc='syxalias pnpm console'
alias yt='syxalias pnpm test'
alias yis='syxalias pnpm install && pnpm start'
alias yya='syxalias pnpm add $@'
alias yyag='syxalias pnpm add --global $@'
alias yyad='syxalias pnpm add -D $@'
function yyadt {
	foo=$@
	syxalias pnpm add -D @types/${foo// / \@types/}
}
alias yyr='syxalias pnpm remove $@'
alias yr='syxalias pnpm remove $@'