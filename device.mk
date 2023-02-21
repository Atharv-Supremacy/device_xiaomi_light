#
# Copyright (C) 2023 The PixelExperience Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Include GSI keys
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Virtual A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Dalvik configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# API
PRODUCT_SHIPPING_API_LEVEL := 30

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# A/B
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# Boot Control
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-mtkimpl \
    android.hardware.boot@1.2-mtkimpl.recovery

PRODUCT_PACKAGES += \
    libmtk_bsg \
    libmtk_bsg.recovery

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl.recovery

# MediaTek Preloader Utils
PRODUCT_PACKAGES += \
    mtk_plpath_utils \
    mtk_plpath_utils.recovery

# Rootdir
PRODUCT_PACKAGES += \
    getwlansar.sh \
    init.insmod.sh \
    setwlansarhigh.sh \
    setsarcal.sh \
    setwlansarlow.sh \

PRODUCT_PACKAGES += \
    fstab.mt6833 \
    meta_init.modem.rc \
    init.project.rc \
    init_connectivity.rc \
    init.connectivity.common.rc \
    multi_init.rc \
    meta_init.project.rc \
    init.aee.rc \
    meta_init.connectivity.common.rc \
    factory_init.connectivity.common.rc \
    meta_init.connectivity.rc \
    factory_init.connectivity.rc \
    init.connectivity.rc \
    init.mt6833.usb.rc \
    factory_init.rc \
    init.ago.rc \
    init.sensor_2_0.rc \
    init.mt6833.rc \
    init.modem.rc \
    factory_init.project.rc \
    meta_init.rc \
    miui.factoryreset.rc \
    init.recovery.hardware.rc \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.mt6833:$(TARGET_VENDOR_RAMDISK_OUT)/first_stage_ramdisk/fstab.mt6833

# Screen Resolution
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# Soong Namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)
