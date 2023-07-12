################################################################################
#
# python-natsort
#
################################################################################

PYTHON_NATSORT_VERSION = 8.4.0
PYTHON_NATSORT_SOURCE = natsort-$(PYTHON_NATSORT_VERSION).tar.gz
PYTHON_NATSORT_SITE = https://files.pythonhosted.org/packages/e2/a9/a0c57aee75f77794adaf35322f8b6404cbd0f89ad45c87197a937764b7d0
PYTHON_NATSORT_SETUP_TYPE = setuptools
PYTHON_NATSORT_LICENSE = MIT
PYTHON_NATSORT_LICENSE_FILES = LICENSE

$(eval $(python-package))
