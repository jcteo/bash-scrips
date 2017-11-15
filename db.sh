#!/bin/bash

STAGE_DB_HOST=dbs.stage.infraops.exp.mx;

if [ $1 ]
  then
    echo "Conectando a $STAGE_DB_HOST...";
    case $1 in
      obras)
        echo "mysql -u dbobras_user -h $STAGE_DB_HOST -p obraseinfluss"
        mysql -u dbobras_user -h "$STAGE_DB_HOST" -p obraseinfluss
        ;;
      idc)
        mysql -u idceinfluss -h "$STAGE_DB_HOST" -p idceinfluss
        ;;
    esac 
else
  echo "No especifico sitio"
fi
