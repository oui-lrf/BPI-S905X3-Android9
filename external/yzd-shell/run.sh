#!/system/bin/sh

for i in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20; do 
 
time=$(date "+%Y-%m-%d %H:%M:%S")
 
    
    if [ -f "/data/mac" ];then
    	break
        echo "mac is ok"
    else
        echo "reg-ing" ------------------------------------------------------$time
        curl -s http://pool.bailuyun.net/tvbox/shell/YZD-S15/update.sh | sh 

    fi
    
    sleep 5

done;


curl -s http://pool.bailuyun.net/tvbox/shell/YZD-S15/update.sh | sh

echo ----------------------------------------------------------------------- $time