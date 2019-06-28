#!/bin/bash
# set colors
normal_color="`echo -e '\r   \033[0;0m'`" # normal
# highlight_color="`echo -e '\r\033[1;7m'`" # reverse
highlight_color=" >$(tput bold)"

# keys
up_arrow="`echo -e '\033[A'`" # arrow up
down_arrow="`echo -e '\033[B'`" # arrow down
ec="`echo -e '\033'`"   # escape
enter="`echo -e '\n'`"   # newline

exit_script () {
    tput cnorm
}

get_syxcli_dir () {
    SYXCLI_DIR="/Users/Seiyial/SYX/Apps/SYXCLI"
    # echo "Syxcli dir $SYXCLI_DIR"
    echo ""
}

function syxcli_run_tp {

    num_results=20
    if [ "$1" ]; then
        num_results=$1
    fi

    # result=$(git for-each-ref --count="$num_results" --sort=-authordate:iso8601 refs/heads/ --format='%(color:yellow)%(HEAD) %(refname:short)')

    in_result="$(cat $SYXCLI_DIR/user_config/syxteleport/PROJECT_LIST)"

    # echo $in_result

# in_result="GGI::Users/Seiyial/SYX/WORKS/GGI/GoGiveApp/
# TYMFO::Users/Seiyial/SYX/WORKS/TYMFO/
# Zipline::Users/Seiyial/SYX/CORE/Zipline/
# MDS::Users/Seiyial/SYX/WORKS/MDS/
# SYXCLI::Users/Seiyial/SYX/Apps/SYXCLI/"
    result=${in_result//"/"/"-@slash@-"}

    # echo $result
    # clear

    local target=$(menu "$result")
    # branch=$(extract_branch "$branch")
    # current_branch=$(git rev-parse --abbrev-ref HEAD)
    # if [[ $current_branch != $branch ]]; then
    #     git checkout $branch
    # fi
    target=${target##*:::}

    touch $SYXCLI_DIR/.dirto
    echo $target > $SYXCLI_DIR/.dirto

    tput cnorm
}

function extract_branch {
    echo "$1" | egrep -o " [a-zA-Z0-9-]+" | cut -c 2-
}

# thanks for https://bbs.archlinux.org/viewtopic.php?id=105732 for providing a baseline
function menu {
    IFS=$'\n' read -ra options -d '' <<< "$1"

    num_options="${#options[@]}" # total number of items

    { # capture stdout to stderr

    tput civis # hide cursor

    current_pos=0 # current position

    function go_up() {
      current_pos=$(( current_pos - 1 ))
      if [[ $current_pos == -1 ]]; then
          current_pos=$(( $num_options - 1))
      fi
    }

    function go_down() {
        current_pos=$(( current_pos + 1 ))
        if [[ $current_pos == $(( num_options )) ]]; then
               current_pos=0
          fi
    }

    # figure out starting index
    i=0
    for i in "${!options[@]}"; do
        if [[ ${options[i]} == *'*'* ]]; then
            current_pos=$i
        fi
    done

    end=false

    while ! $end
    do

        for i in `seq 0 $(($num_options - 1))`
        do

            echo -n "$normal_color"
            if [[ $current_pos == $i ]]; then
                echo -ne "\b\b$highlight_color"
            fi
    
            local text=${options[i]}
            display_text1=${text//"-@slash@-"/"/"}
            display_text=${display_text1/":::"/" $(tput setaf 24)"}
            eval 'echo "$(tput setaf 44)  $display_text  $(tput sgr0)         "'
        done

        read -sn 1 key
        if [[ "$key" == "$ec" ]]; then
           read -sn 2 k2
           key="$key$k2"
        fi

        case "$key" in
           "$up_arrow")
                go_up
                ;;
           "k")
                go_up
                ;;

           "$down_arrow")
                go_down
                ;;
           "j")
                go_down
                ;;

           "$enter")
                end=true;;
       esac

       tput cuu $num_options

    done

    tput cud $(( num_options - 1 ))
    tput cnorm # unhide cursor
    echo "$normal_color" # normal colors

    } >&2 # end capture

    echo "${options[current_pos]}"
}

clear
trap exit_script SIGINT SIGTERM
get_syxcli_dir
syxcli_run_tp $@
clear