################################################################################
#
# python-hidapi
#
################################################################################

PYTHON_HIDAPI_VERSION = 0.14.0
PYTHON_HIDAPI_SOURCE = hidapi-$(PYTHON_HIDAPI_VERSION).tar.gz
PYTHON_HIDAPI_SITE = https://files.pythonhosted.org/packages/95/0e/c106800c94219ec3e6b483210e91623117bfafcf1decaff3c422e18af349
PYTHON_HIDAPI_SETUP_TYPE = setuptools
PYTHON_HIDAPI_LICENSE = BSD, GNU General Public License v3 (GPLv3)
PYTHON_HIDAPI_LICENSE_FILES = LICENSE.txt

$(eval $(python-package))
