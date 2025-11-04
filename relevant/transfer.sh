#!/usr/bin/bash 

PORT=10203

if [ $# -eq 0 ]; then
	echo "Error: No argument provided"
	echo "Usage: $0 <file_or_directory>"
	exit 1
fi

SRC_DIR=$(pwd)
DEST_DIR="root@localhost:/root/morello-ruby341/build/"

if [ ! -d "$1" ]; then
	echo "transfer file '$1' from '$SRC_DIR' to '$DEST_DIR'"
	scp -P $PORT "$1" "$DEST_DIR"
else
	echo "transfer dir '$1' from '$SRC_DIR' to '$DEST_DIR'"
	scp -r -P $PORT "$1" "$DEST_DIR"
fi
