#!/bin/sh

# 获取当前脚本的目录
DIR="$(dirname "$(realpath "$0")")"

echo "start, find all sh files in $DIR to run"

for script in $(ls "$DIR"/*.sh); do
    if [ "$script" != "$0" ]; then  # 避免脚本自身被再次执行
        echo "Executing $script..."
        sh "$script" &
    fi
done
