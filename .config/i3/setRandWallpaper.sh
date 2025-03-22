#!/bin/bash

killall settimed
# Array of possible options
stuff=("aurora" "beach" "cliffs" "colony" "desert" "earth" "factory" "firewatch" "forest" "home" "island" "lake" "market" "moon" "mountains" "room" "street" "tokyo")

# Select a random item from the array
random_item=${stuff[RANDOM % ${#stuff[@]}]}

# Run the command with the selected item
settimed "$random_item"
