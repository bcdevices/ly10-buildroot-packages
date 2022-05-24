################################################################################
#
# python-hidapi
#
################################################################################

PYTHON_HIDAPI_VERSION = 0.11.2
PYTHON_HIDAPI_SOURCE = hidapi-$(PYTHON_HIDAPI_VERSION).tar.gz
PYTHON_HIDAPI_SITE = https://files.pythonhosted.org/packages/c0/36/1ae403d51262337de39bb026b2ccbe588668273c3361f5d49f0e2094f318
PYTHON_HIDAPI_SETUP_TYPE = setuptools
PYTHON_HIDAPI_LICENSE = FIXME: license id couldn't be detected
PYTHON_HIDAPI_LICENSE_FILES = LICENSE.txt

$(eval $(python-package))
