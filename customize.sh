#!/system/bin/sh

ARC=`getprop ro.product.cpu.abi`

ui_print "- AI engine for Android Performance Management"
ui_print "- Beta Stage 2"
ui_print "- Checking Arch.."

if [ "$ARC" == "arm64-v8a" ]; then

ui_print "- 64bit Arch"

unzip -o "$ZIPFILE" AIEX64 -d $MODPATH >&2
unzip -o "$ZIPFILE" service.sh -d $MODPATH >&2

file "$MODPATH/AIEX64" >&2
chmod -R 777 "$MODPATH/AIEX64"
chmod -R 755 "$MODPATH/service.sh"

rm -rf "$MODPATH/AIEX32"

elif [ "$ARC" == "armeabi-v7a" ]; then

ui_print "- 32bit Arch"

unzip -o "$ZIPFILE" AIEX32 -d $MODPATH >&2
unzip -o "$ZIPFILE" service.sh -d $MODPATH >&2

file "$MODPATH/AIEX32" >&2
chmod -R 777 "$MODPATH/AIEX32"
chmod -R 755 "$MODPATH/service.sh"

rm -rf "$MODPATH/AIEX64"
fi