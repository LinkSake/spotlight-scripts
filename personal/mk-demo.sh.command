#!/bin/bash

# get a list of all .mov files on the desktop
mov_files=$(ls ~/Desktop/*.mov)

# initialize a counter to keep track of the number in the sequence
counter=1

# loop through all the .mov files
for file in $mov_files
do
  # convert the file to .mp4 using ffmpeg
  ffmpeg -i "$file" "~/Desktop/demo$counter.mp4"
  # ffmpeg -i "$file" -c:v copy -c:a copy ./demo.mp4

  # delete the original .mov file
  rm "$file"

  # increment the counter
  counter=$((counter+1))
done