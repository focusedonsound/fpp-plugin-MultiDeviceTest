#!/bin/bash

# Variables
DEVICE_LIST=$(jq -r '.settings.device_list' /home/fpp/media/plugins/MultiDeviceTest/plugin.json)
DEFAULT_EFFECT=$(jq -r '.settings.default_effect' /home/fpp/media/plugins/MultiDeviceTest/plugin.json)
DEFAULT_BRIGHTNESS=$(jq -r '.settings.default_brightness' /home/fpp/media/plugins/MultiDeviceTest/plugin.json)

# Convert the device list to an array
IFS=',' read -ra DEVICES <<< "$DEVICE_LIST"

# Loop through each device and send the test effect
for DEVICE in "${DEVICES[@]}"; do
    curl -X POST "http://$DEVICE/api/test/start" \
    -H "Content-Type: application/json" \
    -d "{\"effect\": \"$DEFAULT_EFFECT\", \"brightness\": $DEFAULT_BRIGHTNESS}"
done
