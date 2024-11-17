#!/bin/bash

DEVICE_LIST=$(jq -r '.settings.device_list' /home/fpp/media/plugins/MultiDeviceTest/plugin.json)

IFS=',' read -ra DEVICES <<< "$DEVICE_LIST"

for DEVICE in "${DEVICES[@]}"; do
    curl -X POST "http://$DEVICE/api/test/stop"
done
