#
# SPDX-FileCopyrightText: 2021 The Android Open-Source Project
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-FileCopyrightText: The Calyx Institute
# SPDX-License-Identifier: Apache-2.0
#

TARGET_RECOVERY_DEFAULT_ROTATION := ROTATION_LEFT
TARGET_RECOVERY_DEFAULT_TOUCH_ROTATION := $(TARGET_RECOVERY_DEFAULT_ROTATION)

TARGET_LINUX_KERNEL_VERSION := 6.1
TARGET_KERNEL_DEVICE := tangorpro
TARGET_KERNEL_DIR := device/google/$(TARGET_KERNEL_DEVICE)-kernels/$(TARGET_LINUX_KERNEL_VERSION)
TARGET_KERNEL_PLATFORM_SOURCE := google/gs-$(TARGET_LINUX_KERNEL_VERSION)

BOARD_WITHOUT_RADIO := true

DEVICE_PACKAGE_OVERLAYS += device/google/tangorpro/tangorpro/overlay
DEVICE_PACKAGE_OVERLAYS += device/google/tangorpro/tangorpro/overlay-lineage

PRODUCT_PACKAGES += \
        UwbOverlayT6pro \
        WifiOverlayT6pro

# Disable camera flash and autofocus related xml with a disable flag.
# This flag need to be set before device/google/gs201/device.mk
DISABLE_CAMERA_FS_AF := true

# Disable baro, prox, hifi sensor related xml with a disable flag.
DISABLE_SENSOR_BARO_PROX_HIFI := true

# Identify the device type.
# This flag need to be set before device/google/gs201/device.mk
# to have tablet COD setting
USE_TABLET_BT_COD := true

# Disable telephony euicc related xml with a disable flag.
# This flag need to be set before device/google/gs201/device.mk
DISABLE_TELEPHONY_EUICC := true

include device/google/gs201/device-shipping-common.mk

# UWB
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.uwb.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.uwb.xml

# Recovery files
PRODUCT_COPY_FILES += \
    device/google/tangorpro/recovery/init.recovery.device.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.tangorpro.rc

# Bluetooth HAL and Pixel extension
include device/google/tangorpro/bluetooth/syna_default.mk

# Bluetooth OPUS codec
PRODUCT_PRODUCT_PROPERTIES += \
	persist.bluetooth.opus.enabled=true

# Enable Bluetooth AutoOn feature
PRODUCT_PRODUCT_PROPERTIES += \
    bluetooth.server.automatic_turn_on=true

# Fingerprint
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

# Wifi HAL
PRODUCT_SOONG_NAMESPACES += \
    hardware/synaptics/wlan/synadhd/config

# Enable Telecom feature
# b/227692870
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.software.telecom.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.telecom.xml

# Lights HAL
PRODUCT_PACKAGES += \
    android.hardware.lights-service.tangorpro

# Device features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/tablet_core_hardware.xml

# Cast ssid suffix go/gna-oem-device-support
PRODUCT_PRODUCT_PROPERTIES += ro.odm.cast.ssid_suffix=ynn

# SKU specific RROs
PRODUCT_PACKAGES += \
    SettingsOverlayGTU8P

# ANGLE - Almost Native Graphics Layer Engine
PRODUCT_PACKAGES += \
    ANGLE

# GMS
WITH_GMS_COMMS_SUITE := false

# Init
PRODUCT_PACKAGES += \
    init.recovery.tangorpro.touch.rc

# Overlays
PRODUCT_PACKAGES += \
    GrilRadioCustomizableNoRadio \
    SettingsGoogleTangorproOverlay \
    TangorproGMSOverlay \
    TitanSettingsOverlay \
    TitanSettingsProviderOverlay \
    TitanSysuiConfigOverlay

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/$(DEVICE_CODENAME)/vendor.prop

# Sensors
PRODUCT_PACKAGES += \
    sensors.dynamic_sensor_hal

# VINTF
DEVICE_MANIFEST_FILE += \
    $(DEVICE_PATH)/vintf/manifest.xml
DEVICE_PRODUCT_COMPATIBILITY_MATRIX_FILE += \
    $(DEVICE_PATH)/vintf/device_framework_matrix_product.xml
