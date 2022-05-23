################################################################################
#
# python-capstone
#
################################################################################

PYTHON_CAPSTONE_VERSION = 4.0.2
PYTHON_CAPSTONE_SOURCE = capstone-$(PYTHON_CAPSTONE_VERSION).tar.gz
PYTHON_CAPSTONE_SITE = https://files.pythonhosted.org/packages/f2/ae/21dbb3ccc30d5cc9e8cdd8febfbf5d16d93b8c10e595280d2aa4631a0d1f
PYTHON_CAPSTONE_SETUP_TYPE = setuptools
PYTHON_CAPSTONE_LICENSE = FIXME: license id couldn't be detected
PYTHON_CAPSTONE_LICENSE_FILES = LICENSE.TXT src/LICENSE.TXT

$(eval $(python-package))
