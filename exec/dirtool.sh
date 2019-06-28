#!/usr/bin/env bash

syxcli_activate_dlink () {
	if [[ $syxdlink_enable == "true" ]] && [[ ! -z $syxdlink_aliases ]] && [[ ! ${#syxdlink_aliases[@]} -eq 0 ]]
	then
		for syxdlink_alias in "${syxdlink_aliases[@]}"
		do
			# alias "${syxdlink_alias}"="source $SYXCLI_DIR/exec/selector.sh"
			alias "${syxdlink_alias}"='$SYXCLI_DIR/exec/tp.sh && cd "$(cat $SYXCLI_DIR/.dirto)"; rm -rf $SYXCLI_DIR/.dirto'
		done
	else
		syxcli_info "syxdlink_enable not set to true. Skipping syxdlink"
	fi
}