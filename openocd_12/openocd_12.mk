################################################################################
#
# openocd
#
################################################################################

OPENOCD_12_VERSION = 0.12.0
OPENOCD_12_SOURCE = openocd-$(OPENOCD_12_VERSION).tar.bz2
OPENOCD_12_SITE = http://sourceforge.net/projects/openocd/files/openocd/$(OPENOCD_12_VERSION)
OPENOCD_12_LICENSE = \
	BSD-1-clause, \
	BSD-2-clause, \
	BSD-2-Clause-Views, \
	BSD-3-clause, \
	BSD-Source-Code, \
	GFDL-1.2-no-invariants-or-later (docs), \
	GPL-2.0+ with eCos-exception-2.0 (code), \
	GPL-3.0+ (stand-alone code), \
	MIT

OPENOCD_12_LICENSE_FILES = \
	COPYING \
	LICENSES/license-rules.txt \
	LICENSES/exceptions/eCos-exception-2.0 \
	LICENSES/preferred/BSD-1-Clause \
	LICENSES/preferred/BSD-2-Clause \
	LICENSES/preferred/BSD-2-Clause-Views \
	LICENSES/preferred/BSD-3-Clause \
	LICENSES/preferred/BSD-Source-Code \
	LICENSES/preferred/GFDL-1.2 \
	LICENSES/preferred/gfdl-1.2.texi.readme \
	LICENSES/preferred/GPL-2.0 \
	LICENSES/preferred/MIT \
	LICENSES/stand-alone/GPL-3.0

# 0001-configure-enable-build-on-uclinux.patch patches configure.ac
OPENOCD_12_AUTORECONF = YES
OPENOCD_12_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"

OPENOCD_12_CONF_OPTS = \
	--oldincludedir=$(STAGING_DIR)/usr/include \
	--includedir=$(STAGING_DIR)/usr/include \
	--disable-doxygen-html \
	--disable-internal-jimtcl \
	--disable-shared \
	--enable-dummy \
	--disable-werror \
	--prefix=/usr/local/openocd-0.12.0

# Rely on the Config.in options of each individual adapter selecting
# the dependencies they need.

OPENOCD_12_DEPENDENCIES = \
	host-pkgconf \
	jimtcl \
	$(if $(BR2_PACKAGE_LIBFTDI1),libftdi1) \
	$(if $(BR2_PACKAGE_LIBUSB),libusb) \
	$(if $(BR2_PACKAGE_LIBUSB_COMPAT),libusb-compat) \
	$(if $(BR2_PACKAGE_LIBHID),libhid) \
	$(if $(BR2_PACKAGE_HIDAPI),hidapi) \
	$(if $(BR2_PACKAGE_LIBGPIOD),libgpiod)

