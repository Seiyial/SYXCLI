# Core Init
tput setaf 117
if [ -z $SYX_DIR ]; then printf "☔️  SYX_DIR is empty!!! core_init.sh"; fi

if [[ $SYX_PROCESS == 'true' ]]; then printf "🍀  Add SYX default aliases\n"; fi
source $SYX_DIR/scripts/init/init_aliases.sh

if [[ $SYX_PROCESS == 'true' ]]; then printf "🍀  Add SYX helper aliases\n"; fi
source $SYX_DIR/scripts/init/init_helpers.sh

