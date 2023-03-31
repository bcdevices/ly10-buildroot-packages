################################################################################
#
# acsccid-ly
#
################################################################################
ACSCCID_LY_VERSION= 1.1.9
ACSCCID_LY_SITE = $(call github,acshk,acsccid,v$(ACSCCID_LY_VERSION))

ACSCCID_LY_DEPENDENCIES = host-pkgconf libusb libusb-compat libusb flex pcsc-lite
ACSCCID_LY_LICENSE = LGPL-2.1
ACSCCID_LY_LICENSE_FILES = COPYING

ACSCCID_LY_INSTALL_STAGING = YES
ACSCCID_LY_AUTORECONF=YES
ACSCCID_LY_AUTORECONF_OPTS=-vi

$(eval $(autotools-package))
