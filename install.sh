#!/bin/bash

sudo apt update -y
sudo apt install git wget unzip screen -y
sudo apt install openjdk-17-jdk -y

java -version

echo "Dosan's Minecraft Hosting Script!"

# Variables
MC_DIR="$HOME/paper-mc"
$DOWNLOAD_URL="https://fill-data.papermc.io/v1/objects/8de7c52c3b02403503d16fac58003f1efef7dd7a0256786843927fa92ee57f1e/paper-1.21.8-60.jar" 

# Create server directory
mkdir -p "$MC_DIR" # -p create automatically without raising an error
cd "$MC_DIR" || exit

# Download the server if not already present
wget "$DOWNLOAD_URL" -O "paper.jar"

echo "eula=true" > eula.txt

echo "Server started. You can now connect to your Minecraft server!"

java -Xms1G -Xmx2G -jar paper.jar nogui
