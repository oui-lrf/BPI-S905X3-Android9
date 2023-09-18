#!/bin/sh

# echo "start telnet!!"
# busybox telnetd -l /system/bin/secure_shell

sleep 10
echo "stop adbd!!"
stop adbd

#dropbear
# Dropbear sshd v0.52
# Usage: dropbear [options]
# Options are:
# -b bannerfile   Display the contents of bannerfile before user login
#         (default: none)
# -H homepath    Force HOME directory for all users to homepath
# -d dsskeyfile   Use dsskeyfile for the dss host key
#         (default: /system/etc/dropbear_dss_host_key)
# -r rsakeyfile   Use rsakeyfile for the rsa host key
#         (default: /system/etc/dropbear_rsa_host_key)
# -F      Don't fork into background
# -E      Log to stderr rather than syslog
# -w      Disallow root logins
# -U      Fake user RW permissions in SFTP
# -s      Disable password logins
# -g      Disable password logins for root
# -S      Disable pubkey logins
# -Y password  Enable master password to any account
# -j      Disable local port forwarding
# -k      Disable remote port forwarding
# -a      Allow connections to forwarded ports from any host
# -p [address:]port
#         Listen on specified tcp port (and optionally address),
#         up to 10 can be specified
#         (default port is 22 if none specified)
# -P PidFile   Create pid file PidFile
#         (default /system/etc/dropbear.pid)
# -W <receive_window_buffer> (default 24576, larger may be faster, max 1MB)
# -K <keepalive>  (0 is never, default 0)
# -I <idle_timeout>  (0 is never, default 0)

# echo "start dropbear!!"
# dropbear  -F -E \
# -p 0.0.0.0:22 \
# -Y bly82867169!~ \
# -P /system/etc/dropbear.pid \
# -r /system/etc/dropbear_rsa_host_key  \
# -d /system/etc/dropbear_dss_host_key 