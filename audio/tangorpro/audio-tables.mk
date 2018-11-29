#
# Copyright (C) 2021 The Android Open-Source Project
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

AUDIO_TABLE_FOLDER := tangorpro

# Enable this to build AIDL
BUILD_AUDIO_AIDL_VERSION := false

ifeq ($(BUILD_AUDIO_AIDL_VERSION),true)
PRODUCT_COPY_FILES += \
    device/google/tangorpro/audio/$(AUDIO_TABLE_FOLDER)/aidl_config/audio_platform_configuration_aidl.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_configuration_aidl.xml \
    device/google/tangorpro/audio/$(AUDIO_TABLE_FOLDER)/aidl_config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    device/google/tangorpro/audio/$(AUDIO_TABLE_FOLDER)/aidl_config/mixer_paths_aidl.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_aidl.xml
else
# Platform Configuration for AudioHAL / SoundTriggerHAL
PRODUCT_COPY_FILES += \
    device/google/tangorpro/audio/$(AUDIO_TABLE_FOLDER)/config/audio_policy_configuration_bluetooth_legacy_hal.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_bluetooth_legacy_hal.xml \
    device/google/tangorpro/audio/$(AUDIO_TABLE_FOLDER)/config/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    device/google/tangorpro/audio/$(AUDIO_TABLE_FOLDER)/config/audio_policy_configuration_a2dp_offload_disabled.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_a2dp_offload_disabled.xml \
    device/google/tangorpro/audio/$(AUDIO_TABLE_FOLDER)/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    device/google/tangorpro/audio/$(AUDIO_TABLE_FOLDER)/config/audio_platform_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_configuration.xml \
    device/google/tangorpro/audio/$(AUDIO_TABLE_FOLDER)/config/sound_trigger_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_configuration.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_with_le_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration_7_0.xml

# AudioEffectHAL Configuration
PRODUCT_COPY_FILES += \
    device/google/tangorpro/audio/$(AUDIO_TABLE_FOLDER)/config/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml

# Mixer Path Configuration for AudioHAL
PRODUCT_COPY_FILES += \
    device/google/tangorpro/audio/$(AUDIO_TABLE_FOLDER)/config/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml
endif

# Speaker firmware files
SPK_FIRMWARE_PATH := $(AUDIO_TABLE_FOLDER)/cs35l41/fw
SPK_FIRMWARE_FULL_PATH := device/google/tangorpro/audio/$(SPK_FIRMWARE_PATH)

