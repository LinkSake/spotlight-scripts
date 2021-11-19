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
echo "Logging into the office 🧑‍💻..."
open -j -a Brave\ Browser --args --new-window "https://mail.google.com/chat/u/1/" 

echo "All done!"
echo "Enjoy your morning ☀️"
