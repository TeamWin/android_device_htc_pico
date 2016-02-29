#
# Copyright (C) 2014 The Android Open-Source Project
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
#

# vendor
BOARD_VENDOR := htc
TARGET_BOOTLOADER_BOARD_NAME := pico

# Platform
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

TARGET_BOARD_PLATFORM := msm7x27a
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a9
TARGET_ARCH_LOWMEM := true

ARCH_ARM_HAVE_ARMV7A := true
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_VFP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

# flags
TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -DQCOM_LEGACY_OMX
COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=65
COMMON_GLOBAL_CFLAGS += -DQCOM_ICS_COMPAT
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS
COMMON_GLOBAL_CFLAGS += -DQCOM_NO_SECURE_PLAYBACK
COMMON_GLOBAL_CFLAGS += -DNO_TUNNEL_RECORDING
COMMON_GLOBAL_CFLAGS += -DICS_CAMERA_BLOB

COMMON_GLOBAL_CFLAGS += -DGENLOCK_IOC_DREADLOCK
COMMON_GLOBAL_CFLAGS += -DUSE_GENLOCK

# QCOM_HARDWARE
BOARD_USES_QCOM_HARDWARE := true
TARGET_QCOM_AUDIO_VARIANT := legacy
TARGET_QCOM_MEDIA_VARIANT := legacy
TARGET_QCOM_DISPLAY_VARIANT := legacy
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE

# Compiler Optimization
ARCH_ARM_HIGH_OPTIMIZATION := true
ARCH_ARM_HIGH_OPTIMIZATION_COMPAT := true

# cortex-a9 is used to take advantage of NEON optimizations
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_ARCH_VARIANT_FPU := neon

# Optimisations used by Qualcomm
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# kernel
BOARD_KERNEL_BASE := 0x12c00000
BOARD_PAGE_SIZE := 0x00000800
BOARD_KERNEL_CMDLINE := no_console_suspend=1 console=null androidboot.hardware=pico
TARGET_KERNEL_SOURCE := kernel/htc/pico
TARGET_KERNEL_CONFIG := pico_defconfig

# include path
TARGET_SPECIFIC_HEADER_PATH := device/htc/pico/include

# filesystem
# Fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00400000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00600000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 524288000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x09600000
BOARD_FLASH_BLOCK_SIZE := 262144

# Vold
BOARD_VOLD_MAX_PARTITIONS := 24
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS := true
BOARD_USE_USB_MASS_STORAGE_SWITCH := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/class/android_usb/android0/f_mass_storage/lun0/file"

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_FSTAB := device/htc/pico/ramdisk/recovery.fstab

ifeq ($(TARGET_BUILD_VARIANT), eng)
  BOARD_CUSTOM_BOOTIMG_MK := $(LOCAL_PATH)/customrecoveryimg.mk
endif

# TWRP
TW_THEME := PORTRAIT_MDPI
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_NEVER_UMOUNT_SYSTEM := false
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"
TARGET_RECOVERY_INITRC := device/htc/pico/ramdisk/recovery/init.rc

# RIL
BOARD_USE_NEW_LIBRIL_HTC := true
BOARD_USES_LEGACY_RIL := true

# audio
BOARD_USES_LEGACY_ALSA_AUDIO := true
TARGET_PROVIDES_LIBAUDIO := true
BOARD_QCOM_VOIP_ENABLED := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUEDROID_VENDOR_CONF := device/htc/pico/bluetooth/vnd_pico.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/htc/pico/bluetooth/include


# graphics
TARGET_DISPLAY_INSECURE_MM_HEAP := true
BOARD_EGL_CFG := device/htc/pico/prebuilt/egl.cfg
USE_OPENGL_RENDERER := true
TARGET_NO_HW_VSYNC := false
TARGET_DOESNT_USE_FENCE_SYNC := true
TARGET_QCOM_HDMI_OUT := false
BOARD_USE_SKIA_LCDTEXT := true
BOARD_HAVE_PIXEL_FORMAT_INFO := true
BOARD_EGL_WORKAROUND_BUG_10194508�:=�true
BOARD_USE_MHEAP_SCREENSHOT := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
TARGET_USES_SF_BYPASS := true
TARGET_HAVE_BYPASS := true
TARGET_USES_OVERLAY := true

# Wifi related definitions
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
WIFI_BAND := 802_11_ABG
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/bcmdhd.ko"
WIFI_DRIVER_MODULE_NAME := "bcmdhd"
WIFI_DRIVER_MODULE_ARG := "firmware_path=/system/etc/firmware/fw_bcmdhd.bin nvram_path=/proc/calibration iface_name=wlan0"
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA := "/system/etc/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP := "/system/etc/firmware/fw_bcmdhd_apsta.bin"

# GPS
BOARD_USES_QCOM_LIBRPC := true
BOARD_USES_QCOM_GPS := true
BOARD_USES_QCOM_LIBS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := msm7x27a
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 50000

# Camera
USE_CAMERA_STUB := true
BOARD_NEEDS_MEMORYHEAPPMEM := true
CAMERA_USES_SURFACEFLINGER_CLIENT_STUB := true
TARGET_DISABLE_ARM_PIE := true
BOARD_USES_QCOM_LEGACY_CAM_PARAMS := true
BOARD_USES_PMEM_ADSP := true

# ION Support
TARGET_USES_ION := true

# Add h/w acceleration in browser
ENABLE_WEBGL := true
WITH_JIT := true
ENABLE_JSC_JIT := true
JS_ENGINE := v8
HTTP := chrome

# FM Radio
BOARD_HAVE_FM_RADIO := true
BOARD_FM_DEVICE := bcm4330
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO

# Touch screen compatibility for JB
BOARD_USE_LEGACY_TOUCHSCREEN := true

# Custom liblights
TARGET_PROVIDES_LIBLIGHT := true

# Power
TARGET_PROVIDES_POWERHAL := true

# Misc
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
TARGET_BOOTANIMATION_USE_RGB565 := true
COMMON_GLOBAL_CFLAGS += -DHTCLOG

# releasetools
TARGET_RELEASETOOLS_EXTENSIONS := $(LOCAL_PATH)
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := device/htc/pico/releasetools/pico_ota_from_target_files
