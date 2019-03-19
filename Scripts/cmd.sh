syxcli_activate_cmd () {
	# requires the setup functions complete, find them in util.sh and run them first.
	# syxcli will run them before running this function
	# requires:
	# - syxcli_info function (modules/syxcli_core/util.sh)
	#   - SYXCLI_VERBOSE variable set (optional)
	# - $SYXCLI_DIR variable set, pointing to the SYXCLI root directory

	if [[ $syxcmd_enable == "true" ]]
	then
		syxcli_info "(cmd.sh) detected \$syxcmd_enable=true, proceed with syxcmd"

		syxcli_cmd_aliases
		syxcli_cmd_scripts
	else
		syxcli_info "(cmd.sh) detected \$syxcmd_enable=false, skip syxcmd"
	fi
}

syxcli_cmd_aliases () {
	if [[ $syxcmd_use_aliases == "true" ]]
	then
		syxcli_info "(cmd.sh/aliases) detected \$syxcmd_use_aliases=true, proceed with SyxCMD Aliases"

		for filename in $SYXCLI_DIR/modules/syxcmd_aliases/*.sh; do
			syxcli_info "Source $filename..."
			source $filename
			[[ $SYXCLI_VERBOSE == "true" ]] && printf " done"
			[[ $SYXCLI_CLOVERS == "true" ]] && printf "🍀  "
		done

		syxcli_info "(cmd.sh/aliases) done sourcing aliases"
	else
		syxcli_info "(cmd.sh) detected \$syxcmd_enable_aliases=false, skip Aliases"
	fi
}

syxcli_cmd_scripts () {
	if [[ $syxcmd_use_scripts == "true" ]]
	then
		syxcli_info "(cmd.sh/scripts) detected \$syxcmd_use_scripts=true, add script path ($SYXCLI_DIR/modules/syxcmd_scripts) to PATH"
		export PATH=$PATH:$SYXCLI_DIR/modules/syxcmd_scripts
		syxcli_info "(cmd.sh/scripts) done appending PATH"
	fi
}