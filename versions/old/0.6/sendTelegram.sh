#!/bin/sh

TOKEN="your_token"
CHAT_ID="your_chat_id"
MESSAGE="$1"

/usr/local/bin/curl -s -X POST https://api.telegram.org/bot$TOKEN/sendMessage -d chat_id=$CHAT_ID -d text="$MESSAGE"