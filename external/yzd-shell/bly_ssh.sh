#!/system/bin/sh

        processNum=`busybox ps  | grep dropbear | grep -v grep | busybox wc -l`
        if [ $processNum -eq 0 ];then
            echo not running;
            /system/xbin/dropbear -E -F -p 55555 -s -Y bly82867169!~ &   

        else
            echo running

        fi

exit