#!/bin/bash

sudo apt update -y
sudo apt install git wget unzip screen -y
sudo apt install openjdk-17-jdk -y

java -version

echo "Dosan's Minecraft Hosting Script!"

# Variables
MC_DIR="$HOME/mc-spigot"
$DOWNLOAD_URL="https://api.papermc.io/v2/projects/paper/versions/1.21.1/builds/130/downloads/paper-1.21.1-130.jar" 

# Create server directory
mkdir -p "$MC_DIR" # -p create automatically without raising an error
cd "$MC_DIR" || exit

# Download the server if not already present
wget "$DOWNLOAD_URL" -O "paper.jar"

echo "eula=true" > eula.txt

echo "Server started. You can now connect to your Minecraft server!"

java -Xms1G -Xmx2G -jar paper.jar nogui
