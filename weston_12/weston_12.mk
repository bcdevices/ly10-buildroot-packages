################################################################################
#
# weston
#
################################################################################

WESTON_12_VERSION = 12.0.1
WESTON_12_SITE = https://gitlab.freedesktop.org/wayland/weston/-/releases/$(WESTON_12_VERSION)/downloads
WESTON_12_SOURCE = weston-$(WESTON_12_VERSION).tar.xz
WESTON_12_LICENSE = MIT
WESTON_12_LICENSE_FILES = COPYING
WESTON_12_CPE_ID_VENDOR = wayland
WESTON_12_INSTALL_STAGING = YES

WESTON_12_DEPENDENCIES = host-pkgconf wayland wayland-protocols \
	libxkbcommon pixman libpng udev cairo libinput libdrm

WESTON_12_CONF_OPTS = \
	-Dbackend-headless=false \
	-Ddoc=false \
	-Dremoting=false \
	-Dtools=calibrator,debug,info,terminal,touch-calibrator

# Uses VIDIOC_EXPBUF, only available from 3.8+
ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8),y)
WESTON_12_CONF_OPTS += -Dsimple-clients=dmabuf-v4l
else
WESTON_12_CONF_OPTS += -Dsimple-clients=
endif

ifeq ($(BR2_PACKAGE_DBUS)$(BR2_PACKAGE_SYSTEMD),yy)
WESTON_12_CONF_OPTS += -Ddeprecated-launcher-logind=true
WESTON_12_DEPENDENCIES += dbus systemd
else
WESTON_12_CONF_OPTS += -Ddeprecated-launcher-logind=false
endif

ifeq ($(BR2_PACKAGE_SEATD),y)
WESTON_12_CONF_OPTS += -Dlauncher-libseat=true
WESTON_12_DEPENDENCIES += seatd
else
WESTON_12_CONF_OPTS += -Dlauncher-libseat=false
endif

ifeq ($(BR2_PACKAGE_JPEG),y)
WESTON_12_CONF_OPTS += -Dimage-jpeg=true
WESTON_12_DEPENDENCIES += jpeg
else
WESTON_12_CONF_OPTS += -Dimage-jpeg=false
endif

ifeq ($(BR2_PACKAGE_WEBP),y)
WESTON_12_CONF_OPTS += -Dimage-webp=true
WESTON_12_DEPENDENCIES += webp
else
WESTON_12_CONF_OPTS += -Dimage-webp=false
endif

# weston-launch must be u+s root in order to work properly
ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
define WESTON_12_PERMISSIONS
	/usr/bin/weston-launch f 4755 0 0 - - - - -
endef
define WESTON_12_USERS
	- - weston-launch -1 - - - - Weston launcher group
endef
# WESTON_12_CONF_OPTS += -Ddeprecated-weston-launch=true
WESTON_12_DEPENDENCIES += linux-pam
else
# WESTON_12_CONF_OPTS += -Ddeprecated-weston-launch=false
endif

ifeq ($(BR2_PACKAGE_HAS_LIBEGL_WAYLAND)$(BR2_PACKAGE_HAS_LIBGLES),yy)
WESTON_12_CONF_OPTS += -Drenderer-gl=true
WESTON_12_DEPENDENCIES += libegl libgles
ifeq ($(BR2_PACKAGE_PIPEWIRE)$(BR2_PACKAGE_WESTON_12_DRM),yy)
WESTON_12_CONF_OPTS += -Dpipewire=true
WESTON_12_DEPENDENCIES += pipewire
else
WESTON_12_CONF_OPTS += -Dpipewire=false
endif
else
WESTON_12_CONF_OPTS += \
	-Drenderer-gl=false \
	-Dpipewire=false
endif

ifeq ($(BR2_PACKAGE_WESTON_12_RDP),y)
WESTON_12_DEPENDENCIES += freerdp
WESTON_12_CONF_OPTS += -Dbackend-rdp=true
else
WESTON_12_CONF_OPTS += -Dbackend-rdp=false
endif

