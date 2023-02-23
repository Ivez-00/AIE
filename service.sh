#!/system/bin/sh
MODPATH=${0%/*}

while [ "$(getprop sys.boot_completed)" != "1" ];
do 
sleep 10
done;

A64="$MODPATH/AIEX64"
A32="$MODPATH/AIEX32"

if [ -e "$A64" ]; then

file "$MODPATH/AIEX64" >&2
$MODPATH/AIEX64
rm -rf "$A32"

elif [ -e "$A32" ]; then

file "$MODPATH/AIEX32" >&2
$MODPATH/AIEX32
rm -rf "$A64"
fi