################################################################################
#
# python-cmsis-pack-manager
#
################################################################################

PYTHON_CMSIS_PACK_MANAGER_VERSION = 0.4.0 
PYTHON_CMSIS_PACK_MANAGER_SOURCE = cmsis-pack-manager-$(PYTHON_CMSIS_PACK_MANAGER_VERSION).tar.gz
PYTHON_CMSIS_PACK_MANAGER_SITE = https://files.pythonhosted.org/packages/26/95/49f474837542a2e98b144c59000a1b22d0b3fc449fbd5d8b956b83d78638
PYTHON_CMSIS_PACK_MANAGER_SETUP_TYPE = setuptools
PYTHON_CMSIS_PACK_MANAGER_LICENSE = Apache-2.0

$(eval $(python-package))
