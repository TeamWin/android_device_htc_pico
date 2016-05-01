# Copyright (C) 2011 The Android Open Source Project
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

# proprietary side of the device
# Inherit from those products. Most specific first

# Inherit common msm7x27a configs
#$(call inherit-product-if-exists, device/htc/msm7x27a-common/msm7x27a.mk)

# proprietary side of the device
#$(call inherit-product-if-exists, vendor/htc/pico/vendor_pico.mk)


# Set usb type
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.sys.usb.config=mtp \
    persist.service.adb.enable=1 \
    ro.adb.secure=0

PRODUCT_COPY_FILES += \
	device/htc/pico/rootdir/recovery/kernel:kernel
