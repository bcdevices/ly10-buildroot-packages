################################################################################
#
# python-importlib-resources
#
################################################################################

PYTHON_IMPORTLIB_RESOURCES_VERSION = 6.0.0
PYTHON_IMPORTLIB_RESOURCES_SOURCE = importlib_resources-$(PYTHON_IMPORTLIB_RESOURCES_VERSION).tar.gz
PYTHON_IMPORTLIB_RESOURCES_SITE = https://files.pythonhosted.org/packages/78/1f/65a619c18b0ecd55ac165c7ed119c846051991d01c2cfc0ff7818e4573f0
PYTHON_IMPORTLIB_RESOURCES_SETUP_TYPE = setuptools
PYTHON_IMPORTLIB_RESOURCES_LICENSE = MIT
PYTHON_IMPORTLIB_RESOURCES_LICENSE_FILES = LICENSE.txt

$(eval $(python-package))
$(eval $(host-python-package))
