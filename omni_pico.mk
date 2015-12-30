# Boot animation
TARGET_SCREEN_HEIGHT := 320
TARGET_SCREEN_WIDTH  := 480

# Include GSM stuff
$(call inherit-product, vendor/omni/config/gsm.mk)

DEVICE_PACKAGE_OVERLAYS += device/htc/pico/overlay

# Inherit some common stuff.
$(call inherit-product, vendor/omni/config/common.mk)
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

# Inherit device configuration
$(call inherit-product, device/htc/pico/full_pico.mk)

BUILDTYPE_NIGHTLY := false

# Product name
PRODUCT_NAME := omni_pico
PRODUCT_BRAND := htc
PRODUCT_DEVICE := pico
PRODUCT_MANUFACTURER := HTC
PRODUCT_RELEASE_NAME := Explorer
PRODUCT_MODEL := Explorer A310e
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=pico \
    BUILD_FINGERPRINT=htc_europe/htc_pico/pico:2.3.5/GRJ90/207463.1:user/release-keys
PRIVATE_BUILD_DESC="1.28.401.1 CL207463 release-keys"
