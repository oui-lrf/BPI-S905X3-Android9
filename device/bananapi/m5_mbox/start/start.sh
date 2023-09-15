#!/bin/sh

echo "start,find all sh file to run"
for script in $(ls ./*.sh); do
    if [ "$script" != "$0" ]; then  # 避免脚本自身被再次执行
        echo "Executing $script..."
        sh $script &
    fi
done


