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
PLYMOUTH_SITE = https://gitlab.freedesktop.org/plymouth/plymouth
PLYMOUTH_SITE_METHOD = git
PLYMOUTH_LICENSE = GPL-2.0-or-later
PLYMOUTH_LICENSE_FILES = COPYING
PLYMOUTH_DEPENDENCIES = host-pkgconf
PLYMOUTH_DEPENDENCIES += host-gdk-pixbuf

PLYMOUTH_CONF_OPTS += -Dlogo=/usr/lib/plymouth/bcd-logo.png
PLYMOUTH_CONF_OPTS += -Dupstart-monitoring=false
PLYMOUTH_CONF_OPTS += -Dsystemd-integration=false
PLYMOUTH_CONF_OPTS += -Dtracing=false
PLYMOUTH_CONF_OPTS += -Dudev=enabled
PLYMOUTH_CONF_OPTS += -Dpango=disabled
PLYMOUNT_CONF_OPTS += -Dfreetype=enabled
PLYMOUNT_CONF_OPTS += -Dgtk=disabled
PLYMOUNT_CONF_OPTS += -Ddrm=true
PLYMOUNT_CONF_OPTS += -Ddocs=false

PLYMOUTH_INSTALL_STAGING = YES
PLYMOUTH_INSTALL_TARGET = YES

define PLYMOUTH_INSTALL_IMAGE
	$(INSTALL) -D -m 644 package/plymouth/bcd-logo.png \
		$(TARGET_DIR)/usr/lib/plymouth/bcd-logo.png
endef

$(eval $(meson-package))

