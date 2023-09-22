################################################################################
#
# yubico_piv_tool
#
################################################################################

YUBICO_PIV_TOOL_VERSION = yubico-piv-tool-2.3.1
YUBICO_PIV_TOOL_SITE = git://github.com/Yubico/yubico-piv-tool.git
YUBICO_PIV_TOOL_LICENSE = BSD
YUBICO_PIV_TOOL_LICENSE_FILES = COPYING

YUBICO_PIV_TOOL_CONF_OPTS = -DGENERATE_MAN_PAGES=OFF

YUBICO_PIV_TOOL_INSTALL_STAGING = YES
YUBICO_PIV_TOOL_INSTALL_TARGET = YES

YUBICO_PIV_TOOL_DEPENDENCIES = host-gengetopt
YUBICO_PIV_TOOL_DEPENDENCIES += host-openssl
YUBICO_PIV_TOOL_DEPENDENCIES += host-m4

$(eval $(cmake-package))
