#
# SPDX-FileCopyrightText: 2021 The Android Open-Source Project
# SPDX-License-Identifier: Apache-2.0
#

# Identify the device type.
# This flag need to be set before device/google/gs201/aosp_common.mk
TARGET_IS_TABLET := true

$(call inherit-product, device/google/gs201/aosp_common.mk)
$(call inherit-product, device/google/tangorpro/device-tangorpro.mk)

PRODUCT_NAME := aosp_tangorpro
PRODUCT_DEVICE := tangorpro
PRODUCT_MODEL := Pixel Tablet
PRODUCT_BRAND := google
PRODUCT_MANUFACTURER := Google
