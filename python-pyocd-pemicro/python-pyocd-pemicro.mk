################################################################################
#
# python-pyocd-pemicro
#
################################################################################

PYTHON_PYOCD_PEMICRO_VERSION = 1.1.3
PYTHON_PYOCD_PEMICRO_SOURCE = pyocd-pemicro-$(PYTHON_PYOCD_PEMICRO_VERSION).tar.gz
PYTHON_PYOCD_PEMICRO_SITE = https://files.pythonhosted.org/packages/1a/99/596fbd18c470986698b93661a0942fb0e2ffb188568d2bf4467a4fa793ed
PYTHON_PYOCD_PEMICRO_SETUP_TYPE = setuptools
PYTHON_PYOCD_PEMICRO_LICENSE = BSD-3-Clause
PYTHON_PYOCD_PEMICRO_LICENSE_FILES = LICENSE

$(eval $(python-package))
