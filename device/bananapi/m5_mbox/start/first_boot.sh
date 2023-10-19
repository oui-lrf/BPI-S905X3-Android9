#!/bin/sh

FLAG_FILE="/data/system/timezone_set"

# 检查是否是首次启动
if [ ! -f "$FLAG_FILE" ]; then
    echo "first boot"
    # 设置时区为 Asia/Shanghai
    setprop persist.sys.timezone Asia/Shanghai
    date +%Z # 打印当前时区（可选，只是为了验证）

    # 创建一个文件作为标记，表示已经设置过时区
    touch $FLAG_FILE
else
    echo "not first boot"
fi


