#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit some common AOSP stuff
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, packages/services/Car/car_product/build/car.mk)

# Inherit some common Lineage stuff.
TARGET_DISABLE_EPPE := true
$(call inherit-product, device/lineage/car/lineage_car_vendor.mk)
$(call inherit-product, vendor/lineage/config/common_car.mk)

# Inherit device configuration
$(call inherit-product, device/google_car/tangorpro_car/aosp_tangorpro_car.mk)
$(call inherit-product, device/google/gs201/lineage_common.mk)
$(call inherit-product, device/google/tangorpro/device-lineage.mk)

# Device identifier. This must come after all inclusions
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel Tablet
PRODUCT_NAME := lineage_tangorpro_car

# Boot animation
TARGET_SCREEN_HEIGHT := 1600
TARGET_SCREEN_WIDTH := 2560

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_PRODUCT=tangorpro \
    PRIVATE_BUILD_DESC="tangorpro-user 14 AP1A.240305.019.A1 11445699 release-keys"

BUILD_FINGERPRINT := google/tangorpro/tangorpro:14/AP1A.240305.019.A1/11445699:user/release-keys

$(call inherit-product, vendor/google/tangorpro/tangorpro-vendor.mk)
