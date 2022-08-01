################################################################################
#
# python-pypemicro
#
################################################################################

PYTHON_PYPEMICRO_VERSION = 0.1.9
PYTHON_PYPEMICRO_SOURCE = pypemicro-$(PYTHON_PYPEMICRO_VERSION).tar.gz
PYTHON_PYPEMICRO_SITE = https://files.pythonhosted.org/packages/68/1e/30b010c4f90fa18d5c2ad8c7c3921b622a4a3ee1327c7fedcdcd18e7821d
PYTHON_PYPEMICRO_SETUP_TYPE = setuptools
PYTHON_PYPEMICRO_LICENSE = BSD-3-Clause
PYTHON_PYPEMICRO_LICENSE_FILES = LICENSE

PYTHON_PYPEMICRO_BIN_ARCH_EXCLUDE = usr/lib/python3.10/site-packages/pypemicro/libs/Linux/ 

$(eval $(python-package))
