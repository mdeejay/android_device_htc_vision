#
# Copyright (C) 2011 The CyanogenMod Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# First, the most specific values, i.e. the aspects that are specific to GSM
PRODUCT_COPY_FILES += \
    device/htc/vision/init:root/init \
    device/htc/vision/init.vision.rc:root/init.vision.rc \
    device/htc/vision/init.rc:root/init.rc \
    device/htc/vision/ueventd.vision.rc:root/ueventd.vision.rc


#Toushcreen config files
PRODUCT_COPY_FILES += \
    device/htc/vision/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc \

#Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/vision/vision-vendor.mk)

#Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-htc \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=2.3_r3 \
    keyguard.no_require_sim=true \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    persist.sys.usb.config=adb,mass_storage

# Override /proc/sys/vm/dirty_ratio on UMS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=20

# Disable visual strict mode, even on eng builds
PRODUCT_DEFAULT_PROPERTY += \
persist.sys.strictmode.visual=0

DEVICE_PACKAGE_OVERLAYS += device/htc/vision/overlay

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \

# GSM voicemail config xml file
PRODUCT_COPY_FILES += \
    device/htc/vision/voicemail-conf.xml:system/etc/voicemail-conf.xml

# Misc
PRODUCT_PACKAGES += \
    lights.vision \
    sensors.vision \
    gps.vision \
    audio_policy.msm7x30 \
    audio.primary.msm7x30 \
    audio.a2dp.default \
    libaudioutils \
    libtinyalsa \
    com.android.future.usb.accessory

# Video
PRODUCT_PACKAGES += \
    copybit.msm7x30 \
    gralloc.msm7x30 \
    hwcomposer.msm7x30 \
    libgenlock \
    libmemalloc \
    libQcomUI \
    libtilerenderer \
    liboverlay


# Omx
PRODUCT_PACKAGES += \
    libOmxCore \
    libOmxVenc \
    libOmxVdec

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    NoiseField \
    PhaseBeam \
    MagicSmoke \
    Galaxy4 \
    HoloSpiralWallpaper \
    librs_jni


# missing packages
PRODUCT_PACKAGES += \
    Mms \
    Stk \
    com.android.future.usb.accessory \
    Superuser \
    su

# Nexus Prime bootanimation
PRODUCT_COPY_FILES += \
    device/htc/vision/media/bootanimation.zip:system/media/bootanimation.zip

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/vision/keychars/vision-keypad-ara.kcm:system/usr/keychars/vision-keypad-ara.kcm \
    device/htc/vision/keychars/vision-keypad-ell.kcm:system/usr/keychars/vision-keypad-ell.kcm \
    device/htc/vision/keychars/vision-keypad-esn.kcm:system/usr/keychars/vision-keypad-esn.kcm \
    device/htc/vision/keychars/vision-keypad-fra.kcm:system/usr/keychars/vision-keypad-fra.kcm \
    device/htc/vision/keychars/vision-keypad-ger.kcm:system/usr/keychars/vision-keypad-ger.kcm \
    device/htc/vision/keychars/vision-keypad-hk.kcm:system/usr/keychars/vision-keypad-hk.kcm \
    device/htc/vision/keychars/vision-keypad-ita.kcm:system/usr/keychars/vision-keypad-ita.kcm \
    device/htc/vision/keychars/vision-keypad.kcm:system/usr/keychars/vision-keypad.kcm \
    device/htc/vision/keychars/vision-keypad-nor.kcm:system/usr/keychars/vision-keypad-nor.kcm \
    device/htc/vision/keychars/vision-keypad-rus.kcm:system/usr/keychars/vision-keypad-rus.kcm \
    device/htc/vision/keychars/vision-keypad-sea.kcm:system/usr/keychars/vision-keypad-sea.kcm \
    device/htc/vision/keychars/vision-keypad-tur.kcm:system/usr/keychars/vision-keypad-tur.kcm \
    device/htc/vision/keychars/vision-keypad-wwe-bopomo.kcm:system/usr/keychars/vision-keypad-wwe-bopomo.kcm \
    device/htc/vision/keychars/vision-keypad-wwe.kcm:system/usr/keychars/vision-keypad-wwe.kcm \
    device/htc/vision/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/vision/keylayout/vision-keypad-ara.kl:system/usr/keylayout/vision-keypad-ara.kl \
    device/htc/vision/keylayout/vision-keypad-ell.kl:system/usr/keylayout/vision-keypad-ell.kl \
    device/htc/vision/keylayout/vision-keypad-esn.kl:system/usr/keylayout/vision-keypad-esn.kl \
    device/htc/vision/keylayout/vision-keypad-fra.kl:system/usr/keylayout/vision-keypad-fra.kl \
    device/htc/vision/keylayout/vision-keypad-ger.kl:system/usr/keylayout/vision-keypad-ger.kl \
    device/htc/vision/keylayout/vision-keypad-hk.kl:system/usr/keylayout/vision-keypad-hk.kl \
    device/htc/vision/keylayout/vision-keypad-ita.kl:system/usr/keylayout/vision-keypad-ita.kl \
    device/htc/vision/keylayout/vision-keypad.kl:system/usr/keylayout/vision-keypad.kl \
    device/htc/vision/keylayout/vision-keypad-nor.kl:system/usr/keylayout/vision-keypad-nor.kl \
    device/htc/vision/keylayout/vision-keypad-rus.kl:system/usr/keylayout/vision-keypad-rus.kl \
    device/htc/vision/keylayout/vision-keypad-sea.kl:system/usr/keylayout/vision-keypad-sea.kl \
    device/htc/vision/keylayout/vision-keypad-tur.kl:system/usr/keylayout/vision-keypad-tur.kl \
    device/htc/vision/keylayout/vision-keypad-wwe-bopomo.kl:system/usr/keylayout/vision-keypad-wwe-bopomo.kl \
    device/htc/vision/keylayout/vision-keypad-wwe.kl:system/usr/keylayout/vision-keypad-wwe.kl \
    device/htc/vision/keylayout/atmel-touchscreen.kl:system/usr/keylayout/atmel-touchscreen.kl \
    device/htc/vision/keylayout/curcial-oj.kl:system/usr/keylayout/curcial-oj.kl

