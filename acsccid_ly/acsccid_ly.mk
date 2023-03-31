################################################################################
#
# acsccid-ly
#
################################################################################
ACSCCID_LY_VERSION = a91377331ea75e212d8c220ba96350f9c281b859
ACSCCID_LY_SITE = git://github.com/acshk/acsccid

ACSCCID_LY_DEPENDENCIES = host-pkgconf libusb libusb-compat libusb flex pcsc-lite
ACSCCID_LY_LICENSE = LGPL-2.1
ACSCCID_LY_LICENSE_FILES = COPYING

ACSCCID_LY_INSTALL_STAGING = YES
ACSCCID_LY_AUTORECONF=YES
ACSCCID_LY_AUTORECONF_OPTS=-vi

$(eval $(autotools-package))
