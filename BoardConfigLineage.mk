#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

BUILD_BROKEN_DUP_RULES := true

# Kernel
TARGET_KERNEL_CONFIG := tangorpro_gki_defconfig
TARGET_KERNEL_DTBO_PREFIX := dts/
TARGET_KERNEL_DTBO := google/devices/tangorpro/dtbo.img
TARGET_KERNEL_DTB := \
    google/devices/tangorpro/google-base/gs201-a0.dtb \
    google/devices/tangorpro/google-base/gs201-b0.dtb \
    google/devices/tangorpro/google-base/gs201-b0_v2-ipop.dtb

# Kernel modules
BOARD_VENDOR_KERNEL_MODULES_LOAD_RAW := $(strip $(shell cat device/google/tangorpro/vendor_dlkm.modules.load))
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(foreach m,$(BOARD_VENDOR_KERNEL_MODULES_LOAD_RAW),$(notdir $(m)))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD_RAW := $(strip $(shell cat device/google/tangorpro/vendor_kernel_boot.modules.load))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(foreach m,$(BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD_RAW),$(notdir $(m)))
BOOT_KERNEL_MODULES := $(BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD)
