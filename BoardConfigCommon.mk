# Copyright (C) 2014 The CyanogenMod Project
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

# Inherit from qcom-common
-include device/samsung/qcom-common/BoardConfigCommon.mk

LOCAL_PATH := device/samsung/msm8226-common

TARGET_SPECIFIC_HEADER_PATH := device/samsung/msm8226-common/include

# Architecture
TARGET_CPU_VARIANT := krait

# Audio
AUDIO_FEATURE_ENABLED_HWDEP_CAL := true
AUDIO_FEATURE_ENABLED_LOW_LATENCY_CAPTURE := true
AUDIO_FEATURE_LOW_LATENCY_PRIMARY := true
BOARD_USES_ALSA_AUDIO := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8226
#TARGET_NO_BOOTLOADER := true
#TARGET_NO_RADIOIMAGE := true

# Camera
BOARD_USES_LEGACY_MMAP := true
TARGET_PROVIDES_CAMERA_HAL := true
USE_DEVICE_SPECIFIC_CAMERA := true

# Charger
BOARD_BATTERY_DEVICE_NAME := "battery"
BOARD_CHARGING_CMDLINE_NAME := "androidboot.mode"
BOARD_CHARGING_CMDLINE_VALUE := "charger"
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_SHOW_PERCENTAGE := true 

# Display
BOARD_EGL_CFG := $(LOCAL_PATH)/configs/egl.cfg
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024

# FM
AUDIO_FEATURE_ENABLED_FM := true
TARGET_QCOM_NO_FM_FIRMWARE := true

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# Init
TARGET_INIT_VENDOR_LIB := libinit_msm

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Partitions and Vold
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Platform
TARGET_BOARD_PLATFORM := msm8226
TARGET_BOARD_PLATFORM_GPU := qcom-adreno305

# Power
#TARGET_POWERHAL_SET_INTERACTIVE_EXT := $(LOCAL_PATH)/power/power_ext.c
TARGET_POWERHAL_VARIANT := cm

# Recovery fast wipe
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD

# Flip cover sensor
BOARD_HAS_EXTENDED_SWITCH := true

# Skip droiddoc build to save build time
BOARD_SKIP_ANDROID_DOC_BUILD := true

# Wifi
BOARD_HAS_QCOM_WLAN              := true
BOARD_HAS_QCOM_WLAN_SDK          := true
BOARD_WLAN_DEVICE                := qcwcn
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
TARGET_PROVIDES_WCNSS_QMI        := true
TARGET_USES_QCOM_WCNSS_QMI       := true
TARGET_USES_WCNSS_CTRL           := true
WPA_SUPPLICANT_VERSION           := VER_0_8_X
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME          := "wlan"

WLAN_MODULES:
	mkdir -p $(KERNEL_MODULES_OUT)/pronto
	mv $(KERNEL_MODULES_OUT)/wlan.ko $(KERNEL_MODULES_OUT)/pronto/pronto_wlan.ko
	ln -sf /system/lib/modules/pronto/pronto_wlan.ko $(TARGET_OUT)/lib/modules/wlan.ko

TARGET_KERNEL_MODULES += WLAN_MODULES
