#!/bin/bash
# gex wordpress tasks
GEX_WP_DIR="/var/www/html/gex-wordpress";
WEB_DIR_NAME="web"
WEB_DIR=$GEX_WP_DIR/$WEB_DIR_NAME
CURRENT_DIR=$(pwd)

changeSite(){
  if [ $1 ]
		then
			linkDir $1
			vim $GEX_WP_DIR/wp-config.php
			#TODO
			#change database constants in wp-conf.php
		else
			echo "No se especifico sitio"
  fi
}

changeVersion(){
  if [ $1 ]
		then
			linkWPDir $1
		else
			echo "No se especifico sitio"
  fi
}

installSite(){
	if [ $1 ]
		then
			if [ ! -d sites ]; then
				mkdir sites
			fi
			git clone git@bitbucket.org:gextech/$1.git sites/$1
	fi
}

linkDir(){
  if [ $1 ] 
  then
    cd $WEB_DIR_NAME
    rm wp-content
    ln -s $GEX_WP_DIR/sites/$1/wp-content wp-content
    echo "wp-content linked to:"$GEX_WP_DIR"/sites/"$1"/wp-conten"
  fi
}

linkWPDir(){
  if [ $1 ] 
  then
    cd $GEX_WP_DIR
    rm web
    ln -s $GEX_WP_DIR/wordpress/$1 web
    echo "web linked to:"$GEX_WP_DIR"/wordpress/"$1
  fi
}

cd $GEX_WP_DIR

case $1 in
	use)
		changeSite "${@:2}"
	;;
	wp-use)
		changeVersion "${@:2}"
	;;
	install)
		installSite "${@:2}"
	;;
	list)
		ls -d $GEX_WP_DIR/sites/*/ | xargs -n 1 basename
	;;
	*)
		echo "Usage: gxwp {use|wp-use|install|list}"
esac

cd $CURRENT_DIR
