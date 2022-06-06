################################################################################
#
# python-pyocd
#
################################################################################

PYTHON_PYOCD_VERSION = 0.31.0
PYTHON_PYOCD_SOURCE = pyocd-$(PYTHON_PYOCD_VERSION).tar.gz
PYTHON_PYOCD_SITE = https://files.pythonhosted.org/packages/4a/5c/6174511aceb33c3cf1b535bab400eb1dd487085fafda9bd43704d24caaf9
PYTHON_PYOCD_SETUP_TYPE = setuptools
PYTHON_PYOCD_LICENSE = Apache-2.0
PYTHON_PYOCD_LICENSE_FILES = LICENSE

$(eval $(python-package))
