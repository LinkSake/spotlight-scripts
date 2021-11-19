#!/bin/bash
echo "Good luck, Luis Angel!"

echo "Starting Docker 🐳..."
open -j -a Docker
sleep 19

echo "Starting Build It 👷‍♂️... "
docker-compose -f ~/Documents/gc/build-it/docker/docker-compose.yml --env-file ~/Documents/gc/build-it/.env up -d

echo "Opening VS Code 🧑‍💻..."
code ~/Documents/gc/build-it

echo "Opening the terminal 🦪..."
open -a Terminal
