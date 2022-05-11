################################################################################
#
# openocd-esp32
#
################################################################################

OPENOCD_ESP32_VERSION = v0.10.0-esp32-20201202
OPENOCD_ESP32_SOURCE = v$(OPENOCD_ESP32_VERSION).tar.gz
OPENOCD_ESP32_SITE = git://github.com/espressif/openocd-esp32
OPENOCD_ESP32_GIT_SUBMODULES = YES

OPENOCD_ESP32_AUTORECONF = YES
OPENOCD_ESP32_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
OPENOCD_ESP32_DEPENDENCIES = libusb-compat
OPENOCD_ESP32_DEPENDENCIES += libftdi
OPENOCD_ESP32_DEPENDENCIES += hidapi

OPENOCD_ESP32_CONF_OPTS += --prefix=/usr/local/esp/openocd
OPENOCD_ESP32_CONF_OPTS += --enable-ftdi
OPENOCD_ESP32_CONF_OPTS += --disable-doxygen-html
OPENOCD_ESP32_CONF_OPTS += --includedir=$(STAGING_DIR)/usr/include/libusb-1.0
OPENOCD_ESP32_CONF_OPTS += --with-jim-shared=no
OPENOCD_ESP32_CONF_OPTS += --disable-shared
OPENOCD_ESP32_CONF_OPTS += --enable-dummy
OPENOCD_ESP32_CONF_OPTS += --disable-werror
OPENOCD_ESP32_CONF_OPTS += --disable-internal-jimtcl 


define OPENOCD_ESP32_TARGET_RENAME
	mv $(TARGET_DIR)/usr/bin/openocd $(TARGET_DIR)/usr/bin/openocd_zephyr
endef


OPENOCD_ESP32_PRE_PATCH_HOOKS += OPENOCD_ESP32_BOOTSTRAP
OPENOCD_ESP32_POST_INSTALL_TARGET_HOOKS += OPENOCD_ESP32_TARGET_RENAME

$(eval $(autotools-package))

