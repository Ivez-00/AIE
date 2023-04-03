#!/system/bin/sh
MODPATH=${0%/*}

while [ "$(getprop sys.boot_completed)" != "1" ];
do 
sleep 30
done;

A64T="$MODPATH/AIEX64NT"
A64="$MODPATH/AIEX64"
A6="$MODPATH/AIE64"
SBIN=/system/bin

rm -rf $MODPATH/install

file "$A6" >&2

cp $A6 -t $SBIN

if [ -e "$A64" ]; then

file "$A64" >&2

$A64

elif [ -e "$A64T" ]; then

file "$A64T" >&2

$A64T

fi