#!/bin/bash
echo "Thank you for your work, Luis Angel!"

echo "Stoping and removing Docker containers 🚢... "
docker-compose -f ~/Documents/gc/build-it/docker/docker-compose.yml --env-file ~/Documents/gc/build-it/.env down
sleep 19

echo "Quitting Docker 🐳..."
osascript -e 'quit app "Docker"'
sleep 19

echo "Quitting VS Code 🧑‍💻..."
osascript -e 'quit app "Visual Studio Code"'

echo "Quitting the terminal 🦪..."
osascript -e 'quit app Terminal"'

echo "Quitting Mail ✉️..."
osascript -e 'quit app "Mail"'
