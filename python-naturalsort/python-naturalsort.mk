################################################################################
#
# python-naturalsort
#
################################################################################

PYTHON_NATURALSORT_VERSION = 1.5.1
PYTHON_NATURALSORT_SOURCE = naturalsort-$(PYTHON_NATURALSORT_VERSION).tar.gz
PYTHON_NATURALSORT_SITE = https://files.pythonhosted.org/packages/0c/84/ce1985c8c61d2ac21a4b3a5d586ed0794b855f925ecc47adca546f0c7022
PYTHON_NATURALSORT_SETUP_TYPE = setuptools
PYTHON_NATURALSORT_LICENSE = MIT
PYTHON_NATURALSORT_LICENSE_FILES = LICENSE.txt

$(eval $(python-package))
