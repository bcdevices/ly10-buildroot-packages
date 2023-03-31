################################################################################
#
# libnfc-ly
#
################################################################################

LIBNFC_LY_VERSION = f02ff51449240102c27a97173dc495e8e7789046
LIBNFC_LY_SITE = git://github.com/nfc-tools/libnfc
LIBNFC_LY_LICENSE = LGPL-3.0+
LIBNFC_LY_LICENSE_FILES = COPYING
LIBNFC_LY_AUTORECONF = YES
LIBNFC_LY_AUTORECONF_OPTS=-vi

LIBNFC_LY_INSTALL_STAGING = YES

LIBNFC_LY_DEPENDENCIES = host-pkgconf libusb libusb-compat

# N.B. The acr122 driver requires pcsc-lite.
LIBNFC_LY_CONF_OPTS = --with-drivers=arygon,pn53x_usb,acr122_usb,pcsc

$(eval $(autotools-package))
