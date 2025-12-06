
#
# Copyright (C) 2022 The Android Open-Source Project
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

# Override BQR mask to enable LE Audio Choppy report
PRODUCT_PRODUCT_PROPERTIES += \
    persist.bluetooth.bqr.event_mask=94

# Not support LE Audio dual mic SWB call based on the current launch strategy
PRODUCT_PRODUCT_PROPERTIES += \
    bluetooth.leaudio.dual_bidirection_swb.supported=false

# Bluetooth Super Wide Band
PRODUCT_PRODUCT_PROPERTIES += \
    bluetooth.hfp.swb.supported=false

# Bluetooth LE Audio
PRODUCT_PRODUCT_PROPERTIES += \
    ro.bluetooth.leaudio_switcher.supported=true \
    bluetooth.profile.bap.unicast.client.enabled?=true \
    bluetooth.profile.csip.set_coordinator.enabled?=true \
    bluetooth.profile.hap.client.enabled?=true \
    bluetooth.profile.mcp.server.enabled?=true \
    bluetooth.profile.ccp.server.enabled?=true \
    bluetooth.profile.vcp.controller.enabled?=true \

# LE Audio Lunch Config for Phase 1 (LE audio toggle hidden by default)
PRODUCT_PRODUCT_PROPERTIES += \
    persist.bluetooth.leaudio.toggle_visible=false

# LE Audio use classic connection by default
PRODUCT_PRODUCT_PROPERTIES += \
    ro.bluetooth.leaudio.le_audio_connection_by_default=false

# Bluetooth HAL
PRODUCT_PACKAGES += \
        android.hardware.bluetooth.prebuilt.xml \
        android.hardware.bluetooth_le.prebuilt.xml

PRODUCT_PRODUCT_PROPERTIES += \
    persist.bluetooth.firmware.selection="BTFW.hcd"

# Disable MAP, PBAP and SAP profiles
PRODUCT_PRODUCT_PROPERTIES += \
       bluetooth.profile.map.server.enabled=false \
       bluetooth.profile.pbap.server.enabled=false \
       bluetooth.profile.sap.server.enabled=false \
