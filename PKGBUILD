_pkgname=${MODULE}-${ADDON}
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
  cd $_pkgname
}

build() {
  cd $_pkgname
}

package() {
  cd $_pkgname
  install -m644 ${srcdir}/modules-load-msr.conf ${pkgdir}/usr/lib/modules-load.d/thermald.conf
  install -m644 ${srcdir}/${_pkgname}/data/thermal-conf.xml ${pkgdir}/etc/${_pkgname}/
}