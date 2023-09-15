#!/system/bin/sh

REQUEST_FILE="/data/local/tmp/request.txt"
RESPONSE_FILE="/data/local/tmp/response.txt"
IP_FILE="/storage/emulated/0/mqtt/ip"
DIR_PATH="$(dirname "$IP_FILE")"  # 

# Function to send a request to the server
send_request() {
	
    echo "get wan status" > "$REQUEST_FILE"
}

# Function to parse the server's response
parse_response() {
    if [ -s "$RESPONSE_FILE" ]; then
        line=$(cat "$RESPONSE_FILE")
        echo "Received: $line"
        
        proto=$(echo "$line" | busybox awk -F"proto:" '{print $2}' | busybox awk '{print $1}')
        ip=$(echo "$line" | busybox awk -F"ip:" '{print $2}' | busybox awk '{print $1}')
        
        echo "Parsed Data - Proto: $proto, IP: $ip"
        
        if [ "$proto" = "dhcp" ] && echo "$ip" | busybox grep -Eq '^([0-9]{1,3}\.){3}[0-9]{1,3}$'; then
        	echo "send cmd:set wan static"
            echo "set wan static" | busybox nc 192.168.5.1 60000
        fi

        if [ "$proto" = "static" ] && echo "$ip" | busybox grep -Eq '^([0-9]{1,3}\.){3}[0-9]{1,3}$'; then
            echo "Proto is static with a valid IP. Writing IP to file."
            if [ -f "$IP_FILE" ]; then
              echo "$ip" > "$IP_FILE"
            else
              echo "$IP_FILE not exist, Do not Writing"
            fi
            exit 0
        fi

        # Clean the response file
        > "$RESPONSE_FILE"
    fi
}

# Ensure the files exist and are empty initially
> "$REQUEST_FILE"
> "$RESPONSE_FILE"

# Main loop
while true; do
    
    if [ -f "$IP_FILE" ]; then   # 
        send_request

        # Connect with server and redirect output accordingly
        busybox nc 192.168.5.1 60000 < "$REQUEST_FILE" > "$RESPONSE_FILE"

        # Parse the response if it exists
        parse_response
    fi

    # Wait for 2 seconds before the next iteration
    sleep 30
done
