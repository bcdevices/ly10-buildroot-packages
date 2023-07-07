################################################################################
#
# python-pylink-square
#
################################################################################

PYTHON_PYLINK_SQUARE_VERSION = 1.1.0
PYTHON_PYLINK_SQUARE_SOURCE = pylink-square-$(PYTHON_PYLINK_SQUARE_VERSION).tar.gz
PYTHON_PYLINK_SQUARE_SITE = https://files.pythonhosted.org/packages/ae/4e/461d9afa070ed312210911b1def8305f3cb453bf37217877414c41016a33
PYTHON_PYLINK_SQUARE_SETUP_TYPE = setuptools
PYTHON_PYLINK_SQUARE_LICENSE = Apache-2.0
PYTHON_PYLINK_SQUARE_LICENSE_FILES = LICENSE.md

$(eval $(python-package))
