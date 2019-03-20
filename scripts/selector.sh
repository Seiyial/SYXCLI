#!/usr/bin/env bash

# Renders a text based list of options that can be selected by the
# user using up, down and enter keys and returns the chosen option.
#
#   Arguments   : list of options, maximum of 256
#                 "opt1" "opt2" ...
#   Return value: selected index (0 for opt1, 1 for opt2 ...)
syxdlk_selector () {

    # little helpers for terminal print control and key input
    ESC=$( printf "\033")
    cursor_blink_on()  { printf "$ESC[?25h"; }
    cursor_blink_off() { printf "$ESC[?25l"; }
    cursor_to()        { printf "$ESC[$1;${2:-1}H"; }
    print_option()     { printf "                                                                  \r    $1 $(tput setaf 240)$2$(tput sgr0)"; }
    print_selected()   { printf "\r $(tput setaf 37)$ESC[1m { $1 } $(tput sgr0)$(tput setaf 24)$2 $ESC[27m$(tput sgr0)"; }
    get_cursor_row()   { IFS=';' read -sdR -p $'\E[6n' ROW COL; echo ${ROW#*[}; }
    key_input()        { read -s -n3 key 2>/dev/null >&2
                         if [[ $key = "$ESC[A" ]]; then echo up;    fi
                         if [[ $key = "$ESC[B" ]]; then echo down;  fi
                         if [[ $key = ""     ]]; then echo enter; fi; }

    # initially print empty new lines (scroll down if at bottom of screen)
    for opt; do printf "\n"; done

    # determine current screen position for overwriting the options
    local lastrow=`get_cursor_row`
    local startrow=$(($lastrow - $#))

    # ensure cursor and input echoing back on upon a ctrl+c during read -s
    trap "cursor_blink_on; stty echo; printf '\n'; exit" 2
    cursor_blink_off

    local selected=0
    while true; do
        # print options by overwriting the last lines
        local idx=0
        for opt; do
            cursor_to $(($startrow + $idx))
            syxdlk_optname="$(cut -d "|" -f 1 <<< "$opt")"
            syxdlk_optpath="$(cut -d "|" -f 2 <<< "$opt")"
            if [ $idx -eq $selected ]; then
                print_selected "$syxdlk_optname" "$syxdlk_optpath"
            else
                print_option "$syxdlk_optname" "$syxdlk_optpath"
            fi
            ((idx++))
        done

        # user key control
        case `key_input` in
            enter) break;;
            up)    ((selected--));
                   if [ $selected -lt 0 ]; then selected=$(($# - 1)); fi;;
            down)  ((selected++));
                   if [ $selected -ge $# ]; then selected=0; fi;;
        esac
    done

    # cursor position back to normal
    cursor_to $lastrow
    printf "\n"
    cursor_blink_on

    return $selected
}

syxcli_get_dir_rm_scripts () {
   # see bin/syxcli for explanation on this script
   # https://stackoverflow.com/questions/59895/get-the-source-directory-of-a-bash-script-from-within-the-script-itself
   SYXCLI_UTIL_BASHSOURCE="${BASH_SOURCE[0]}"
   while [ -h "$SOURCE" ]; do
      SYXCLI_DIR="$( cd -P "$( dirname "$SYXCLI_UTIL_BASHSOURCE" )" >/dev/null 2>&1 && pwd )"
      SYXCLI_UTIL_BASHSOURCE="$(readlink "$SYXCLI_UTIL_BASHSOURCE")"
      [[ $SYXCLI_UTIL_BASHSOURCE != /* ]] && SYXCLI_UTIL_BASHSOURCE="$SYXCLI_DIR/$SYXCLI_UTIL_BASHSOURCE"
   done
   SYXCLI_DIR="$( cd -P "$( dirname "$SYXCLI_UTIL_BASHSOURCE" )" >/dev/null 2>&1 && pwd )"

   syxcli_scripts="/scripts"
   SYXCLI_DIR=${SYXCLI_DIR%"$syxcli_scripts"}
   echo $SYXCLI_DIR
}

[[ -z $SYXCLI_DIR ]] && syxcli_get_dir_rm_scripts
syxdlk_folders="$SYXCLI_DIR/SYXDLINK_PROJECTLIST"
clear
echo $syxdlk_folders

echo ""
syxdlk_options=()
while IFS= read -r line; do
  syxdlk_options+=("$line")
done < "$syxdlk_folders"

syxdlk_selector "${syxdlk_options[@]}"
syxdlk_choice=$?

syxdlk_target="${syxdlk_options[$syxdlk_choice]}"

syxdlk_target_name="$(cut -d "|" -f 1 <<< "$syxdlk_target")"
syxdlk_target_path="$(cut -d "|" -f 2 <<< "$syxdlk_target")"
# syxdlk_target_path="${syxdlk_target_path/\~/$HOME}"

clear
echo "from `pwd`"
cd "$syxdlk_target_path"
echo "to `pwd`"

ls