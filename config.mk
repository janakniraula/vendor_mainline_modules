# FIXME -- DeviceLock ModulePrebuilt is only planned to be released for QPR2
DISABLE_DEXPREOPT_CHECK := true

ifneq ($(MAINLINE_INCLUDE_UWB_MODULE), false)
MAINLINE_INCLUDE_UWB_MODULE := true
endif

ifneq ($(MAINLINE_INCLUDE_WIFI_MODULE), false)
MAINLINE_INCLUDE_WIFI_MODULE := true
endif

ifneq ($(MAINLINE_INCLUDE_BTSERVICES_MODULE), false)
MAINLINE_INCLUDE_BTSERVICES_MODULE := true

# Overlay
PRODUCT_PACKAGES += \
	GoogleConfigBluetoothOverlay

# Google Bluetooth Legacy Migration
PRODUCT_PACKAGES += \
	GoogleBluetoothLegacyMigration
endif

ifneq ($(MAINLINE_INCLUDE_VIRT_MODULE), false)
MAINLINE_INCLUDE_VIRT_MODULE := true
endif

$(call inherit-product, vendor/mainline_modules/build/mainline_modules.mk)

ifeq ($(TARGET_SUPPORTS_NOW_PLAYING), true)
PRODUCT_PACKAGES += \
	ApexNowPlayingOverlay
else
PRODUCT_PACKAGES += \
	ApexOverlay
endif

# Overlay
PRODUCT_PACKAGES += \
	ApexSettingsOverlay \
	DocumentsUIGoogleOverlayExtra \
	CaptivePortalLoginOverlayExtra \
	CellBroadcastReceiverOverlayExtra \
	CellBroadcastServiceOverlayExtra \
	GoogleConfigOverlayExtra
