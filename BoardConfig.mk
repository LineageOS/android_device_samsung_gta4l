#
# Copyright (C) 2023 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# inherit from common gta4l-common
-include device/samsung/gta4l-common/BoardConfigCommon.mk

DEVICE_PATH := device/samsung/gta4l

# Assert
TARGET_OTA_ASSERT_DEVICE := gta4l

# Board
TARGET_BOARD_NAME := P85943AA1
TARGET_BOOTIMAGE_BOARD_NAME := SRPTC24A004

# HIDL
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE += $(DEVICE_PATH)/framework_compatibility_matrix.xml

DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Kernel
TARGET_KERNEL_CONFIG := gta4l_eur_open_defconfig
BOARD_MKBOOTIMG_ARGS += --board $(TARGET_BOOTIMAGE_BOARD_NAME)

# Partitions
BOARD_GTA4L_DYNAMIC_PARTITIONS_SIZE := 5750390784 # (BOARD_SUPER_PARTITION_SIZE - "Reasonable Overhead of 4 MiB" 4194304)
BOARD_SUPER_PARTITION_SIZE := 5754585088

# Properties
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# SELinux
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/system_ext/private

# inherit from the proprietary version
include vendor/samsung/gta4l/BoardConfigVendor.mk
