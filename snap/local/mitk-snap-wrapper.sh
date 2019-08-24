#!/bin/bash

case "$SNAP_ARCH" in
	"amd64") ARCH='x86_64-linux-gnu'
	;;
	*)
		echo "Unsupported architecture for this app build"
		exit 1
	;;
esac


export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$SNAP/usr/lib/mitk:$SNAP/usr/lib/mitk/plugins"



exec $SNAP/usr/lib/mitk/MitkWorkbench  "$@"
