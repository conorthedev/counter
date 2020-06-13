TARGET := iphone:clang:latest:11.0
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = counter

counter_FILES = Tweak.x CounterManager.m
counter_CFLAGS = -fobjc-arc

SUBPROJECTS += Module

include $(THEOS_MAKE_PATH)/tweak.mk
include $(THEOS_MAKE_PATH)/aggregate.mk
