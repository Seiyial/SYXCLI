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