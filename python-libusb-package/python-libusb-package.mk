################################################################################
#
# python-libusb-package
#
################################################################################

PYTHON_LIBUSB_PACKAGE_VERSION = v1.0.26.2
PYTHON_LIBUSB_PACKAGE_SITE = git://github.com/pyocd/libusb-package.git
PYTHON_LIBUSB_PACKAGE_SETUP_TYPE = setuptools
PYTHON_LIBUSB_PACKAGE_LICENSE = Apache-2.0
PYTHON_PYOCD_DEPENDENCIES = host-python-wheel host-python-tomli python-wheel python-tomli
PYTHON_LIBUSB_PACKAGE_LICENSE_FILES = LICENSE

$(eval $(python-package))
