# Copyright (C) 2022 Paranoid Android
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

ifeq (aospa_cheetah,$(TARGET_PRODUCT))

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit from the custom device configuration.
$(call inherit-product, device/google/pantah/aosp_cheetah.mk)
$(call inherit-product, device/google/gs201/aospa_common.mk)

include device/google/pantah/device-aospa.mk

# Inherit from the AOSPA configuration.
TARGET_DISABLE_EPPE := true
$(call inherit-product, vendor/aospa/target/product/aospa-target.mk)

include device/google/pantah/cheetah/device-aospa.mk

# Resolution for bootanimation
TARGET_BOOT_ANIMATION_RES := 1440

PRODUCT_BRAND := google
PRODUCT_DEVICE := cheetah
PRODUCT_MANUFACTURER := Google
PRODUCT_MODEL := Pixel 7 Pro
PRODUCT_NAME := aospa_cheetah

PRODUCT_GMS_CLIENTID_BASE := android-google

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE=Pixel7Pro \
    PRIVATE_BUILD_DESC="cheetah-user 14 AP1A.240405.002 11480754 release-keys"

BUILD_FINGERPRINT := google/cheetah/cheetah:14/AP1A.240405.002/11480754:user/release-keys

$(call inherit-product, vendor/google/cheetah/cheetah-vendor.mk)

endif
