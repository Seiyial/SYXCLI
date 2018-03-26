echo "" # line break

for f in $SYX_DIR/scripts/aliases/*; do source $f; if [[ $CLOVERS == 'true' ]] ; then echo -n "🍀  " ; fi; done
if [[ $CLOVERS == 'true' ]] ; then echo "🍀 "; fi

export PATH=$PATH:$SYX_DIR/scripts