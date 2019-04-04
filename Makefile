THEOS_DEVICE_IP ?= 0
THEOS_DEVICE_PORT ?= 2222
TARGET = iphone:clang:11.2:8.0
ARCHS = arm64 armv7
CFLAGS = -fobjc-arc

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SileoiRUAPI
SileoiRUAPI_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk


