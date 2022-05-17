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
	$(if $(BR2_PACKAGE_LIBFTDI1),libftdi1) \
	$(if $(BR2_PACKAGE_LIBUSB),libusb) \
	$(if $(BR2_PACKAGE_LIBUSB_COMPAT),libusb-compat) \
	$(if $(BR2_PACKAGE_LIBHID),libhid) \
	$(if $(BR2_PACKAGE_HIDAPI),hidapi) \
	$(if $(BR2_PACKAGE_LIBGPIOD),libgpiod)

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


define OPENOCD_CYPRESS_TARGET_RENAME
	mv $(TARGET_DIR)/usr/bin/openocd $(TARGET_DIR)/usr/bin/openocd_cypress
endef

OPENOCD_CYPRESS_POST_INSTALL_TARGET_HOOKS += OPENOCD_CYPRESS_TARGET_RENAME

OPENOCD_CYPRESS_BIN_ARCH_EXCLUDE = usr/local/cypress/openocd/share/openocd/flm/cypress/

$(eval $(autotools-package))
