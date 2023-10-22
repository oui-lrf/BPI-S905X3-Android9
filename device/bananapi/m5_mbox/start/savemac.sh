#!/system/bin/sh
sleep 20
# Get eth0 MAC address
MAC_ADDRESS=$(cat /sys/class/net/eth0/address)
FILE_PATH="/vendor/etc/mac_save"
echo "mac:"$MAC_ADDRESS
echo "svmac:"$(cat $FILE_PATH)
# Check if file exists
if [ ! -f "$FILE_PATH" ]; then
    # Remount /vendor as writable
    mount -o remount,rw /vendor

    # Write MAC address to file
    echo "$MAC_ADDRESS" > "$FILE_PATH"
    echo "mac write file!"
    # Remount /vendor as read-only
    mount -o remount,ro /vendor
else
    # Compare file MAC address with current MAC address
    SAVED_MAC=$(cat "$FILE_PATH")
    if [ "$SAVED_MAC" != "$MAC_ADDRESS" ]; then
        echo "mac addr error"
        sleep 30
        reboot
    else
        echo "mac check ok!"
    fi
fi
