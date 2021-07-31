#!/bin/bash

# stop all instance of this script if "killall" provided as first argument
if [ "$1" == "killall" ]; then
  scriptname=$(basename "$0")
  pattern="[0-9]* /bin/bash .*$scriptname$"
  pids=$(ps ax -o pid,cmd | grep -P "$pattern" | sed 's/^ *//;s/ *$//' | grep -Pv ' grep|killall$' | cut -d" " -f1)
  if [ "$pids" != "" ]; then
    kill -TERM $pids
    echo "$(echo '$pids' | wc -l) instances stopped"
  else
    echo "None found to stop"
  fi
  exit 0
fi

# get id of the window via prompt or active window
id=$(printf %i $(xprop -root _NET_ACTIVE_WINDOW | grep -P -o "0x\w+"))

# echo -en "\nClick the window you want to set its title "
# id=$(printf %i $(xwininfo | grep 'Window id' | cut -d" " -f4))


# fail if no window id
if [ "$id" == "" ]; then
  echo 'Error: Window id not found'
  exit 1
else
  echo "- Got it $id"
fi

# ask for title
read -e -p "Enter target title: " title

# fail if no title
if [ "$title" == "" ]; then
  echo "Error: No title to set"
  exit 1
fi


# infinite loop
bash kde/rename-window-worker.sh $id "$title" &


# done
echo "Sticky title set"
exit 0
