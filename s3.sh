#!/bin/bash
#default
AWS_PROFILE="obras"

while getopts "p:" opt; do
  case $opt in
    p)
      AWS_PROFILE=$OPTARG
      ;;
  esac
done

SITE=$AWS_PROFILE

case $AWS_PROFILE in
  obras)
    SITE="obrasweb"
  ;;
  *)
    SITE=$AWS_PROFILE
  ;;
esac

S3_HOST_SITE="s3.$SITE.mx"

echo "PROFILE: $AWS_PROFILE"
echo "SITE: $SITE"
echo "S3 HOST: $S3_HOST_SITE"

# copy s3 file from production to stage
function baja {
  echo "PATH: $1"
  if [ $1 ]; then
    wget "http://$S3_HOST_SITE/$1" -O /tmp/einflussawss3tmpfile
    aws s3 cp /tmp/einflussawss3tmpfile s3://gex.stage.$AWS_PROFILE/$1 --profile $AWS_PROFILE
  else
    help
  fi
}

function help {
  echo "Usage: s3 baja [-p profile] {url} {s3 path} "
}

echo "Using profile: $AWS_PROFILE"
case $1 in
	baja)
    baja $2
	;;
	*)
    help
esac
