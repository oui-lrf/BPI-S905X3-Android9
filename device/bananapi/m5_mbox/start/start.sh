#!/bin/sh

# 获取当前脚本的完整路径
CURRENT_SCRIPT="$(realpath "$0")"

# 获取当前脚本的目录
DIR="$(dirname "$CURRENT_SCRIPT")"
echo "CURRENT_SCRIPT:"$CURRENT_SCRIPT
echo "DIR:"$DIR
echo "start, find all sh"

for script in $(ls "$DIR"/*.sh); do
    echo "find script:"$script
    if [ "$(realpath "$script")" != "$CURRENT_SCRIPT" ]; then  # 避免脚本自身被再次执行
        echo "Executing $script..."
        sh "$script" &
    fi
done

