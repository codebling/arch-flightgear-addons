ADDONFULLNAMESASDIRS=`sh ./builder.sh`

for a in $ADDONFULLNAMESASDIRS; do 
#for a in Aircraft/747-200; do 
  ADDON_TYPE=`echo $a | sed -E 's|/.*$||'`
  ADDON_NAME=`echo $a | sed -E 's|^.*/||'`
  echo $ADDON_TYPE $ADDON_NAME
  . ./PKGBUILD
  pkgver=`pkgver`
  prepare
  sleep 10s
done