################################################################################
#
# python-prettytable
#
################################################################################

PYTHON_PRETTYTABLE_VERSION = 2.5.0
PYTHON_PRETTYTABLE_SOURCE = prettytable-$(PYTHON_PRETTYTABLE_VERSION).tar.gz
PYTHON_PRETTYTABLE_SITE = https://files.pythonhosted.org/packages/e4/35/21bf22e21b29102bbe81730caf498dfb3e1eed2642ac71f323472ead673a
PYTHON_PRETTYTABLE_SETUP_TYPE = setuptools
PYTHON_PRETTYTABLE_LICENSE = BSD

$(eval $(python-package))