# IDC
PRODUCT_COPY_FILES += \
	device/htc/vision/idc/vision-keypad-ara.idc:system/usr/idc/vision-keypad-ara.idc \
        device/htc/vision/idc/vision-keypad-ell.idc:system/usr/idc/vision-keypad-ell.idc \
        device/htc/vision/idc/vision-keypad-esn.idc:system/usr/idc/vision-keypad-esn.idc \
        device/htc/vision/idc/vision-keypad-fra.idc:system/usr/idc/vision-keypad-fra.idc \
        device/htc/vision/idc/vision-keypad-ger.idc:system/usr/idc/vision-keypad-ger.idc \
        device/htc/vision/idc/vision-keypad-hk.idc:system/usr/idc/vision-keypad-hk.idc \
        device/htc/vision/idc/vision-keypad.idc:system/usr/idc/vision-keypad.idc \
        device/htc/vision/idc/vision-keypad-ita.idc:system/usr/idc/vision-keypad-ita.idc \
        device/htc/vision/idc/vision-keypad-nor.idc:system/usr/idc/vision-keypad-nor.idc \
        device/htc/vision/idc/vision-keypad-rus.idc:system/usr/idc/vision-keypad-rus.idc \
        device/htc/vision/idc/vision-keypad-sea.idc:system/usr/idc/vision-keypad-sea.idc \
        device/htc/vision/idc/vision-keypad-tur.idc:system/usr/idc/vision-keypad-tur.idc \
	device/htc/vision/idc/vision-keypad-wwe-bopomo.idc:system/usr/idc/vision-keypad-wwe-bopomo.idc \
	device/htc/vision/idc/vision-keypad-wwe.idc:system/usr/idc/vision-keypad-wwe.idc

# Firmware
PRODUCT_COPY_FILES += \
    device/htc/vision/firmware/default.acdb:system/etc/firmware/default.acdb \
    device/htc/vision/firmware/default_org.acdb:system/etc/firmware/default_org.acdb \
    device/htc/vision/firmware/default_org_WA.acdb:system/etc/firmware/default_org_WA.acdb \
    device/htc/vision/firmware/Vision_SPK.acdb:system/etc/firmware/Vision_SPK.acdb \
    device/htc/vision/firmware/vidc_720p_command_control.fw:system/etc/firmware/vidc_720p_command_control.fw \
    device/htc/vision/firmware/vidc_720p_h263_dec_mc.fw:system/etc/firmware/vidc_720p_h263_dec_mc.fw \
    device/htc/vision/firmware/vidc_720p_h264_dec_mc.fw:system/etc/firmware/vidc_720p_h264_dec_mc.fw \
    device/htc/vision/firmware/vidc_720p_h264_enc_mc.fw:system/etc/firmware/vidc_720p_h264_enc_mc.fw \
    device/htc/vision/firmware/vidc_720p_mp4_dec_mc.fw:system/etc/firmware/vidc_720p_mp4_dec_mc.fw \
    device/htc/vision/firmware/vidc_720p_mp4_enc_mc.fw:system/etc/firmware/vidc_720p_mp4_enc_mc.fw \
    device/htc/vision/firmware/vidc_720p_vc1_dec_mc.fw:system/etc/firmware/vidc_720p_vc1_dec_mc.fw \
    device/htc/vision/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    device/htc/vision/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \
    device/htc/vision/firmware/leia_pfp_470.fw:system/etc/firmware/leia_pfp_470.fw \
    device/htc/vision/firmware/leia_pm4_470.fw:system/etc/firmware/leia_pm4_470.fw \
    device/htc/vision/gps.conf:system/etc/gps.conf

