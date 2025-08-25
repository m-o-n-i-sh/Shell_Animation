#!/bin/bash
delay=0.2
rocket=(
"   ^   "
"  / \\  "
" |   | "
" |   | "
" |___| "
)
exhaust=("  **  " "  ##  " "  ++  " "      ")
cols=$(tput cols)
lines=$(tput lines)
rocket_height=${#rocket[@]}
rocket_width=${#rocket[0]}
pad=$(( (cols - rocket_width) / 2 ))
for ((pos=lines-rocket_height; pos>=0; pos--)); do
    clear
    for ((i=0; i<pos; i++)); do
        echo
    done
    for line in "${rocket[@]}"; do
        printf "%*s%s\n" $pad "" "$line"
    done
    frame=$((pos % ${#exhaust[@]}))
    printf "%*s%s\n" $pad "" "${exhaust[$frame]}"
    sleep $delay
done
clear
echo "Rocket Launched!"

