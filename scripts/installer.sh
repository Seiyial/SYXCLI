

syxcli_install_ask_method () {
	read syxcli_install_choice
	syxcli_run_installer
}

syxcli_run_installer () {
	case "$syxcli_install_choice" in
		1)
			syxcli_install_ask_rc_file
			[[ -z $syxcli_rc_file_alias ]] && syxcli_install_ask_rc_file_alias
			syxcli_install_type_autorun
			;;
		2)
			syxcli_install_ask_rc_file
			[[ -z $syxcli_rc_file_alias ]] && syxcli_install_ask_rc_file_alias
			syxcli_install_type_aliasscript
			;;
		3)
			syxcli_install_show_docs
			;;
		skip)
			;;
		"")
			clear
			echo -n "

SYXCLI Installation

There are a few ways to install SYXCLI.

(Method 1)
Set it up to activate Automatically on the start of the
shell session, using ~/.bash_profile or ~/.zshrc.

(Method 2)
Create an alias in ~/.bash_profile or ~/.zshrc that you can call
when you'd like. Calling the alias would activate SYXCLI.

(Method 3)
Don't do anything (instructions will be provided
on how to activate SYXCLI)

   (1/2/3/skip)
>> ✡  "
			syxcli_install_ask_method
			;;
		*)
			echo -n "
Nani?
   (1/2/3/skip)
>> ✡  "
			syxcli_install_ask_method
			;;
	esac
}

syxcli_install_show_docs () {
	echo "U/C"
}

syxcli_install_ask_rc_file_alias () {
	if [[ $syxcli_install_choice == "1" ]]
	then
		echo -n "

Please enter the value of the command with which you can globally run SYXCLI. Default: 'syxcli'
>> ✡  "
	else
		echo -n "

Please enter the value of the command with which you'd like to activate SYXCLI. Default: 'syxcli'
>> ✡  "
	fi
	read syxcli_rc_file_alias
	[[ -z $syxcli_rc_file_alias ]] && syxcli_rc_file_alias="syxcli"
}

syxcli_install_ask_rc_file () {
	syxcli_install_rc_filepath=""
			echo -n "

Please enter the location of your RC file.
- if using bash on Linux, it's probably ~/.bashrc.
- if using bash on Mac or WSL, it's probably ~/.bash_profile.
- if using zsh, it's probably ~/.zshrc.

>> ✡  "
	read syxcli_install_rc_filepath
	if [[ -f $syxcli_install_rc_filepath ]]
	then
		echo "

This file doesn't exist. Perhaps it's a typo. If you are sure, go create it first before trying again.
(Retrying. To quit instead, use Ctrl+C)
	"
		syxcli_install_ask_rc_file
	fi
}

syxcli_install_type_autorun () {
	syxcli_info "Running (syxcli_install_type_autorun)"
	
	# replace ~ with $HOME
	syxcli_tilde="~"
	syxcli_info "Replace RC Filepath $syxcli_install_rc_filepath ~ to $HOME"
	syxcli_install_rc_filepath=${syxcli_install_rc_filepath/\~/$HOME}
	syxcli_info "RC filepath is now $syxcli_install_rc_filepath"

	echo "" >> $syxcli_install_rc_filepath
	echo "# SYXCLI: Activate CLI Tools" >> $syxcli_install_rc_filepath
	echo "SYXCLI_DIR='$SYXCLI_DIR'" >> $syxcli_install_rc_filepath
	echo "source \$SYXCLI_DIR/bin/syxcli autorun --clovers --from-rc" >> $syxcli_install_rc_filepath
	echo "alias $syxcli_rc_file_alias='source $SYXCLI_DIR/bin/syxcli'" >> $syxcli_install_rc_filepath
	echo "" >> $syxcli_install_rc_filepath
	syxcli_info "Installed (syxcli_install_type_autorun)"

	echo "

INSTALLATION COMPLETE! Start a new shell session or run the following to start immediately.
\$ source $SYXCLI_DIR/syxcli autorun --clovers"
}

syxcli_install_type_aliasscript () {
	syxcli_info "Running (syxcli_install_type_autorun)"

	# replace ~ with $HOME
	syxcli_tilde="~"
	syxcli_info "Replace RC Filepath $syxcli_install_rc_filepath ~ to $HOME"
	syxcli_install_rc_filepath="${syxcli_install_rc_filepath/\~/$HOME}"
	syxcli_info "RC filepath is now $syxcli_install_rc_filepath"

	echo "alias $syxcli_rc_file_alias='source $SYXCLI_DIR/bin/syxcli autorun --clovers --verbose'" >> $syxcli_install_rc_filepath
	syxcli_info "Installed (syxcli_install_type_autorun)"

	echo "

INSTALLATION COMPLETE! Start a new shell session or run the following to start immediately.
\$ source $SYXCLI_DIR/syxcli autorun --clovers"
}
