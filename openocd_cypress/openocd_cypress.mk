################################################################################
#
# openocd-cypress
#
################################################################################

OPENOCD_CYPRESS_VERSION = release-v4.3.1
OPENOCD_CYPRESS_SITE = git://github.com/Infineon/openocd.git
OPENOCD_CYPRESS_GIT_SUBMODULES = YES

OPENOCD_CYPRESS_LICENSE = GPL-2.0+
OPENOCD_CYPRESS_LICENSE_FILES = COPYING
# 0002-configure-enable-build-on-uclinux.patch patches configure.ac
OPENOCD_CYPRESS_AUTORECONF = YES
OPENOCD_CYPRESS_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"

OPENOCD_CYPRESS_DEPENDENCIES = \
	host-pkgconf \
	jimtcl \
	libftdi1 \
	libusb \
	libusb-compat \
	libhid \
	hidapi \
	libgpiod

# Adapters
OPENOCD_CYPRESS_CONF_OPTS = \
	--oldincludedir=$(STAGING_DIR)/usr/include \
	--includedir=$(STAGING_DIR)/usr/include \
	--disable-doxygen-html \
	--disable-internal-jimtcl \
	--disable-shared \
	--enable-dummy \
	--disable-werror \
	--prefix=/usr/local/cypress/openocd \
	--enable-ftdi \
	--enable-jlink \
  --enable-kitprog \
	--enable-cmsis-dap 


# Avoid documentation rebuild. On PowerPC64(le), we patch the
# configure script. Due to this, the version.texi files gets
# regenerated, and then since it has a newer date than openocd.info,
# openocd build system rebuilds the documentation. Unfortunately, this
# documentation rebuild fails on old machines. We work around this by
# faking the date of the generated version.texi file, to make the
# build system believe the documentation doesn't need to be
# regenerated.
define OPENOCD_CYPRESS_FIX_VERSION_TEXI
	touch -r $(@D)/doc/openocd.info $(@D)/doc/version.texi
endef

OPENOCD_CYPRESS_POST_BUILD_HOOKS += OPENOCD_CYPRESS_FIX_VERSION_TEXI
HOST_OPENOCD_CYPRESS_POST_BUILD_HOOKS += OPENOCD_CYPRESS_FIX_VERSION_TEXI

define OPENOCD_CYPRESS_TARGET_RENAME
	mv $(TARGET_DIR)/usr/bin/openocd $(TARGET_DIR)/usr/bin/openocd_cypress
endef

OPENOCD_CYPRESS_POST_INSTALL_TARGET_HOOKS += OPENOCD_CYPRESS_TARGET_RENAME

OPENOCD_CYPRESS_BIN_ARCH_EXCLUDE = usr/local/cypress/openocd/share/openocd/flm/cypress/

$(eval $(autotools-package))
