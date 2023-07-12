################################################################################
#
# python-prettytable
#
################################################################################

PYTHON_PRETTYTABLE_VERSION = 3.8.0
PYTHON_PRETTYTABLE_SOURCE = $(PYTHON_prettytable_VERSION).tar.gz
PYTHON_PRETTYTABLE_SITE = git://github.com/jazzband/prettytable
PYTHON_PRETTYTABLE_SETUP_TYPE = setuptools
PYTHON_PRETTYTABLE_LICENSE = BSD

$(eval $(python-package))
