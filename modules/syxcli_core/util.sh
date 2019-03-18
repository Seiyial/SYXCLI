#!/usr/bin/env bash

syxcli_verbose () {
	[ -z $SYXCLI_VERBOSE ] || echo "<ЖCLI> $1"
}

syxcli_get_dir () {
	# https://stackoverflow.com/questions/59895/get-the-source-directory-of-a-bash-script-from-within-the-script-itself
	# This function returns the Directory of the file in which it is called
	# and assigns it to $SYXCLI_DIR.
	SYXCLI_UTIL_BASHSOURCE="${BASH_SOURCE[0]}"
	while [ -h "$SOURCE" ]; do
		# resolve $SYXCLI_UTIL_BASHSOURCE until the file is no longer a symlink
		SYXCLI_DIR="$( cd -P "$( dirname "$SYXCLI_UTIL_BASHSOURCE" )" >/dev/null 2>&1 && pwd )"
		SYXCLI_UTIL_BASHSOURCE="$(readlink "$SYXCLI_UTIL_BASHSOURCE")"
		[[ $SYXCLI_UTIL_BASHSOURCE != /* ]] && SYXCLI_UTIL_BASHSOURCE="$SYXCLI_DIR/$SYXCLI_UTIL_BASHSOURCE"
		# if $SOURCE was a relative symlink, we need to resolve it relative
		# to the path where the symlink file was located
	done

	SYXCLI_DIR="$( cd -P "$( dirname "$SYXCLI_UTIL_BASHSOURCE" )" >/dev/null 2>&1 && pwd )"
	syxcli_verbose "Set SYXCLI_DIR to \"$SYXCLI_DIR\" (syxcli_get_dir)"
}

syxcli_get_dir_rm_bin () {
	syxcli_get_dir
	SYXCLI_UTIL_DIR_SUFFIX="/bin"
	SYXCLI_DIR=${SYXCLI_DIR%"$SYXCLI_UTIL_DIR_SUFFIX"}
	syxcli_verbose "Set SYXCLI_DIR to \"$SYXCLI_DIR\" (syxcli_get_dir_rm_bin)"
}

syxcli_check_settings_exist () {
	# require $SYXCLI_DIR

	SYXCLI_SETTINGS_EXISTS="false"

	if [ -f $SYXCLI_DIR/SYXCLI_SETTINGS ]
	then
		SYXCLI_SETTINGS_EXISTS=true
		syxcli_verbose "SYXCLI_SETTINGS exists"
	else
		syxcli_verbose "SYXCLI_SETTINGS does not exist"
	fi

	if [ -f $SYXCLI_DIR/SYXCLI_SETTINGS_LOCAL ]
	then
		SYXCLI_SETTINGS_EXISTS=true
		syxcli_verbose "SYXCLI_SETTINGS_LOCAL exists"
	else
		syxcli_verbose "SYXCLI_SETTINGS_LOCAL does not exist"
	fi

	syxcli_verbose "Is there at least one settings file? (true or false) : $SYXCLI_SETTINGS_EXISTS"
}

syxcli_help_create_settings_if_need () {
	if [ $SYXCLI_SETTINGS_EXISTS = "false" ] && [ -z $SYXCLI_SILENT ]
	then
		syxcli_verbose "Detected a need to help create basic settings."
		printf "\n"
		printf "Create new SYXCLI_SETTINGS file? If you're new, you'll need it :)\n        (y/N)\n  >> ✡  "
		read SYXCLI_CHOICE
		case $SYXCLI_CHOICE in
			y|Y)
				syxcli_do_new_settings_setup
				;;
			n|N)
				echo "Alright let's continue"
				;;
			exit|ex)
				exit 1
				;;
			*) echo "eh... nani? (please reply Yes or No, you replied $REPLY)";;
		esac
	else
		syxcli_verbose "SYXCLI_SETTINGS_EXISTS is not false and/or SYXCLI_SILENT is true"
		syxcli_verbose "didnt detect a need to assist with creating new settings, continuing"
	fi

	syxcli_verbose "exiting (syxcli_help_create_settings_if_need)"
}

syxcli_do_new_settings_setup () {
	syxcli_verbose "Generate new Settings file"
	touch $SYXCLI_DIR/SYXCLI_SETTINGS
	cat $SYXCLI_DIR/modules/syxcli_core/templates/SYXCLI_SETTINGS.template > $SYXCLI_DIR/SYXCLI_SETTINGS

	printf "\nEdit the SYXCLI_SETTINGS file now? Uses vim and we'll proceed after you close the editor. Alternatively, exit the script, edit the ./SYXCLI_SETTINGS and try again.\n        (y/N/exit)\n  >> ✡  "

	read SYXCLI_CHOICE
	case $SYXCLI_CHOICE in
		y|Y)
			vim $SYXCLI_DIR/SYXCLI_SETTINGS
			;;
		exit|ex)
			exit 1
			;;
		*)
			;;
	esac

	syxcli_verbose "exiting (syxcli_do_new_settings_setup)"
}

syxcli_source_settings_if_exist () {
	syxcli_verbose "running (syxcli_source_settings_if_exist)"
	[ -f $SYXCLI_DIR/SYXCLI_SETTINGS ] && source $SYXCLI_DIR/SYXCLI_SETTINGS
	[ -f $SYXCLI_DIR/SYXCLI_SETTINGS_LOCAL ] && source $SYXCLI_DIR/SYXCLI_SETTINGS_LOCAL
}