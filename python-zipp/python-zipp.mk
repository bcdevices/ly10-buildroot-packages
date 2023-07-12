################################################################################
#
# python-zipp
#
################################################################################

PYTHON_ZIPP_VERSION = 3.16.0
PYTHON_ZIPP_SOURCE = zipp-$(PYTHON_ZIPP_VERSION).tar.gz
PYTHON_ZIPP_SITE = https://files.pythonhosted.org/packages/52/9a/d93b483b9a744e7f71b311ee9bb5a228f6846219ceb5d6dbcb3eddcd1932
PYTHON_ZIPP_SETUP_TYPE = setuptools
PYTHON_ZIPP_LICENSE = MIT 
PYTHON_ZIPP_LICENSE_FILES = LICENSE

$(eval $(python-package))
$(eval $(host-python-package))