# Trackpad calibration file
PRODUCT_COPY_FILES += \
	device/htc/vision/idc/curcial-oj.idc:system/usr/idc/curcial-oj.idc

# Audio DSP Profiles
PRODUCT_COPY_FILES += \
    device/htc/vision/dsp/AIC3254_REG.csv:system/etc/AIC3254_REG.csv \
    device/htc/vision/dsp/AIC3254_REG_XD.csv:system/etc/AIC3254_REG_XD.csv \
    device/htc/vision/dsp/AdieHWCodec.csv:system/etc/AdieHWCodec.csv \
    device/htc/vision/dsp/CodecDSPID.txt:system/etc/CodecDSPID.txt \
    device/htc/vision/dsp/HP_Audio.csv:system/etc/HP_Audio.csv \
    device/htc/vision/dsp/HP_Video.csv:system/etc/HP_Video.csv \
    device/htc/vision/dsp/SPK_Combination.csv:system/etc/SPK_Combination.csv \
    device/htc/vision/dsp/soundimage/Sound_Bass_Booster.txt:system/etc/soundimage/Sound_Bass_Booster.txt \
    device/htc/vision/dsp/soundimage/Sound_Blues.txt:system/etc/soundimage/Sound_Blues.txt \
    device/htc/vision/dsp/soundimage/Sound_Classical.txt:system/etc/soundimage/Sound_Classical.txt \
    device/htc/vision/dsp/soundimage/Sound_Country.txt:system/etc/soundimage/Sound_Country.txt \
    device/htc/vision/dsp/soundimage/Sound_Dolby_A_HP.txt:system/etc/soundimage/Sound_Dolby_A_HP.txt \
    device/htc/vision/dsp/soundimage/Sound_Dolby_A_SPK.txt:system/etc/soundimage/Sound_Dolby_A_SPK.txt \
    device/htc/vision/dsp/soundimage/Sound_Dolby_V_HP.txt:system/etc/soundimage/Sound_Dolby_V_HP.txt \
    device/htc/vision/dsp/soundimage/Sound_Dolby_V_SPK.txt:system/etc/soundimage/Sound_Dolby_V_SPK.txt \
    device/htc/vision/dsp/soundimage/Sound_Dualmic.txt:system/etc/soundimage/Sound_Dualmic.txt \
    device/htc/vision/dsp/soundimage/Sound_Dualmic_EP.txt:system/etc/soundimage/Sound_Dualmic_EP.txt \
    device/htc/vision/dsp/soundimage/Sound_Dualmic_SPK.txt:system/etc/soundimage/Sound_Dualmic_SPK.txt \
    device/htc/vision/dsp/soundimage/Sound_Jazz.txt:system/etc/soundimage/Sound_Jazz.txt \
    device/htc/vision/dsp/soundimage/Sound_Latin.txt:system/etc/soundimage/Sound_Latin.txt \
    device/htc/vision/dsp/soundimage/Sound_New_Age.txt:system/etc/soundimage/Sound_New_Age.txt \
    device/htc/vision/dsp/soundimage/Sound_Original.txt:system/etc/soundimage/Sound_Original.txt \
    device/htc/vision/dsp/soundimage/Sound_Original_SPK.txt:system/etc/soundimage/Sound_Original_SPK.txt \
    device/htc/vision/dsp/soundimage/Sound_Piano.txt:system/etc/soundimage/Sound_Piano.txt \
    device/htc/vision/dsp/soundimage/Sound_Pop.txt:system/etc/soundimage/Sound_Pop.txt \
    device/htc/vision/dsp/soundimage/Sound_R_B.txt:system/etc/soundimage/Sound_R_B.txt \
    device/htc/vision/dsp/soundimage/Sound_Rock.txt:system/etc/soundimage/Sound_Rock.txt \
    device/htc/vision/dsp/soundimage/Sound_SRS_A_HP.txt:system/etc/soundimage/Sound_SRS_A_HP.txt \
    device/htc/vision/dsp/soundimage/Sound_SRS_A_SPK.txt:system/etc/soundimage/Sound_SRS_A_SPK.txt \
    device/htc/vision/dsp/soundimage/Sound_SRS_V_HP.txt:system/etc/soundimage/Sound_SRS_V_HP.txt \
    device/htc/vision/dsp/soundimage/Sound_SRS_V_SPK.txt:system/etc/soundimage/Sound_SRS_V_SPK.txt \
    device/htc/vision/dsp/soundimage/Sound_Treble_Booster.txt:system/etc/soundimage/Sound_Treble_Booster.txt \
    device/htc/vision/dsp/soundimage/Sound_Vocal_Booster.txt:system/etc/soundimage/Sound_Vocal_Booster.txt

