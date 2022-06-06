################################################################################
#
# python-intervaltree
#
################################################################################

PYTHON_INTERVALTREE_VERSION = 3.1.0
PYTHON_INTERVALTREE_SOURCE = intervaltree-$(PYTHON_INTERVALTREE_VERSION).tar.gz
PYTHON_INTERVALTREE_SITE = https://files.pythonhosted.org/packages/50/fb/396d568039d21344639db96d940d40eb62befe704ef849b27949ded5c3bb
PYTHON_INTERVALTREE_SETUP_TYPE = setuptools
PYTHON_INTERVALTREE_LICENSE = Apache-2.0
PYTHON_INTERVALTREE_LICENSE_FILES = LICENSE.txt

$(eval $(python-package))
