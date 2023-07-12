################################################################################
#
# python-capstone
#
################################################################################

PYTHON_CAPSTONE_VERSION = 5.0.0.post1
PYTHON_CAPSTONE_SOURCE = capstone-$(PYTHON_CAPSTONE_VERSION).tar.gz
PYTHON_CAPSTONE_SITE = https://files.pythonhosted.org/packages/de/04/4c2ae5ef70dadd773b39d39d30f1cab54d4a27aa0af69ac1414e2338434e
PYTHON_CAPSTONE_SETUP_TYPE = setuptools
PYTHON_CAPSTONE_LICENSE = FIXME: license id couldn't be detected
PYTHON_CAPSTONE_LICENSE_FILES = LICENSE.TXT src/LICENSE.TXT

$(eval $(python-package))
