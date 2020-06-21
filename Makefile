PACKAGE_VERSION = 1.0

ARCHS = arm64 arm64e

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = dotscolor

dotscolor_FILES = Tweak.xm
dotscolor_CFLAGS = -fobjc-arc
dotscolor_LIBRARIES = sparkcolourpicker
dotscolor_EXTRA_FRAMEWORKS += Cephei
dotscolor_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += dotsprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
