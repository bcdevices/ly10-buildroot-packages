################################################################################
#
# plymouth
#
################################################################################

# http://www.freedesktop.org/wiki/Software/Plymouth
# 
#   Plymouth is an application that runs very early in the boot process
#   (even before the root filesystem is mounted!) that provides a
#   graphical boot animation while the boot process happens in the background.

PLYMOUTH_VERSION = 22.02.122
#PLYMOUTH_STITE = http://www.freedesktop.org/software/plymouth/releases/${BPN}-${PV}.tar.xz
#SRC_URI[sha256sum] = "100551442221033ce868c447ad6c74d831d209c18ae232b98ae0207e34eadaeb"
PLYMOUTH_SITE = https://gitlab.freedesktop.org/plymouth/plymouth
PLYMOUTH_SITE_METHOD = git
#PLYMOUTH_LICENSE = GPL-2.0+
PLYMOUTH_LICENSE = GPL-2.0-or-later
PLYMOUTH_LICENSE_FILES = COPYING
PLYMOUTH_AUTORECONF = YES
PLYMOUTH_DEPENDENCIES = host-pkgconf
PLYMOUTH_DEPENDENCIES += host-gdk-pixbuf

PLYMOUTH_CONF_OPTS += --enable-drm
PLYMOUTH_CONF_OPTS += --disable-documentation
PLYMOUTH_CONF_OPTS += --disable-gtk,gtk+3
PLYMOUTH_CONF_OPTS += --with-logo=/usr/lib/plymouth/bcd-logo.png
PLYMOUTH_CONF_OPTS += --disable-systemd-integration,systemd
PLYMOUTH_CONF_OPTS += --with-udev
PLYMOUTH_CONF_OPTS += --without-udev,udev
PLYMOUTH_CONF_OPTS += --disable-upstart-monitoring,ncurses dbus
PLYMOUTH_CONF_OPTS += --without-system-root-install

PLYMOUTH_INSTALL_STAGING = YES
PLYMOUTH_INSTALL_TARGET = YES

define PLYMOUTH_INSTALL_IMAGE
	$(INSTALL) -D -m 644 package/plymouth/bcd-logo.png \
		$(TARGET_DIR)/usr/lib/plymouth/bcd-logo.png
endef

$(eval $(autotools-package))
$(eval $(host-autotools-package))
