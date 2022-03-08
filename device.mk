#
# Copyright (C) 2018 The LineageOS Project
# Copyright (C) 2018-2021 The Xiaomi-SDM660 Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit common tree and GCam makefiles
$(call inherit-product, device/xiaomi/sdm660-common/sdm660.mk)
$(call inherit-product-if-exists, packages/apps/GoogleCamera/gcam.mk)

# Board
TARGET_BOARD_PLATFORM := sdm660

# Device Path
DEVICE_PATH := device/xiaomi/lavender

# Kernel
TARGET_KERNEL_VERSION := 4.19

# Soong
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
	 $(DEVICE_PATH)/overlay

# Audio
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/audio/audio_platform_info_intcodec.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info_intcodec.xml \
	$(DEVICE_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml

# Boot animation
TARGET_BOOTANIMATION_SIZE := 1080
TARGET_SCREEN_HEIGHT := 2340
TARGET_SCREEN_WIDTH := 1080

# Consumerir
PRODUCT_PACKAGES += \
	android.hardware.ir@1.0-impl \
	android.hardware.ir@1.0-service

# Device properties
$(call inherit-product, $(DEVICE_PATH)/device_prop.mk)

# FM
BOARD_HAVE_QCOM_FM := true

# Fstab
PRODUCT_PACKAGES += \
	fstab.qcom

# Media
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.consumerir.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.consumerir.xml

# Properties ($PATH.prop)
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/product.prop

# Keylayout
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/keylayout/sdm660-snd-card_Button_Jack.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/sdm660-snd-card_Button_Jack.kl

# Ramdisk
PRODUCT_PACKAGES += \
	init.device.rc

# Recovery
PRODUCT_PACKAGES += \
    librecovery_updater_lavender

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Sensors
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/sensors/sensor_def_qcomdev.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/sensor_def_qcomdev.conf \
	$(DEVICE_PATH)/sensors/elliptic.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/elliptic.conf

# Vibrator
PRODUCT_PACKAGES += \
	vendor.qti.hardware.vibrator.service

# Wifi
PRODUCT_PACKAGES += \
    LavenderWifiOverlay

# Vendor files
$(call inherit-product, vendor/xiaomi/lavender/lavender-vendor.mk)