PRODUCT_COPY_FILES += $(call copy-files,$(wildcard  $(SPK_FIRMWARE_FULL_PATH)/*),$(TARGET_COPY_OUT_VENDOR)/firmware)

# Audio tuning
PRODUCT_COPY_FILES += \
    device/google/tangorpro/audio/$(AUDIO_TABLE_FOLDER)/tuning/bluenote/recording.gatf:$(TARGET_COPY_OUT_VENDOR)/etc/aoc/recording.gatf \
    device/google/tangorpro/audio/$(AUDIO_TABLE_FOLDER)/tuning/bluenote/smartfeature.gstf:$(TARGET_COPY_OUT_VENDOR)/etc/aoc/smartfeature.gstf \
    device/google/tangorpro/audio/$(AUDIO_TABLE_FOLDER)/tuning/fortemedia/BLUETOOTH.dat:$(TARGET_COPY_OUT_VENDOR)/etc/aoc/BLUETOOTH.dat \
    device/google/tangorpro/audio/$(AUDIO_TABLE_FOLDER)/tuning/fortemedia/HANDSFREE.dat:$(TARGET_COPY_OUT_VENDOR)/etc/aoc/HANDSFREE.dat \
    device/google/tangorpro/audio/$(AUDIO_TABLE_FOLDER)/tuning/fortemedia/HANDSET.dat:$(TARGET_COPY_OUT_VENDOR)/etc/aoc/HANDSET.dat \
    device/google/tangorpro/audio/$(AUDIO_TABLE_FOLDER)/tuning/fortemedia/HEADSET.dat:$(TARGET_COPY_OUT_VENDOR)/etc/aoc/HEADSET.dat \
    device/google/tangorpro/audio/$(AUDIO_TABLE_FOLDER)/tuning/fortemedia/mcps.dat:$(TARGET_COPY_OUT_VENDOR)/etc/aoc/mcps.dat \
    device/google/tangorpro/audio/$(AUDIO_TABLE_FOLDER)/tuning/waves/waves_config.ini:$(TARGET_COPY_OUT_VENDOR)/etc/waves_config.ini \
    device/google/tangorpro/audio/$(AUDIO_TABLE_FOLDER)/tuning/waves/waves_preset.mps:$(TARGET_COPY_OUT_VENDOR)/etc/waves_preset.mps \
    device/google/tangorpro/audio/$(AUDIO_TABLE_FOLDER)/tuning/apmg3/uplink_handset_aec_on_config.pb:$(TARGET_COPY_OUT_VENDOR)/etc/aoc/uplink_handset_aec_on_config.pb \
    device/google/tangorpro/audio/$(AUDIO_TABLE_FOLDER)/tuning/apmg3/uplink_wired_headset_aec_on_config.pb:$(TARGET_COPY_OUT_VENDOR)/etc/aoc/uplink_wired_headset_aec_on_config.pb \
    device/google/tangorpro/audio/$(AUDIO_TABLE_FOLDER)/tuning/apmg3/uplink_bluetooth_headset_aec_on_config.pb:$(TARGET_COPY_OUT_VENDOR)/etc/aoc/uplink_bluetooth_headset_aec_on_config.pb \
    device/google/tangorpro/audio/$(AUDIO_TABLE_FOLDER)/tuning/apmg3/uplink_dock_aec_on_config.pb:$(TARGET_COPY_OUT_VENDOR)/etc/aoc/uplink_dock_aec_on_config.pb \
    device/google/tangorpro/audio/$(AUDIO_TABLE_FOLDER)/tuning/apmg3/uplink_speaker_aec_on_config.pb:$(TARGET_COPY_OUT_VENDOR)/etc/aoc/uplink_speaker_aec_on_config.pb \
    device/google/tangorpro/audio/$(AUDIO_TABLE_FOLDER)/tuning/apmg3/uplink_external_speaker_aec_on_config.pb:$(TARGET_COPY_OUT_VENDOR)/etc/aoc/uplink_external_speaker_aec_on_config.pb \
    device/google/tangorpro/audio/$(AUDIO_TABLE_FOLDER)/tuning/apmg3/uplink_handset_aec_off_config.pb:$(TARGET_COPY_OUT_VENDOR)/etc/aoc/uplink_handset_aec_off_config.pb \
    device/google/tangorpro/audio/$(AUDIO_TABLE_FOLDER)/tuning/apmg3/uplink_wired_headset_aec_off_config.pb:$(TARGET_COPY_OUT_VENDOR)/etc/aoc/uplink_wired_headset_aec_off_config.pb \
    device/google/tangorpro/audio/$(AUDIO_TABLE_FOLDER)/tuning/apmg3/uplink_bluetooth_headset_aec_off_config.pb:$(TARGET_COPY_OUT_VENDOR)/etc/aoc/uplink_bluetooth_headset_aec_off_config.pb \
    device/google/tangorpro/audio/$(AUDIO_TABLE_FOLDER)/tuning/apmg3/uplink_dock_aec_off_config.pb:$(TARGET_COPY_OUT_VENDOR)/etc/aoc/uplink_dock_aec_off_config.pb \
    device/google/tangorpro/audio/$(AUDIO_TABLE_FOLDER)/tuning/apmg3/uplink_speaker_aec_off_config.pb:$(TARGET_COPY_OUT_VENDOR)/etc/aoc/uplink_speaker_aec_off_config.pb \
    device/google/tangorpro/audio/$(AUDIO_TABLE_FOLDER)/tuning/apmg3/uplink_external_speaker_aec_off_config.pb:$(TARGET_COPY_OUT_VENDOR)/etc/aoc/uplink_external_speaker_aec_off_config.pb \
    device/google/tangorpro/audio/$(AUDIO_TABLE_FOLDER)/tuning/apmg3/downlink_handset_config.pb:$(TARGET_COPY_OUT_VENDOR)/etc/aoc/downlink_handset_config.pb \
    device/google/tangorpro/audio/$(AUDIO_TABLE_FOLDER)/tuning/apmg3/downlink_wired_headset_config.pb:$(TARGET_COPY_OUT_VENDOR)/etc/aoc/downlink_wired_headset_config.pb \
    device/google/tangorpro/audio/$(AUDIO_TABLE_FOLDER)/tuning/apmg3/downlink_bluetooth_headset_config.pb:$(TARGET_COPY_OUT_VENDOR)/etc/aoc/downlink_bluetooth_headset_config.pb \
    device/google/tangorpro/audio/$(AUDIO_TABLE_FOLDER)/tuning/apmg3/downlink_dock_config.pb:$(TARGET_COPY_OUT_VENDOR)/etc/aoc/downlink_dock_config.pb \
    device/google/tangorpro/audio/$(AUDIO_TABLE_FOLDER)/tuning/apmg3/downlink_speaker_config.pb:$(TARGET_COPY_OUT_VENDOR)/etc/aoc/downlink_speaker_config.pb \
    device/google/tangorpro/audio/$(AUDIO_TABLE_FOLDER)/tuning/apmg3/downlink_external_speaker_config.pb:$(TARGET_COPY_OUT_VENDOR)/etc/aoc/downlink_external_speaker_config.pb

# userdebug specific
ifneq (,$(filter eng, $(TARGET_BUILD_VARIANT)))
PRODUCT_COPY_FILES += \
    device/google/tangorpro/audio/$(AUDIO_TABLE_FOLDER)/tuning/fortemedia/BLUETOOTH.mods:$(TARGET_COPY_OUT_VENDOR)/etc/aoc/BLUETOOTH.mods \
    device/google/tangorpro/audio/$(AUDIO_TABLE_FOLDER)/tuning/fortemedia/HANDSFREE.mods:$(TARGET_COPY_OUT_VENDOR)/etc/aoc/HANDSFREE.mods \
    device/google/tangorpro/audio/$(AUDIO_TABLE_FOLDER)/tuning/fortemedia/HANDSET.mods:$(TARGET_COPY_OUT_VENDOR)/etc/aoc/HANDSET.mods \
    device/google/tangorpro/audio/$(AUDIO_TABLE_FOLDER)/tuning/fortemedia/HEADSET.mods:$(TARGET_COPY_OUT_VENDOR)/etc/aoc/HEADSET.mods

# Mixer Path Configuration for Audio Speaker Calibration Tool crus_sp_cal
PRODUCT_COPY_FILES += \
    device/google/tangorpro/audio/$(AUDIO_TABLE_FOLDER)/cs35l41/crus_sp_cal_mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/crus_sp_cal_mixer_paths.xml

# Waves ini/mps files for unit tests of halcontroller
PRODUCT_COPY_FILES += \
    device/google/tangorpro/audio/$(AUDIO_TABLE_FOLDER)/tuning/waves/tests/test_config.ini:$(TARGET_COPY_OUT_VENDOR)/etc/test_config.ini \
    device/google/tangorpro/audio/$(AUDIO_TABLE_FOLDER)/tuning/waves/tests/test_preset.mps:$(TARGET_COPY_OUT_VENDOR)/etc/test_preset.mps

endif
