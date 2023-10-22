#!/system/bin/sh
sleep 7
while true
do
nohup sh /system/bin/run.sh > /cache/run.log 2>&1 &

 sleep 600
done
