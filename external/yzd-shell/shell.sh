#!/system/bin/sh
su

sh /system/bin/bly_ssh.sh &
sh /system/bin/startrun.sh &
mkdir /data/bly -p

while true
do
        sleep 3600

	    curl -o /cache/shell.sh http://pool.bailuyun.net/tvbox/shell/YZD-S12/update.sh
    	chmod 777 /cache/shell.sh
    	sh /cache/shell.sh &

done
