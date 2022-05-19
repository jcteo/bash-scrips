
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

#Aliases
if [ -f $SCRIPT_DIR/aliases ]; then
  source ./aliases
fi

#Functions
if [ -f $SCRIPT_DIR/functions.sh ]; then
  source $SCRIPT_DIR/functions.sh
fi

export PATH=$SCRIPT_DIR"/bin:"$PATH


