################################################################################
#
# openocd_ly
#
################################################################################

OPENOCD_LY_VERSION = c3993d3188da5976a64f47d4cbf4d7e5b63f0c8d
OPENOCD_LY_SITE = git://github.com/openocd-org/openocd
OPENOCD_LY_GIT_SUBMODULES = YES
OPENOCD_LY_LICENSE = GPL-2.0+
OPENOCD_LY_LICENSE_FILES = COPYING
# 0002-configure-enable-build-on-uclinux.patch patches configure.ac
OPENOCD_LY_AUTORECONF = YES
OPENOCD_LY_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"

OPENOCD_LY_CONF_OPTS = \
	--oldincludedir=$(STAGING_DIR)/usr/include \
	--includedir=$(STAGING_DIR)/usr/include \
	--disable-doxygen-html \
	--disable-internal-jimtcl \
	--disable-shared \
	--enable-dummy \
	--disable-werror \
	--prefix=/usr/local/openocd-ly

# Rely on the Config.in options of each individual adapter selecting
# the dependencies they need.

OPENOCD_LY_DEPENDENCIES = \
	host-pkgconf \
	jimtcl \
	$(if $(BR2_PACKAGE_LIBFTDI1),libftdi1) \
	$(if $(BR2_PACKAGE_LIBUSB),libusb) \
	$(if $(BR2_PACKAGE_LIBUSB_COMPAT),libusb-compat) \
	$(if $(BR2_PACKAGE_LIBHID),libhid) \
	$(if $(BR2_PACKAGE_HIDAPI),hidapi) \
	$(if $(BR2_PACKAGE_LIBGPIOD),libgpiod)

# Adapters
OPENOCD_LY_CONF_OPTS += \
	$(if $(BR2_PACKAGE_OPENOCD_LY_FTDI),--enable-ftdi,--disable-ftdi) \
	$(if $(BR2_PACKAGE_OPENOCD_LY_STLINK),--enable-stlink,--disable-stlink) \
	$(if $(BR2_PACKAGE_OPENOCD_LY_TI_ICDI),--enable-ti-icdi,--disable-ti-icdi) \
	$(if $(BR2_PACKAGE_OPENOCD_LY_ULINK),--enable-ulink,--disable-ulink) \
	$(if $(BR2_PACKAGE_OPENOCD_LY_UBLASTER2),--enable-usb-blaster-2,--disable-usb-blaster-2) \
	$(if $(BR2_PACKAGE_OPENOCD_LY_JLINK),--enable-jlink,--disable-jlink) \
	$(if $(BR2_PACKAGE_OPENOCD_LY_OSDBM),--enable-osbdm,--disable-osbdm) \
	$(if $(BR2_PACKAGE_OPENOCD_LY_OPENDOUS),--enable-opendous,--disable-opendous) \
	$(if $(BR2_PACKAGE_OPENOCD_LY_AICE),--enable-aice,--disable-aice) \
	$(if $(BR2_PACKAGE_OPENOCD_LY_VSLLINK),--enable-vsllink,--disable-vsllink) \
	$(if $(BR2_PACKAGE_OPENOCD_LY_USBPROG),--enable-usbprog,--disable-usbprog) \
	$(if $(BR2_PACKAGE_OPENOCD_LY_RLINK),--enable-rlink,--disable-rlink) \
	$(if $(BR2_PACKAGE_OPENOCD_LY_XDS110),--enable-xds110,--disable-xds110) \
	$(if $(BR2_PACKAGE_OPENOCD_LY_ARMEW),--enable-armjtagew,--disable-armjtagew) \
	$(if $(BR2_PACKAGE_OPENOCD_LY_CMSIS_DAP),--enable-cmsis-dap,--disable-cmsis-dap) \
	$(if $(BR2_PACKAGE_OPENOCD_LY_PARPORT),--enable-parport,--disable-parport) \
	$(if $(BR2_PACKAGE_OPENOCD_LY_VPI),--enable-jtag_vpi,--disable-jtag_vpi) \
	$(if $(BR2_PACKAGE_OPENOCD_LY_UBLASTER),--enable-usb-blaster,--disable-usb-blaster) \
	$(if $(BR2_PACKAGE_OPENOCD_LY_AMTJT),--enable-amtjtagaccel,--disable-amjtagaccel) \
	$(if $(BR2_PACKAGE_OPENOCD_LY_ZY1000_MASTER),--enable-zy1000-master,--disable-zy1000-master) \
	$(if $(BR2_PACKAGE_OPENOCD_LY_ZY1000),--enable-zy1000,--disable-zy1000) \
	$(if $(BR2_PACKAGE_OPENOCD_LY_EP93XX),--enable-ep93xx,--disable-ep93xx) \
	$(if $(BR2_PACKAGE_OPENOCD_LY_AT91RM),--enable-at91rm9200,--disable-at91rm9200) \
	$(if $(BR2_PACKAGE_OPENOCD_LY_BCM2835),--enable-bcm2835gpio,--disable-bcm2835gpio) \
	$(if $(BR2_PACKAGE_OPENOCD_LY_GW16012),--enable-gw16012,--disable-gw16012) \
	$(if $(BR2_PACKAGE_OPENOCD_LY_PRESTO),--enable-presto,--disable-presto) \
	$(if $(BR2_PACKAGE_OPENOCD_LY_OPENJTAG),--enable-openjtag,--disable-openjtag) \
	$(if $(BR2_PACKAGE_OPENOCD_LY_BUSPIRATE),--enable-buspirate,--disable-buspirate) \
	$(if $(BR2_PACKAGE_OPENOCD_LY_SYSFS),--enable-sysfsgpio,--disable-sysfsgpio)

# Enable all configuration options for host build.
#
# Note that deprecated options have been removed. CMSIS_DAP needs
# hidapi (currently not included in buildroot) and zy1000 stuff fails
# to build, so they've been removed too.
#
HOST_OPENOCD_LY_CONF_OPTS = \
	--enable-ftdi \
	--enable-stlink \
	--enable-ti-icdi \
	--enable-ulink \
	--enable-usb-blaster-2 \
	--enable-jlink \
	--enable-osbdm \
	--enable-opendous \
	--enable-aice \
	--enable-vsllink \
	--enable-usbprog \
	--enable-rlink \
	--enable-armjtagew \
	--enable-parport \
	--enable-jtag_vpi \
	--enable-usb-blaster \
	--enable-amtjtagaccel \
	--enable-gw16012 \
	--enable-presto \
	--enable-openjtag \
	--enable-buspirate \
	--enable-sysfsgpio \
	--oldincludedir=$(HOST_DIR)/include \
	--includedir=$(HOST_DIR)/include \
	--disable-doxygen-html \
	--disable-internal-jimtcl \
	--disable-shared \
	--enable-dummy \
	--disable-werror

HOST_OPENOCD_LY_DEPENDENCIES = host-jimtcl host-libftdi host-libusb host-libusb-compat

define OPENOCD_LY_TARGET_RENAME
	mv $(TARGET_DIR)/usr/bin/openocd $(TARGET_DIR)/usr/bin/openocd_ly
endef

OPENOCD_LY_POST_INSTALL_TARGET_HOOKS += OPENOCD_LY_TARGET_RENAME

$(eval $(autotools-package))
$(eval $(host-autotools-package))
