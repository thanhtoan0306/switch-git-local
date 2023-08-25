#!/bin/bash

webhook_url="https://hooks.slack.com/services/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"
channel="thanhtoan"  # Replace with your desired channel name

send_slack_notification() {
    current_hour=$(date +"%H")
    current_minute=$(date +"%M")
    current_second=$(date +"%S")
    message="It's $current_hour:$current_minute:$current_second. This is a scheduled notification!"

    curl -X POST -H 'Content-type: application/json' --data \
        "{\"channel\":\"$channel\",\"text\":\"$message\"}" "$webhook_url"
}

while true; do
    send_slack_notification
    sleep 30
done