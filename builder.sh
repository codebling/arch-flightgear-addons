#!/bin/sh
# Flightgear Addons downloader and Arch package builder
# This script relies on screen-scraping SourceForge, and as such might not be stable

ADDON_MODULES=`curl 'https://sourceforge.net/p/flightgear/fgaddon/HEAD/tree/trunk/' -s -L | grep fa-folder | sed -E 's/.*href="([^"]*)".*/\1/' | grep -vE '^[./]*$'`

#echo Available addon modules: $ADDON_MODULES

for m in $ADDON_MODULES; do 
  items=`curl 'https://sourceforge.net/p/flightgear/fgaddon/HEAD/tree/trunk/'$m -s -L | grep fa-folder | sed -E 's/.*href="([^"]*)".*/\1/' | grep -vE '^[./]*$'`
  for i in $items; do echo $m/$i; done;
done
