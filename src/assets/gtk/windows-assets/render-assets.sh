#! /usr/bin/env bash

INKSCAPE="/usr/bin/inkscape"
OPTIPNG="/usr/bin/optipng"

SRC_FILE="windows-assets.svg"
ASSETS_DIR="titlebutton"
INDEX="assets.txt"

# check command avalibility
has_command() {
  "$1" -v $1 > /dev/null 2>&1
}

mkdir -p $ASSETS_DIR

for i in `cat $INDEX` ; do
for d in '' '-dark' ; do

## Normal titlebutton
if [ -f $ASSETS_DIR/$i$d.png ]; then
    echo $ASSETS_DIR/$i$d.png exists.
else
    echo
    echo Rendering $ASSETS_DIR/$i$d.png

    $INKSCAPE --export-id=$i$d \
              --export-id-only \
              --export-filename=$ASSETS_DIR/$i$d.png $SRC_FILE >/dev/null

    $OPTIPNG -o7 --quiet $ASSETS_DIR/$i$d.png 
fi

if [ -f $ASSETS_DIR/$i$d@2.png ]; then
    echo $ASSETS_DIR/$i$d@2.png exists.
else
    echo
    echo Rendering $ASSETS_DIR/$i$d@2.png

      $INKSCAPE --export-id=$i$d \
                --export-dpi=180 \
                --export-id-only \
                --export-filename=$ASSETS_DIR/$i$d@2.png $SRC_FILE >/dev/null

    $OPTIPNG -o7 --quiet $ASSETS_DIR/$i$d@2.png 
fi

done
done
exit 0
