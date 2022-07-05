#!/bin/bash
echo "Good luck, Luis Angel!"

echo "Starting Build It 👷‍♂️... "
docker-compose -f ~/Documents/gc/build-it/docker/docker-compose.yml --env-file ~/Documents/gc/build-it/.env up -d

echo "Opening VS Code 🧑‍💻..."
code ~/Documents/gc/build-it

