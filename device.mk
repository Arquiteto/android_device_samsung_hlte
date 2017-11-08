#
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
#

GAPPS_VARIANT := micro
PRODUCT_PACKAGES += Maps
PRODUCT_PACKAGES += Photos
PRODUCT_PACKAGES += YouTube
PRODUCT_PACKAGES += Chrome
PRODUCT_PACKAGES += Docs
PRODUCT_PACKAGES += Drive
PRODUCT_PACKAGES += Keep
PRODUCT_PACKAGES += PlayGames
PRODUCT_PACKAGES += Sheets
PRODUCT_PACKAGES += ContactsGoogle
PRODUCT_PACKAGES += DialerGoogle
PRODUCT_PACKAGES += PixelLauncher
PRODUCT_PACKAGES += PixelIcons
PRODUCT_PACKAGES += Wallpapers
PRODUCT_PACKAGES += AndroidPay
PRODUCT_PACKAGES += Translate
GAPPS_EXCLUDED_PACKAGES := GoogleNow
GAPPS_FORCE_DIALER_OVERRIDES := true
GAPPS_FORCE_BROWSER_OVERRIDES := true
GAPPS_FORCE_PIXEL_LAUNCHER := true

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Get non-open-source specific aspects
$(call inherit-product-if-exists, vendor/samsung/hlte/hlte-vendor.mk)

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# NFC
PRODUCT_PACKAGES += \
    nfc_nci.bcm2079x.default \
    com.android.nfc_extras \
    NfcNci \
    Tag

PRODUCT_COPY_FILES += \
    device/samsung/hlte-common/configs/nfcee_access.xml:system/etc/nfcee_access.xml \
    $(LOCAL_PATH)/configs/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
    $(LOCAL_PATH)/configs/libnfc-brcm-20791b04.conf:system/etc/libnfc-brcm-20791b04.conf \
    $(LOCAL_PATH)/configs/libnfc-brcm-20791b05.conf:system/etc/libnfc-brcm-20791b05.conf

# Common hlte
$(call inherit-product, device/samsung/hlte-common/hlte.mk)

$(call inherit-product, vendor/opengapps/build/opengapps-packages.mk)
