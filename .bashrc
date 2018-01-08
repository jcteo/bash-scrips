#Aliases
if [ -f ~/scripts/aliases ]; then
  source ~/scripts/aliases
fi

#Vim
if [ -f ~/scripts/vimprofile.sh ]; then
  source ~/scripts/vimprofile.sh
fi

#Prompt add git branch
RED="\[\033[0;31m\]"
GREEN="\e[96m"
NO_COLOR="\[\033[0m\]"
BLUE="\e[34m"
 
PS1="$GREEN\u@\h:$BLUE\w $RED\$(__git_ps1 '( %s )') $NO_COLOR\$ "
