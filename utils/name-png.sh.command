#!/bin/bash

# initialize a counter to keep track of the number in the sequence
counter=1

# loop through all the .png files
for file in ~/Desktop/*.png
do
  # rename all the files to demo-counter.png
  mv "$file" ~/Desktop/"demo$counter.png"

  # increment the counter
  counter=$((counter+1))
done