#!/bin/bash

sudo apt update -y
sudo apt install git wget unzip screen -y
sudo apt install openjdk-17-jdk -y

java -version

echo "Dosan's Minecraft Hosting Script!"

# Variables
MC_DIR="$HOME/mc-spigot"
DOWNLOAD_URL="https://hub.spigotmc.org/jenkins/job/BuildTools/195/artifact/target/BuildTools.jar"

# Create server directory
mkdir -p "$MC_DIR" # -p create automatically without raising an error
cd "$MC_DIR" || exit

# Download the server if not already present
wget "$DOWNLOAD_URL" -O "bedrock-server-$MC_VERSION.zip"

java -jar BuildTools.jar --rev 1.20.1

# Accept EULA
echo "eula=true" > eula.txt

java -Xms1G -Xmx2G -jar spigot-1.20.1.jar nogui
echo "Server started. You can now connect to your Minecraft server!"