#!/system/bin/sh
MODPATH=${0%/*}

while [ "$(getprop sys.boot_completed)" != "1" ];
do 
sleep 10
done;

A64="$MODPATH/AIEX64"
A32="$MODPATH/AIEX32"
A6="$MODPATH/AIE64"
A3="$MODPATH/AIE32"

SBIN=/system/bin

if [ -e "$A64" ]; then

file "$A64" >&2
$A64
file "$A6" >&2
cp $A6 -t $SBIN

rm -rf "$A32"
rm -rf "$A3"

elif [ -e "$A32" ]; then

file "$A32" >&2
$A32
file "$A3" >&2
cp $A3 -t $SBIN

rm -rf "$A64"
rm -rf "$A6"
fi