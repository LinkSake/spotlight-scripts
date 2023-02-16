#!/bin/bash

# initialize a counter to keep track of the number in the sequence
counter=1

# loop through all the .mov files
for file in ~/Desktop/*.mov
do
  # convert the file to .mp4 using ffmpeg
  ffmpeg -i "$file" -c:v copy -c:a copy ~/Desktop/"demo$counter.mp4"

  # delete the original .mov file
  rm "$file"

  # increment the counter
  counter=$((counter+1))
done