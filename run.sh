#!/bin/bash

echo "Starting Minecraft server..."

cd "$HOME/paper-mc" || exit
java -Xms1G -Xmx2G -jar paper.jar nogui