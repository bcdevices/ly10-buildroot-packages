################################################################################
#
# python-pyocd
#
################################################################################

PYTHON_PYOCD_VERSION = 0.32.3
PYTHON_PYOCD_SOURCE = pyocd-$(PYTHON_PYOCD_VERSION).tar.gz
PYTHON_PYOCD_SITE = https://files.pythonhosted.org/packages/ea/77/23f98013b7bf5647903e8720f653cd0a8271e2432fff32e859d4461dd940
PYTHON_PYOCD_SETUP_TYPE = setuptools
PYTHON_PYOCD_LICENSE = Apache-2.0
PYTHON_PYOCD_LICENSE_FILES = LICENSE

$(eval $(python-package))
