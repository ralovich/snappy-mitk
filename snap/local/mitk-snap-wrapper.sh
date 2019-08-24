#!/bin/bash

case "$SNAP_ARCH" in
	"amd64") ARCH='x86_64-linux-gnu'
	;;
	*)
		echo "Unsupported architecture for this app build"
		exit 1
	;;
esac

export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$SNAP/usr/lib/MITK-2015.5.0-linux64:$SNAP/usr/lib/MITK-2015.5.0-linux64/plugins"


# set QML2 import path for Qt UI
export QML2_IMPORT_PATH="$QML2_IMPORT_PATH:$SNAP/usr/lib/x86_64-linux-gnu/qt5/qml/"


export QT_QPA_PLATFORM_PLUGIN_PATH=$QT_QPA_PLATFORM_PLUGIN_PATH:$SNAP/usr/lib/x86_64-linux-gnu/qt5/plugins


exec $SNAP/usr/lib/MITK-2015.5.0-linux64/MitkWorkbench  "$@"
