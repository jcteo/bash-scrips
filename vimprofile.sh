#VIM profile manager
vimprofile(){
	if [ -n "$1" ]; then
    echo $1 > ~/.vimprofile
    export VIMPROFILE=$1;
  else
    if [ -f ~/.vimprofile ]; then
      export VIMPROFILE=`cat ~/.vimprofile`;
    fi
  fi
  echo "using vimprofile: $VIMPROFILE"
}
