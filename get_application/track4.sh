#!/bin/bash
cd "$(dirname "$0")"
echo "Running Shortcat"
while :
  do
  # Get the window ID of the focused window
  window_id=$(xdotool getwindowfocus)
  echo "Focused window ID: $window_id"

  # Get the window title using the window ID
  window_name=$(xdotool getwindowname "$window_id")
  echo "Window name (title): $window_name"

  # Get the process ID (PID) of the application owning the focused window
  pid=$(xdotool getwindowpid "$window_id")
  echo "Process ID (PID) of window: $pid"

  # Get the name of the application (executable) using the PID
  app_name=$(ps -p "$pid" -o comm=)
  echo "Application name: $app_name"

  # If NO app_name is found, try using wmctrl as a fallback
  if [[ -z "$app_name" ]]; then
    echo "No application name found using ps, trying wmctrl..."
    app_name=$(wmctrl -lp | grep "$window_id" | awk '{print $3}')
    echo "Application name from wmctrl: $app_name"
  fi

  # Write the window name and application name to the file
  echo "Writing to name.js: name=\"$window_name\"; app=\"$app_name\""
  echo "name=\"$window_name $app_name\";" > name.js

  # Sleep for 1 second before repeating the loop
  sleep 1
done

