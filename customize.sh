#!/system/bin/sh

ARC=`getprop ro.product.cpu.abi`

ui_print "- AI engine for Android Performance Management"
ui_print "- Beta Stage 3"
ui_print "- Checking Arch.."

if [ "$ARC" == "arm64-v8a" ]; then

ui_print "- 64bit Arch"

unzip -o "$ZIPFILE" AIEX64 -d $MODPATH >&2
unzip -o "$ZIPFILE" service.sh -d $MODPATH >&2
unzip -o "$ZIPFILE" AIE64 -d $MODPATH >&2

file "$MODPATH/AIEX64" >&2
chmod -R 777 "$MODPATH/AIEX64"
chmod -R 755 "$MODPATH/service.sh"
chmod -R 777 "$MODPATH/AIE64"


rm -rf "$MODPATH/AIEX32"
rm -rf "$MODPATH/AIE32"

elif [ "$ARC" == "armeabi-v7a" ]; then

ui_print "- 32bit Arch"

unzip -o "$ZIPFILE" AIEX32 -d $MODPATH >&2
unzip -o "$ZIPFILE" service.sh -d $MODPATH >&2
unzip -o "$ZIPFILE" AIE32 -d $MODPATH >&2

file "$MODPATH/AIEX32" >&2
chmod -R 777 "$MODPATH/AIEX32"
chmod -R 755 "$MODPATH/service.sh"
chmod -R 777 "$MODPATH/AIE32"

rm -rf "$MODPATH/AIEX64"
rm -rf "$MODPATH/AIE64"

else

ui_print "- $ARC"
ui_print "- Device Arch is not supported"
abort

fi