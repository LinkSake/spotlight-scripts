#!/bin/bash
echo "Good morning, Luis Angel!"

echo "Here is the weather for today on $(curl -s "wttr.in/?format=3")"

echo "Updating Brew 🍺..."
brew update && brew upgrade
echo "Done!"

echo "Updating tldr 📄..."
tldr --update
echo "Done!"

echo "Getting your mail ✉️..."
open -j -a Mail
echo "Getting your news 🌎..."
open -j -a NetNewsWire
echo "Getting your messages 💬..."
open -j -a WhatsApp
open -j -a Telegram
open -j -a Slack
echo "Opening utilities 🛠"
open -j -a Bike
open -j -a Linear
open -j -a Brave\ Browser

echo "All done!"
echo "Enjoy your morning ☀️"
