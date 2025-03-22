#!/usr/bin/env bash

dir="$HOME/.config/polybar"
themes=($(ls --hide="launch.sh" $dir))

launch_bar() {
    # Terminate already running bar instances
    killall -q polybar

    # Wait until the processes have been shut down
    while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

    polybar -q main -c "$dir/$style/config.ini" &    
}

if [[ "$1" == "--forest" ]]; then
    style="forest"
    launch_bar

else
    cat <<EOF
Usage : launch.sh --theme
    
Available Themes :
--forest
EOF
fi
