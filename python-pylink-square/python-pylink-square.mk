################################################################################
#
# python-pylink-square
#
################################################################################

PYTHON_PYLINK_SQUARE_VERSION = 0.12.0
PYTHON_PYLINK_SQUARE_SOURCE = pylink-square-$(PYTHON_PYLINK_SQUARE_VERSION).tar.gz
PYTHON_PYLINK_SQUARE_SITE = https://files.pythonhosted.org/packages/f5/5b/e3e508ee8766f84c4cadb8d5d4d6ee3cd9542287e6f42d20a0af76335f2b
PYTHON_PYLINK_SQUARE_SETUP_TYPE = setuptools
PYTHON_PYLINK_SQUARE_LICENSE = Apache-2.0
PYTHON_PYLINK_SQUARE_LICENSE_FILES = LICENSE.md

$(eval $(python-package))
