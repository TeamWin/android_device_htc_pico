# Copyright (C) 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Call in core
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Call in vendor
$(call inherit-product-if-exists, vendor/htc/pico/vendor_pico.mk)

# Overlay
DEVICE_PACKAGE_OVERLAYS += device/htc/pico/overlay

# Graphics
PRODUCT_PACKAGES += \
    copybit.msm7x27a \
    gralloc.msm7x27a \
    libgenlock \
    liboverlay \
    libtilerenderer \
    libqdMetaData

# Audio
PRODUCT_PACKAGES += \
    audio.primary.msm7x27a \
    audio_policy.msm7x27a \
    audio.a2dp.default \
    audio.usb.default \
    audio_policy.conf \
    libaudioutils

# Other
PRODUCT_PACKAGES += \
    dexpreopt \
    libwebcore \
    lights.pico \
    gps.msm7x27a \
    librpc \
    power.msm7x27a \
    libhealthd.msm7x27a \
    memtrack.msm7x27a \
    com.android.future.usb.accessory \
    libnetcmdiface

# Camera
PRODUCT_PACKAGES += \
    camera.msm7x27a \
    libsurfaceflinger_client

# Video decoding
PRODUCT_PACKAGES += \
    libmm-omxcore \
    libstagefrighthw \
    libOmxCore \
    libdashplayer

# Bluetooh
PRODUCT_PACKAGES += \
    brcm_patchram_plus

# Build sim toolkit
PRODUCT_PACKAGES += \
    Stk

# Hardware properties
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml

# Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ramdisk/fstab.pico:root/fstab.pico \
    $(LOCAL_PATH)/ramdisk/recovery/twrp.fstab:root/etc/twrp.fstab \
    $(LOCAL_PATH)/ramdisk/init.pico.rc:root/init.pico.rc \
    $(LOCAL_PATH)/ramdisk/ueventd.pico.rc:root/ueventd.pico.rc \
    $(LOCAL_PATH)/ramdisk/init.pico.usb.rc:root/init.pico.usb.rc

#media_profiles
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/media_codecs.xml:/system/etc/media_codecs.xml \
    $(LOCAL_PATH)/prebuilt/etc/media_profiles.xml:/system/etc/media_profiles.xml

# Wifi
PRODUCT_COPY_FILES += \
    device/htc/pico/prebuilt/etc/firmware/fw_bcmdhd.bin:system/etc/firmware/fw_bcmdhd.bin \
    device/htc/pico/prebuilt/etc/firmware/fw_bcmdhd_apsta.bin:system/etc/firmware/fw_bcmdhd_apsta.bin \
    device/htc/pico/prebuilt/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/htc/pico/prebuilt/etc/dhcpd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/htc/pico/prebuilt/etc/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    device/htc/pico/prebuilt/etc/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf

#latinime from f_droid
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/com.android.inputmethod.latin_4424.apk:/system/app/com.android.inputmethod.latin_4424.apk \
    $(LOCAL_PATH)/prebuilt/net.nurik.roman.dashclock_30.apk:/system/app/net.nurik.roman.dashclock_30.apk

# Set usb type
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.sys.usb.config=mtp,adb \
    ro.adb.secure=0

# Publish that we support the live wallpaper feature.
PRODUCT_COPY_FILES += \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# UMS Dirty Ratio
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=50

# Disable preloading of EGL/GL drivers in Zygote at boot time
PRODUCT_PROPERTY_OVERRIDES += \
    ro.zygote.disable_gl_preload=true

# Enable Low RAM config
# Disable JIT cache
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.low_ram=true
    dalvik.vm.jit.codecachesize=0

# Three second delay before ringing
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.call_ring.delay=3000

# If exist "Classic WebView", allow using "Classic WebView"
# Disabled by default, i.e. use chromium by default
PRODUCT_PROPERTY_OVERRIDES += \
    persist.webview.provider=chromium

# Enable hardware debugging
PRODUCT_PROPERTY_OVERRIDES += \
    debug.egl.hw=1 \
    debug.gr.numframebuffers=3

# Set missing property
PRODUCT_PROPERTY_OVERRIDES += \
    debug.egl.recordable.rgba8888=1

PRODUCT_AAPT_CONFIG := normal mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_TAGS += dalvik.gc.type-precise
# Define locales, to lessen build size
PRODUCT_LOCALES := en_US en_IN fr_FR it_IT es_ES et_EE de_DE nl_NL cs_CZ \
    pl_PL ja_JP zh_TW zh_CN zh_HK ru_RU ko_KR nb_NO es_US da_DK el_GR tr_TR \
    pt_PT pt_BR rm_CH sv_SE bg_BG ca_ES en_GB fi_FI hr_HR hu_HU in_ID iw_IL \
    lt_LT lv_LV ro_RO sk_SK sl_SI sr_RS uk_UA vi_VN tl_PH ar_EG fa_IR sw_TZ \
    ms_MY af_ZA zu_ZA en_XA ar_XB fr_CA mn_MN hy_AM az_AZ ka_GE
