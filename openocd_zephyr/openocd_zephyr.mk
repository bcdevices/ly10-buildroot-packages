################################################################################
#
# openocd-zephyr
#
################################################################################

# sdk-ng v1.16.1
OPENOCD_ZEPHYR_VERSION = e2b6f5655e2ccd354fb8c7d0f53b93f4cb42a4f4

# sdk-ng v1.15.1
#OPENOCD_ZEPHYR_VERSION = c5c47943dbd036079d96fe49ea9092f78abec427

# sdk-ng v1.15.0
#OPENOCD_ZEPHYR_VERSION = 42b6471c1f6c3236ec762e9a4fde62c84ab6861d

# sdk-ng v1.14.2
#OPENOCD_ZEPHYR_VERSION = af169e805396e5f7ab926aa32ba293a618a894f7

OPENOCD_ZEPHYR_SITE = git://github.com/zephyrproject-rtos/openocd.git
OPENOCD_ZEPHYR_GIT_SUBMODULES = YES

OPENOCD_ZEPHYR_AUTORECONF = YES
OPENOCD_ZEPHYR_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
OPENOCD_ZEPHYR_DEPENDENCIES = libusb-compat
OPENOCD_ZEPHYR_DEPENDENCIES += libftdi
OPENOCD_ZEPHYR_DEPENDENCIES += hidapi
OPENOCD_ZEPHYR_DEPENDENCIES += jimtcl

OPENOCD_ZEPHYR_CONF_OPTS += --prefix=/usr/local/zephyr/openocd
OPENOCD_ZEPHYR_CONF_OPTS += --enable-ftdi
OPENOCD_ZEPHYR_CONF_OPTS += --disable-doxygen-html
OPENOCD_ZEPHYR_CONF_OPTS += --enable-cmsis-dap
OPENOCD_ZEPHYR_CONF_OPTS += --enable-jlink
OPENOCD_ZEPHYR_CONF_OPTS += --enable-stlink
OPENOCD_ZEPHYR_CONF_OPTS += --includedir=$(STAGING_DIR)/usr/include/libusb-1.0
OPENOCD_ZEPHYR_CONF_OPTS += --disable-shared
OPENOCD_ZEPHYR_CONF_OPTS += --enable-dummy
OPENOCD_ZEPHYR_CONF_OPTS += --disable-werror
OPENOCD_ZEPHYR_CONF_OPTS += --disable-internal-jimtcl 


define OPENOCD_ZEPHYR_BOOTSTRAP
	rm -rf $(@D)/src/jtag/drivers/libjaylink
	git -C $(@D)/src/jtag/drivers clone http://repo.or.cz/r/libjaylink.git
endef

define OPENOCD_ZEPHYR_TARGET_RENAME
	mv $(TARGET_DIR)/usr/bin/openocd $(TARGET_DIR)/usr/bin/openocd_zephyr
endef

OPENOCD_ZEPHYR_PRE_PATCH_HOOKS += OPENOCD_ZEPHYR_BOOTSTRAP 

OPENOCD_ZEPHYR_POST_INSTALL_TARGET_HOOKS += OPENOCD_ZEPHYR_TARGET_RENAME

$(eval $(autotools-package))
