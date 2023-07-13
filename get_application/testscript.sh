#!/bin/bash
cd "$(dirname "$0")"
echo "Running Shortcat"
while :
  do
  name=$(xdotool getwindowfocus getwindowname) 
  echo "name=\"$name\";" > name.js
	sleep 1
done