ifeq ($(BR2_PACKAGE_WESTON_12_DRM),y)
WESTON_12_CONF_OPTS += -Dbackend-drm=true
else
WESTON_12_CONF_OPTS += -Dbackend-drm=false
endif

ifeq ($(BR2_PACKAGE_WESTON_12_HEADLESS),y)
WESTON_12_CONF_OPTS += -Dbackend-headless=true
else
WESTON_12_CONF_OPTS += -Dbackend-headless=false
endif

ifeq ($(BR2_PACKAGE_WESTON_12_WAYLAND),y)
WESTON_12_CONF_OPTS += -Dbackend-wayland=true
else
WESTON_12_CONF_OPTS += -Dbackend-wayland=false
endif

ifeq ($(BR2_PACKAGE_WESTON_12_X11),y)
WESTON_12_CONF_OPTS += -Dbackend-x11=true
WESTON_12_DEPENDENCIES += libxcb xlib_libX11
else
WESTON_12_CONF_OPTS += -Dbackend-x11=false
endif

# We're guaranteed to have at least one backend
WESTON_12_CONF_OPTS += -Dbackend-default=$(call qstrip,$(BR2_PACKAGE_WESTON_12_DEFAULT_COMPOSITOR))

ifeq ($(BR2_PACKAGE_WESTON_12_XWAYLAND),y)
WESTON_12_CONF_OPTS += -Dxwayland=true
WESTON_12_DEPENDENCIES += cairo libepoxy libxcb xlib_libX11 xlib_libXcursor xwayland
else
WESTON_12_CONF_OPTS += -Dxwayland=false
endif

ifeq ($(BR2_PACKAGE_LIBVA),y)
WESTON_12_CONF_OPTS += -Dbackend-drm-screencast-vaapi=true
WESTON_12_DEPENDENCIES += libva
else
WESTON_12_CONF_OPTS += -Dbackend-drm-screencast-vaapi=false
endif

ifeq ($(BR2_PACKAGE_LCMS2),y)
WESTON_12_CONF_OPTS += -Dcolor-management-lcms=true
WESTON_12_DEPENDENCIES += lcms2
else
WESTON_12_CONF_OPTS += -Dcolor-management-lcms=false
endif

ifeq ($(BR2_PACKAGE_SYSTEMD),y)
WESTON_12_CONF_OPTS += -Dsystemd=true
WESTON_12_DEPENDENCIES += systemd
else
WESTON_12_CONF_OPTS += -Dsystemd=false
endif

ifeq ($(BR2_PACKAGE_LIBXML2),y)
WESTON_12_CONF_OPTS += -Dtest-junit-xml=true
WESTON_12_DEPENDENCIES += libxml2
else
WESTON_12_CONF_OPTS += -Dtest-junit-xml=false
endif

ifeq ($(BR2_PACKAGE_WESTON_12_SHELL_DESKTOP),y)
WESTON_12_CONF_OPTS += -Dshell-desktop=true
else
WESTON_12_CONF_OPTS += -Dshell-desktop=false
endif

ifeq ($(BR2_PACKAGE_WESTON_12_SHELL_FULLSCREEN),y)
WESTON_12_CONF_OPTS += -Dshell-fullscreen=true
else
WESTON_12_CONF_OPTS += -Dshell-fullscreen=false
endif

ifeq ($(BR2_PACKAGE_WESTON_12_SHELL_IVI),y)
WESTON_12_CONF_OPTS += -Dshell-ivi=true
else
WESTON_12_CONF_OPTS += -Dshell-ivi=false
endif

ifeq ($(BR2_PACKAGE_WESTON_12_SHELL_KIOSK),y)
WESTON_12_CONF_OPTS += -Dshell-kiosk=true
else
WESTON_12_CONF_OPTS += -Dshell-kiosk=false
endif

ifeq ($(BR2_PACKAGE_WESTON_12_DEMO_CLIENTS),y)
WESTON_12_CONF_OPTS += -Ddemo-clients=true
WESTON_12_DEPENDENCIES += pango
else
WESTON_12_CONF_OPTS += -Ddemo-clients=false
endif

$(eval $(meson-package))
