CLOVERS='false'

SJ_DIRECTORY='/Users/developer/workspace'

for f in $SYX_DIR/scripts/aliases/*; do source $f; if [[ $CLOVERS == 'true' ]] ; then echo -n "🍀  " ; fi; done
if [[ $CLOVERS == 'true' ]] ; then echo "🍀 "; fi

export PATH=$PATH:$SYX_DIR/scripts