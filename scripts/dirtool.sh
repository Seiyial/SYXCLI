#!/usr/bin/env bash

syxcli_activate_dlink () {
	if [[ $syxdlink_enable == "true" ]] && [[ ! -z $syxdlink_aliases ]] && [[ ! ${#syxdlink_aliases[@]} -eq 0 ]]
	then
		for syxdlink_alias in "${syxdlink_aliases[@]}"
		do
			alias "${syxdlink_alias}"="source $SYXCLI_DIR/scripts/selector.sh"
		done
	else
		syxcli_info "syxdlink_enable not set to true. Skipping syxdlink"
	fi
}