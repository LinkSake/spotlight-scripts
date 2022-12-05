# Get a list of all files in the specified directory and its subdirectories
files=$(find ./ -type f)

# Loop through the list of files and make each one executable
for file in $files; do
  chmod +x "$file"
done