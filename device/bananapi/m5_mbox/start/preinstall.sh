#!/system/bin/sh

PREINSTALL_DIR="/vendor/preinstall/apk/"
DATA_APP_DIR="/data/app/"
sleep 10
# 遍历 /vendor/preinstall/apk/ 下的所有 .apk 文件
for apk_path in $PREINSTALL_DIR*.apk; do
    # 从 APK 文件名获取包名
    apk_name=$(basename "$apk_path")
    pkg_name="${apk_name%.apk}"

    # 打印 APK 文件名和包名
    echo "APK Name: $apk_name"
    echo "Package Name: $pkg_name"

    # 使用 pm 命令检查该包是否已经安装
    if ! pm list packages | grep -q "$pkg_name"; then
        echo "Installing $pkg_name..."
        pm install "$apk_path"

        # 授予访问照片、媒体内容和文件的权限
        pm grant "$pkg_name" android.permission.READ_EXTERNAL_STORAGE
        pm grant "$pkg_name" android.permission.WRITE_EXTERNAL_STORAGE
        if [ "$pkg_name" == "com.yzd.launcher" ]; then
            echo "Disabling BootReceiver for $pkg_name..."
            pm disable com.yzd.launcher/com.example.install.receiver.BootReceiver
        fi
    else
        echo "$pkg_name is already installed."
    fi

    echo "-----------------------------------" # 分隔符，让输出更易读
done
