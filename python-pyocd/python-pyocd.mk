################################################################################
#
# python-pyocd
#
################################################################################

PYTHON_PYOCD_VERSION = 0.35.1
PYTHON_PYOCD_SOURCE = pyocd-$(PYTHON_PYOCD_VERSION).tar.gz
PYTHON_PYOCD_SITE = https://files.pythonhosted.org/packages/f4/30/f9d381eb634844c9f751af443c57cc624cb34f7434e1008267ef16d0ee02
PYTHON_PYOCD_SETUP_TYPE = pep517
PYTHON_PYOCD_DEPENDENCIES = host-python-wheel python-wheel
PYTHON_PYOCD_LICENSE = Apache-2.0
PYTHON_PYOCD_LICENSE_FILES = LICENSE

$(eval $(python-package))
