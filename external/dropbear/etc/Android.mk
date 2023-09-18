LOCAL_PATH := $(call my-dir)

define addfile
$(eval include $(CLEAR_VARS))
$(eval LOCAL_MODULE_TAGS := optional)
$(eval LOCAL_SRC_FILES := $(1))
$(eval LOCAL_MODULE := dp-$(LOCAL_SRC_FILES))
$(eval LOCAL_MODULE_STEM := $(LOCAL_SRC_FILES))
$(eval LOCAL_MODULE_CLASS := ETC)
$(eval LOCAL_MODULE_PATH := $(TARGET_OUT_ETC))
$(eval LOCAL_MODULE_OWNER := root)
$(eval LOCAL_MODULE_GROUP := root)

$(info add file: $(LOCAL_MODULE_PATH) : $(LOCAL_MODULE_STEM)    $(LOCAL_PATH):$(LOCAL_SRC_FILES))

$(eval $(LOCAL_MODULE_PATH)/$(LOCAL_MODULE_STEM): $(LOCAL_PATH)/$(LOCAL_SRC_FILES); \
    cp $$< $$@; \
    @if [ -e $$@ ]; then \
        chmod 755 $$@; \
    fi \
)

$(eval include $(BUILD_PREBUILT))
endef

# $(eval $(call addfile,authorized_keys))
# $(eval $(call addfile,dropbear_dss_host_key))
# $(eval $(call addfile,dropbear_rsa_host_key))
# $(eval $(call addfile,dropbear.pid))
# $(eval $(call addfile,passwd))

# 获取源码目录的所有文件
ALL_SOURCE_FILES := $(wildcard $(LOCAL_PATH)/*)

# 排除 Android.mk 文件
SOURCE_FILES := $(filter-out $(LOCAL_PATH)/Android.mk, $(ALL_SOURCE_FILES))

# 对每个文件调用 addfile 函数
$(foreach file,$(SOURCE_FILES),$(eval $(call addfile,$(notdir $(file)))))


