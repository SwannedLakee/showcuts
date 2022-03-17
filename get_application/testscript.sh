#!/bin/bash
cd "$(dirname "$0")"
while :
  do
  name=$(osascript GetNameAndTitleOfActiveWindow.scpt) 
  echo "name=\"$name\";" > name.js
	sleep 1
done
