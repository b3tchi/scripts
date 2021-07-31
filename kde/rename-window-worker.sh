
# define loop as a function, so we can run it in background
# windowByIdSetStickyTitle() {
local id title curr_title
id="$1"
title="$2"

while true; do
  # get current title
  curr_title="$(xdotool getwindowname $id 2>/dev/null)"

  # exit if we can't find window anymore
  if [ $? -ne 0 ]; then
    echo "Window id does not exist anymore"
    break
  fi

  # update title if changed
  if [ "$curr_title" != "$title" ]; then
    xdotool set_window --name "$title" $id
  fi

  # needed else you will eat up a significant amount of cpu
  sleep 3
done
# }
