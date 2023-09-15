#!/bin/bash

# 获取脚本的绝对路径
SCRIPT_PATH=$(realpath $0)
SCRIPT_DIR=$(dirname $SCRIPT_PATH)

SRC_DIR="$SCRIPT_DIR/srcapk"
DEST_DIR="$SCRIPT_DIR/apk"

echo "SRC_DIR:"$SRC_DIR

rm  $DEST_DIR *.apk
# 创建目标目录如果它不存在
mkdir -p "$DEST_DIR"

for src_file in $SRC_DIR/*.apk; do
    echo "file:"$src_file
    # 使用aapt获取包名
    pkg_name=$(aapt dump badging "$src_file" | awk -v FS="'" '/package: name=/{print $2}')
    if [ -z "$pkg_name" ]; then
        echo "Failed to get package name for $src_file"
        continue
    fi
    
    # 构造新的文件名
    dest_file="$DEST_DIR/$pkg_name.apk"

    # 移动重命名的文件到目标目录
    cp "$src_file" "$dest_file"
    echo "Copy $src_file -> $dest_file"
done
