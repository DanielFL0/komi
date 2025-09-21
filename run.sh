#!/bin/bash

# Launch server in a detached screen session
if command -v screen >/dev/null 2>&1; then
    screen -dmS mc_server /opt/glibc-2.35/lib/ld-2.35.so --library-path /opt/glibc-2.35/lib ./bedrock_server
    echo "Minecraft Bedrock server started in a screen session named 'mc_server'..."
else
    echo "Screen not found. Starting server in the foreground..."
    /opt/glibc-2.35/lib/ld-2.35.so --library-path /opt/glibc-2.35/lib ./bedrock_server
fi