# Adapters
OPENOCD_12_CONF_OPTS += \
	$(if $(BR2_PACKAGE_OPENOCD_12_FTDI),--enable-ftdi,--disable-ftdi) \
	$(if $(BR2_PACKAGE_OPENOCD_12_STLINK),--enable-stlink,--disable-stlink) \
	$(if $(BR2_PACKAGE_OPENOCD_12_TI_ICDI),--enable-ti-icdi,--disable-ti-icdi) \
	$(if $(BR2_PACKAGE_OPENOCD_12_ULINK),--enable-ulink,--disable-ulink) \
	$(if $(BR2_PACKAGE_OPENOCD_12_UBLASTER2),--enable-usb-blaster-2,--disable-usb-blaster-2) \
	$(if $(BR2_PACKAGE_OPENOCD_12_JLINK),--enable-jlink,--disable-jlink) \
	$(if $(BR2_PACKAGE_OPENOCD_12_OSDBM),--enable-osbdm,--disable-osbdm) \
	$(if $(BR2_PACKAGE_OPENOCD_12_OPENDOUS),--enable-opendous,--disable-opendous) \
	$(if $(BR2_PACKAGE_OPENOCD_12_AICE),--enable-aice,--disable-aice) \
	$(if $(BR2_PACKAGE_OPENOCD_12_VSLLINK),--enable-vsllink,--disable-vsllink) \
	$(if $(BR2_PACKAGE_OPENOCD_12_USBPROG),--enable-usbprog,--disable-usbprog) \
	$(if $(BR2_PACKAGE_OPENOCD_12_RLINK),--enable-rlink,--disable-rlink) \
	$(if $(BR2_PACKAGE_OPENOCD_12_XDS110),--enable-xds110,--disable-xds110) \
	$(if $(BR2_PACKAGE_OPENOCD_12_ARMEW),--enable-armjtagew,--disable-armjtagew) \
	$(if $(BR2_PACKAGE_OPENOCD_12_CMSIS_DAP),--enable-cmsis-dap,--disable-cmsis-dap) \
	$(if $(BR2_PACKAGE_OPENOCD_12_PARPORT),--enable-parport,--disable-parport) \
	$(if $(BR2_PACKAGE_OPENOCD_12_VPI),--enable-jtag_vpi,--disable-jtag_vpi) \
	$(if $(BR2_PACKAGE_OPENOCD_12_UBLASTER),--enable-usb-blaster,--disable-usb-blaster) \
	$(if $(BR2_PACKAGE_OPENOCD_12_AMTJT),--enable-amtjtagaccel,--disable-amjtagaccel) \
	$(if $(BR2_PACKAGE_OPENOCD_12_EP93XX),--enable-ep93xx,--disable-ep93xx) \
	$(if $(BR2_PACKAGE_OPENOCD_12_AT91RM),--enable-at91rm9200,--disable-at91rm9200) \
	$(if $(BR2_PACKAGE_OPENOCD_12_BCM2835),--enable-bcm2835gpio,--disable-bcm2835gpio) \
	$(if $(BR2_PACKAGE_OPENOCD_12_GW16012),--enable-gw16012,--disable-gw16012) \
	$(if $(BR2_PACKAGE_OPENOCD_12_PRESTO),--enable-presto,--disable-presto) \
	$(if $(BR2_PACKAGE_OPENOCD_12_OPENJTAG),--enable-openjtag,--disable-openjtag) \
	$(if $(BR2_PACKAGE_OPENOCD_12_BUSPIRATE),--enable-buspirate,--disable-buspirate) \
	$(if $(BR2_PACKAGE_OPENOCD_12_SYSFS),--enable-sysfsgpio,--disable-sysfsgpio)

# Enable all configuration options for host build.
#
# Note that deprecated options have been removed. CMSIS_DAP needs
# hidapi (currently not included in buildroot) and zy1000 stuff fails
# to build, so they've been removed too.
#
HOST_OPENOCD_12_CONF_OPTS = \
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

HOST_OPENOCD_12_DEPENDENCIES = host-jimtcl host-libftdi host-libusb host-libusb-compat

# Avoid documentation rebuild. On PowerPC64(le), we patch the
# configure script. Due to this, the version.texi files gets
# regenerated, and then since it has a newer date than openocd.info,
# openocd build system rebuilds the documentation. Unfortunately, this
# documentation rebuild fails on old machines. We work around this by
# faking the date of the generated version.texi file, to make the
# build system believe the documentation doesn't need to be
# regenerated.
define OPENOCD_12_FIX_VERSION_TEXI
	touch -r $(@D)/doc/openocd.info $(@D)/doc/version.texi
endef
OPENOCD_12_POST_BUILD_HOOKS += OPENOCD_12_FIX_VERSION_TEXI
HOST_OPENOCD_12_POST_BUILD_HOOKS += OPENOCD_12_FIX_VERSION_TEXI

define OPENOCD_12_TARGET_RENAME
	mv $(TARGET_DIR)/usr/bin/openocd $(TARGET_DIR)/usr/bin/openocd_0.12.0
endef

OPENOCD_12_POST_INSTALL_TARGET_HOOKS += OPENOCD_12_TARGET_RENAME


$(eval $(autotools-package))
$(eval $(host-autotools-package))
