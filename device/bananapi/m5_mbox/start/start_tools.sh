#!/bin/sh

echo "start telnet!!"
busybox telnetd -l /system/bin/secure_shell

sleep 10
echo "stop adbd!!"
stop adbd
