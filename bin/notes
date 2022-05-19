#Simple markdown notes creator and search
NOTES_DIR=/Users/jcteo/Documents/notes/
nts(){
  mkdir -p "${NOTES_DIR%*/}";
	vim $NOTES_DIR"$*".md
}
nls(){
	find $NOTES_DIR -type f | awk '{ gsub("'$NOTES_DIR'", "", $1); gsub(".mkd", "", $1); print $1 }' | grep -i "$*"
}
