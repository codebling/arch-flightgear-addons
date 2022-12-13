_addontype=${ADDON_TYPE}
_addonname=${ADDON_NAME}
_addonfullname=${_addontype}-${_addonname}
_addonfullnameasdir=${_addontype}/${_addonname}
_installdir=${INSTALLDIR-/usr/share/flightgear/data/}
pkgname=flightgear-fgaddon-${_addonfullname}-svn
pkgver=r6967
pkgrel=1
pkgdesc="FlightGear add-ons and aircraft from the FGAddon repo"
arch=(any)
url="https://sourceforge.net/p/flightgear/fgaddon/HEAD/tree/"
license=('GPL2')
depends=()
makedepends=('curl')


pkgver() {
  curl 'https://sourceforge.net/p/flightgear/fgaddon/HEAD/tree/trunk/' -s -L | grep -Eo '\[r[0-9]{4,6}\]' | head -1 | grep -Eo 'r[^]]+'
}

prepare() {
  SESSION_ID=`curl 'https://sourceforge.net/p/flightgear/fgaddon/HEAD/tarball\?path\=/trunk/'"${_addonfullnameasdir}" -vvv -s 2>&1 | grep -Eo '_session_id=[^;]*'`
  FILE_URL=`curl 'https://sourceforge.net/p/flightgear/fgaddon/HEAD/tarball' -d 'path=/trunk/'"${_addonfullnameasdir}" -d _session_id=$SESSION_ID -L -s | grep -Eo 'window.location.href[^;]*;' | grep -Eo 'http[^'\''"]+\.zip'`
  FILE_URL_NO_SPACE=`echo $FILE_URL | sed 's/ /%20/g'`
  curl "$FILE_URL_NO_SPACE" -o ${_addonfullname}.zip
}

build() {
  unzip ${_addonfullname}.zip > /dev/null
  mv flightgear-fgaddon-${pkgver}-trunk-${_addonfullname} ${_addonfullname}
  rm ${_addonfullname}.zip
}

package() {
  mkdir -p ${pkgdir}${_installdir}${_addonfullnameasdir}
  cp -r ${srcdir}/${_addonfullname}/* ${pkgdir}${_installdir}${_addonfullnameasdir}
}
