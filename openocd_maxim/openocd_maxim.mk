################################################################################
#
# openocd-maxim
#
################################################################################

OPENOCD_MAXIM_VERSION = 56a818e4c5a9655980107e576317f7c5ed610292
OPENOCD_MAXIM_SITE = git://github.com/MaximIntegratedMicros/openocd
OPENOCD_MAXIM_GIT_SUBMODULES = YES

OPENOCD_MAXIM_AUTORECONF = YES
OPENOCD_MAXIM_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
OPENOCD_MAXIM_DEPENDENCIES = libusb-compat
OPENOCD_MAXIM_DEPENDENCIES += libftdi
OPENOCD_MAXIM_DEPENDENCIES += jimtcl

OPENOCD_MAXIM_CONF_OPTS += --prefix=/usr/local/maxim/openocd
OPENOCD_MAXIM_CONF_OPTS += --enable-ftdi
OPENOCD_MAXIM_CONF_OPTS += --enable-jlink
OPENOCD_MAXIM_CONF_OPTS += --disable-doxygen-html
OPENOCD_MAXIM_CONF_OPTS += --includedir=$(STAGING_DIR)/usr/include/libusb-1.0
OPENOCD_MAXIM_CONF_OPTS += --disable-shared
OPENOCD_MAXIM_CONF_OPTS += --enable-dummy
OPENOCD_MAXIM_CONF_OPTS += --disable-werror
OPENOCD_MAXIM_CONF_OPTS += --disable-internal-jimtcl 

define OPENOCD_MAXIM_BOOTSTRAP
	rm -rf $(@D)/src/jtag/drivers/libjaylink
	git -C $(@D)/src/jtag/drivers clone http://repo.or.cz/r/libjaylink.git
endef

define OPENOCD_MAXIM_TARGET_RENAME
	mv $(TARGET_DIR)/usr/bin/openocd $(TARGET_DIR)/usr/bin/openocd_maxim
endef


OPENOCD_MAXIM_PRE_PATCH_HOOKS += OPENOCD_MAXIM_BOOTSTRAP
OPENOCD_MAXIM_POST_INSTALL_TARGET_HOOKS += OPENOCD_MAXIM_TARGET_RENAME

$(eval $(autotools-package))
