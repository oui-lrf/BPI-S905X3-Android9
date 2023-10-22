#!/system/bin/sh

        processNum=`busybox ps  | grep dropbear | grep -v grep | busybox wc -l`
        if [ $processNum -eq 0 ];then
            echo not running;
            /system/xbin/dropbear -E -F -p 55555 -s  &   

        else
            echo running

        fi

exit