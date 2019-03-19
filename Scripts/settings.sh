syxcli_check_settings_exist () {
	# require $SYXCLI_DIR
	SYXCLI_SETTINGS_EXISTS="false"

	if [ -f $SYXCLI_DIR/SYXCLI_SETTINGS ]
	then
		SYXCLI_SETTINGS_EXISTS=true
		syxcli_info "SYXCLI_SETTINGS exists"
	else
		syxcli_info "SYXCLI_SETTINGS does not exist"
	fi

	if [ -f $SYXCLI_DIR/SYXCLI_SETTINGS_LOCAL ]
	then
		SYXCLI_SETTINGS_EXISTS=true
		syxcli_info "SYXCLI_SETTINGS_LOCAL exists"
	else
		syxcli_info "SYXCLI_SETTINGS_LOCAL does not exist"
	fi

	syxcli_info "Is there at least one settings file? (true or false) : $SYXCLI_SETTINGS_EXISTS"
}

syxcli_help_create_settings_if_need () {
	if [ $SYXCLI_SETTINGS_EXISTS = "false" ] && [ -z $SYXCLI_SILENT ]
	then
		syxcli_info "Detected a need to help create basic settings."
		printf "\n"
		printf "Create new SYXCLI_SETTINGS file? If you're new, you'll need it :)\n        (y/N)\n  >> ✡  "
		read syxcli_choice
		case $syxcli_choice in
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
		syxcli_info "SYXCLI_SETTINGS_EXISTS is not false and/or SYXCLI_SILENT is true"
		syxcli_info "didnt detect a need to assist with creating new settings, continuing"
	fi

	syxcli_info "exiting (syxcli_help_create_settings_if_need)"
}

syxcli_do_new_settings_setup () {
	syxcli_info "Generate new Settings file"
	touch $SYXCLI_DIR/SYXCLI_SETTINGS
	cat $SYXCLI_DIR/modules/syxcli_core/templates/SYXCLI_SETTINGS.template > $SYXCLI_DIR/SYXCLI_SETTINGS

	printf "\nEdit the SYXCLI_SETTINGS file now? Uses vim and we'll proceed after you close the editor. Alternatively, exit the script, edit the ./SYXCLI_SETTINGS and try again.\n        (y/N/exit)\n  >> ✡  "

	read syxcli_choice
	case $syxcli_choice in
		y|Y)
			vim $SYXCLI_DIR/SYXCLI_SETTINGS
			;;
		exit|ex)
			exit 1
			;;
		*)
			;;
	esac

	syxcli_info "exiting (syxcli_do_new_settings_setup)"
}

syxcli_source_settings_if_exist () {
	syxcli_info "running (syxcli_source_settings_if_exist)"
	[ -f $SYXCLI_DIR/SYXCLI_SETTINGS ] && source $SYXCLI_DIR/SYXCLI_SETTINGS
	[ -f $SYXCLI_DIR/SYXCLI_SETTINGS_LOCAL ] && source $SYXCLI_DIR/SYXCLI_SETTINGS_LOCAL
}