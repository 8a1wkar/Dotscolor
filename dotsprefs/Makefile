PACKAGE_VERSION = 1.0

ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = dotsprefs

dotsprefs_FILES = dotsRootListController.m
dotsprefs_INSTALL_PATH = /Library/PreferenceBundles
dotsprefs_FRAMEWORKS = UIKit
dotsprefs_PRIVATE_FRAMEWORKS = Preferences
dotsprefs_CFLAGS = -fobjc-arc
dotsprefs_LIBRARIES = sparkcolourpicker
dotsprefs_EXTRA_FRAMEWORKS = Cephei CepheiPrefs

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/dotsprefs.plist$(ECHO_END)