# Additional NAM Audio DSP Profiles to NAM Package
PRODUCT_COPY_FILES += \
    device/htc/vision/nam/AIC3254_REG_DualMic_MCLK.csv:system/etc/nam/AIC3254_REG_DualMic_MCLK.csv \
    device/htc/vision/nam/CodecDSPID_MCLK.txt:system/etc/nam/CodecDSPID_MCLK.txt \
    device/htc/vision/nam/Sound_Treble_Booster_MCLK.txt:system/etc/nam/Sound_Treble_Booster_MCLK.txt \
    device/htc/vision/nam/Sound_Vocal_Booster_MCLK.txt:system/etc/nam/Sound_Vocal_Booster_MCLK.txt \
    device/htc/vision/nam/Sound_SRS_A_SPK_MCLK.txt:system/etc/nam/Sound_SRS_A_SPK_MCLK.txt \
    device/htc/vision/nam/Sound_SRS_V_HP_MCLK.txt:system/etc/nam/Sound_SRS_V_HP_MCLK.txt \
    device/htc/vision/nam/Sound_SRS_V_SPK_MCLK.txt:system/etc/nam/Sound_SRS_V_SPK_MCLK.txt \
    device/htc/vision/nam/Sound_Jazz_MCLK.txt:system/etc/nam/Sound_Jazz_MCLK.txt \
    device/htc/vision/nam/Sound_Latin_MCLK.txt:system/etc/nam/Sound_Latin_MCLK.txt \
    device/htc/vision/nam/Sound_New_Age_MCLK.txt:system/etc/nam/Sound_New_Age_MCLK.txt \
    device/htc/vision/nam/Sound_Original_MCLK.txt:system/etc/nam/Sound_Original_MCLK.txt \
    device/htc/vision/nam/Sound_Piano_MCLK.txt:system/etc/nam/Sound_Piano_MCLK.txt \
    device/htc/vision/nam/Sound_Pop_MCLK.txt:system/etc/nam/Sound_Pop_MCLK.txt \
    device/htc/vision/nam/Sound_R_B_MCLK.txt:system/etc/nam/Sound_R_B_MCLK.txt \
    device/htc/vision/nam/Sound_Rock_MCLK.txt:system/etc/nam/Sound_Rock_MCLK.txt \
    device/htc/vision/nam/Sound_SRS_A_HP_MCLK.txt:system/etc/nam/Sound_SRS_A_HP_MCLK.txt \
    device/htc/vision/nam/Sound_Dualmic_SPK_MCLK.txt:system/etc/nam/Sound_Dualmic_SPK_MCLK.txt \
    device/htc/vision/nam/Sound_Dualmic_EP_MCLK.txt:system/etc/nam/Sound_Dualmic_EP_MCLK.txt \
    device/htc/vision/nam/Sound_Dualmic_MCLK.txt:system/etc/nam/Sound_Dualmic_MCLK.txt \
    device/htc/vision/nam/Sound_Dolby_A_SPK_MCLK.txt:system/etc/nam/Sound_Dolby_A_SPK_MCLK.txt \
    device/htc/vision/nam/Sound_Dolby_HP_MCLK.txt:system/etc/nam/Sound_Dolby_HP_MCLK.txt \
    device/htc/vision/nam/Sound_Dolby_Spk_MCLK.txt:system/etc/nam/Sound_Dolby_Spk_MCLK.txt \
    device/htc/vision/nam/Sound_Dolby_V_HP_MCLK.txt:system/etc/nam/Sound_Dolby_V_HP_MCLK.txt \
    device/htc/vision/nam/Sound_Dolby_V_SPK_MCLK.txt:system/etc/nam/Sound_Dolby_V_SPK_MCLK.txt \
    device/htc/vision/nam/Sound_Dolby_A_HP_MCLK.txt:system/etc/nam/Sound_Dolby_A_HP_MCLK.txt \
    device/htc/vision/nam/Sound_Bass_Booster_MCLK.txt:system/etc/nam/Sound_Bass_Booster_MCLK.txt \
    device/htc/vision/nam/Sound_Blues_MCLK.txt:system/etc/nam/Sound_Blues_MCLK.txt \
    device/htc/vision/nam/Sound_Classical_MCLK.txt:system/etc/nam/Sound_Classical_MCLK.txt \
    device/htc/vision/nam/Sound_Country_MCLK.txt:system/etc/nam/Sound_Country_MCLK.txt

