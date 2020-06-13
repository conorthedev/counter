TARGET = iphone:clang:latest:11.0
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = counterCC
counterCC_BUNDLE_EXTENSION = bundle
counterCC_FILES = counterCC.m ../CounterManager.m
counterCC_INSTALL_PATH = /Library/ControlCenter/Bundles/

include $(THEOS_MAKE_PATH)/bundle.mk
