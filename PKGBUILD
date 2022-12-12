_addontype=${ADDON_TYPE}
_addonname=${ADDON_NAME}
_pkgname=${_addontype}-${_addonname}
_path=${_addontype}/${_addonname}
_installpath=${INSTALLPATH-/usr/share/flightgear/data/}
pkgname=flightgear-fgaddon-${_pkgname}-svn
pkgver=rXXXX
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
  SESSION_ID=`curl 'https://sourceforge.net/p/flightgear/fgaddon/HEAD/tarball\?path\=/trunk/'$_path -vvv -s 2>&1 | grep -Eo '_session_id=[^;]*'`
  FILE_URL=`curl 'https://sourceforge.net/p/flightgear/fgaddon/HEAD/tarball' -d 'path=/trunk/'$_path -d _session_id=$SESSION_ID -L -s | grep -Eo 'window.location.href[^;]*;' | grep -Eo 'http[^'\''"]+\.zip'`
  curl $FILE_URL -o $_pkgname.zip
}

build() {
  unzip $_pkgname.zip
  mv flightgear-fgaddon-$pkgver-trunk-$_pkgname $_pkgname
}

package() {
  mkdir -p ${pkgdir}${_installpath}${_path}
  cp -rv $srcdir/$_pkgname/* ${pkgdir}${_installpath}${_path}
}