PRODUCT_COPY_FILES += \
    device/htc/vision/vold.fstab:system/etc/vold.fstab

PRODUCT_COPY_FILES += \
    device/htc/vision/modules/bcm4329.ko:system/lib/modules/bcm4329.ko

LOCAL_KERNEL := device/htc/vision/kernel/kernel

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full_base.mk)

# we have enough storage spvision to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# use high-density artwork where available
PRODUCT_LOCALES += hdpi

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml

# htc audio settings
$(call inherit-product, device/htc/vision/media_htcaudio.mk)

# Prebuilt libraries that are needed to build open-source libraries
PRODUCT_COPY_FILES += \
    device/htc/vision/proprietary/libaudioalsa.so:obj/lib/libaudioalsa.so

# All the blobs necessary for vision
PRODUCT_COPY_FILES += \
    device/htc/vision/proprietary/akmd:/system/bin/akmd \
    device/htc/vision/proprietary/bma150_usr:/system/bin/bma150_usr \
    device/htc/vision/proprietary/htc_ebdlogd:/system/bin/htc_ebdlogd \
    device/htc/vision/proprietary/logcat2:/system/bin/logcat2 \
    device/htc/vision/proprietary/rmt_storage:/system/bin/rmt_storage \
    device/htc/vision/proprietary/snd3254:/system/bin/snd3254 \
    device/htc/vision/proprietary/AudioBTID.csv:/system/etc/AudioBTID.csv \
    device/htc/vision/proprietary/eglsubAndroid.so:/system/lib/egl/eglsubAndroid.so \
    device/htc/vision/proprietary/libEGL_adreno200.so:/system/lib/egl/libEGL_adreno200.so \
    device/htc/vision/proprietary/libGLESv1_CM_adreno200.so:/system/lib/egl/libGLESv1_CM_adreno200.so \
    device/htc/vision/proprietary/libGLESv2_adreno200.so:/system/lib/egl/libGLESv2_adreno200.so \
    device/htc/vision/proprietary/libq3dtools_adreno200.so:/system/lib/egl/libq3dtools_adreno200.so \
    device/htc/vision/proprietary/libgsl.so:/system/lib/libgsl.so \
    device/htc/vision/proprietary/libsc-a2xx.so:/system/lib/libsc-a2xx.so \
    device/htc/vision/proprietary/libC2D2.so:/system/lib/libC2D2.so \
    device/htc/vision/proprietary/libOpenVG.so:/system/lib/libOpenVG.so \
    device/htc/vision/proprietary/libaudioalsa.so:/system/lib/libaudioalsa.so \
    device/htc/vision/proprietary/libgemini.so:/system/lib/libgemini.so \
    device/htc/vision/proprietary/libhtc_acoustic.so:/system/lib/libhtc_acoustic.so \
    device/htc/vision/proprietary/libhtc_ril.so:/system/lib/libhtc_ril.so \
    device/htc/vision/proprietary/libmmipl.so:/system/lib/libmmipl.so \
    device/htc/vision/proprietary/libmmjpeg.so:/system/lib/libmmjpeg.so

PRODUCT_BUILD_PROP_OVERRIDES += \
BUILD_FINGERPRINT="ro.build.fingerprint=htc_wwe/htc_vision/vision:2.3.3/GRI40/84109:user/release-keys" \
BUILD_TYPE="user" \

PRODUCT_NAME := htc_vision
PRODUCT_DEVICE := vision
PRODUCT_MODEL := HTC Desire Z
PRODUCT_MANUFACTURER := HTC
