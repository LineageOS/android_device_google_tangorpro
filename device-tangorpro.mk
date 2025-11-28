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

# PowerStats HAL
PRODUCT_SOONG_NAMESPACES += device/google/tangorpro/powerstats

# Bluetooth HAL and Pixel extension
include device/google/tangorpro/bluetooth/syna_default.mk

# optimize spatializer effect
PRODUCT_PROPERTY_OVERRIDES += \
	audio.spatializer.effect.util_clamp_min=300

# declare use of spatial audio
PRODUCT_PROPERTY_OVERRIDES += \
	ro.audio.spatializer_enabled=true \
	persist.vendor.audio.spatializer.speaker_enabled=true

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

# Wifi SAP Interface Name
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.wifi.sap.interface=wlan1

# Assistant minimum volume
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.assistant_vol_min=1

# Temporary override to synchronise changes in pa/ and ag/. See b/246793311 for context.
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.surface_flinger.primary_display_orientation=ORIENTATION_0
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += debug.sf.ignore_hwc_physical_display_orientation=true

# Set boot animation orientation and default display rotation to be landscape since Tangor
# natural orientation is portrait. Id at the end corresponds to the display id on the device.
# See b/246793311 for context.
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.bootanim.set_orientation_4619827677550801152=ORIENTATION_270

# Display white balance
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
        ro.surface_flinger.display_primary_red=0.5128,0.2413,0.0000 \
        ro.surface_flinger.display_primary_green=0.2598,0.6764,0.0441 \
        ro.surface_flinger.display_primary_blue=0.2057,0.0823,1.0832 \
        ro.surface_flinger.display_primary_white=0.9783,1.0000,1.1273

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

# Enable HWC dynamic recomposition for display with index 0
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += vendor.display.dynamic_recomposition=1

# Display LBE
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += vendor.display.lbe.supported=1

# Display CABC
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += vendor.display.cabc.supported?=1

# Set zram size
PRODUCT_VENDOR_PROPERTIES += \
    vendor.zram.size=3g

# Increase thread priority for nodes stop
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.camera.increase_thread_priority_nodes_stop=true \
    persist.vendor.camera.debug.bypass_csi_link_crc_error=true

# Cast ssid suffix go/gna-oem-device-support
PRODUCT_PRODUCT_PROPERTIES += ro.odm.cast.ssid_suffix=ynn

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.camera.adjust_backend_min_freq_for_1p_front_video_1080p_30fps=1 \
    persist.vendor.camera.bypass_sensor_binning_resolution_condition=1 \
    persist.vendor.camera.extended_launch_boost=1 \
    persist.vendor.camera.raise_buf_allocation_priority=1 \
    camera.enable_landscape_to_portrait=true

# Enable camera exif model/make reporting
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.camera.exif_reveal_make_model=true

# Set device family property for SMR
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.device_family=T6P

# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    ro.audio.multi_usb_mode=true

#Audio
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.audio.speech_enhancement.enable=1

# SKU specific RROs
PRODUCT_PACKAGES += \
    SettingsOverlayGTU8P

# ANGLE - Almost Native Graphics Layer Engine
PRODUCT_PACKAGES += \
    ANGLE \
    libEGL_angle \
    libGLESv1_CM_angle \
    libGLESv2_angle

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
