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

PLYMOUTH_VERSION = e8e193716f25874c9e91b52673f2c102f51ca497
PLYMOUTH_SITE = https://gitlab.freedesktop.org/plymouth/plymouth
PLYMOUTH_SITE_METHOD = git
PLYMOUTH_LICENSE = GPL-2.0-or-later
PLYMOUTH_LICENSE_FILES = COPYING
PLYMOUTH_DEPENDENCIES = host-pkgconf
PLYMOUTH_DEPENDENCIES += host-gdk-pixbuf
PLYMOUTH_DEPENDENCIES += libpng
PLYMOUTH_DEPENDENCIES += libxkbcommon
PLYMOUTH_DEPENDENCIES += freetype

PLYMOUTH_CONF_OPTS += -Ddocs=false
PLYMOUTH_CONF_OPTS += -Ddrm=true
PLYMOUTH_CONF_OPTS += -Dfreetype=enabled
PLYMOUTH_CONF_OPTS += -Dgtk=disabled
PLYMOUTH_CONF_OPTS += -Dlogo=/usr/lib/plymouth/bcd-logo.png
PLYMOUTH_CONF_OPTS += -Dpango=disabled
PLYMOUTH_CONF_OPTS += -Dsystemd-integration=false
PLYMOUTH_CONF_OPTS += -Dtracing=false
PLYMOUTH_CONF_OPTS += -Dudev=enabled
PLYMOUTH_CONF_OPTS += -Dupstart-monitoring=false

PLYMOUTH_INSTALL_STAGING = YES
PLYMOUTH_INSTALL_TARGET = YES

define PLYMOUTH_COPY_LOGO
	$(INSTALL) -m 0644 -D $(PLYMOUTH_PKGDIR)/bcd-logo.png \
		$(STAGING_DIR)/usr/lib/plymouth/bcd-logo.png
endef

PLYMOUTH_PRE_INSTALL_STAGING_HOOKS += PLYMOUTH_COPY_LOGO

define PLYMOUTH_COPY_LOGO_TARGET
	$(INSTALL) -m 0644 -D $(PLYMOUTH_PKGDIR)/bcd-logo.png \
		$(TARGET_DIR)/usr/lib/plymouth/bcd-logo.png
endef

PLYMOUTH_PRE_INSTALL_TARGET_HOOKS += PLYMOUTH_COPY_LOGO_TARGET

define PLYMOUTH_INSTALL_EXTRA_FILES
	$(INSTALL) -m 0644 -D $(PLYMOUTH_PKGDIR)/plymouthd.conf \
		$(TARGET_DIR)/etc/plymouthd.conf
endef

PLYMOUTH_POST_INSTALL_TARGET_HOOKS += PLYMOUTH_INSTALL_EXTRA_FILES

$(eval $(meson-package))
