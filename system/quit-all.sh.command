# Get a list of all open applications
applications=$(osascript -e 'tell app "Finder" to get the name of every process whose visible is true')

# Loop through the list of applications and close each one
for app in $applications; do
  osascript -e "tell application \"$app\" to quit"
done