#!/bin/bash

echo "Dosan's Minecraft Hosting Script!"

MC_VERSION="1.21.102.1"
MC_DIR="$HOME/mc-bedrock-server"
DOWNLOAD_URL="https://www.minecraft.net/bedrockdedicatedserver/bin-linux/bedrock-server-$MC_VERSION.zip"

# Create server directory
mkdir -p "$MC_DIR" # -p create automatically without raising an error
cd "$MC_DIR" || exit

if [ ! -f "bedrock-server-$MC_VERSION.zip" ]; then
    echo "Downloading Minecraft Bedrock server version $MC_VERSION..."
    wget "$DOWNLOAD_URL" -O "bedrock-server-$MC_VERSION.zip"
fi

echo "Extracting server..."
unzip -o "bedrock-server-$MC_VERSION.zip"

echo "eula=true" > eula.txt

chmod +x bedrock_server

if command -v screen >/dev/null 2>&1; then
    screen -dmS mc_server ./bedrock_server
    echo "Minecraft Bedrock server started in a screen session named 'mc_server'..."
else
    echo "Screen not found. Starting server in the foreground..."
    ./bedrock_server
fi
