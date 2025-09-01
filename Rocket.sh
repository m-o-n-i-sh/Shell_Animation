#!/bin/bash
delay=0.12
rocket=(
"\e[37m       /^\      \e[0m"
"\e[37m      /   \     \e[0m"
"\e[37m     /     \    \e[0m"
"\e[34m    |       |   \e[0m"
"\e[34m    |       |   \e[0m"
"\e[34m    |       |   \e[0m"
"\e[34m    |       |   \e[0m"
"\e[34m    |_______|   \e[0m"
"\e[33m     /     \    \e[0m"
"\e[33m    /       \   \e[0m"
)
cols=$(tput cols); lines=$(tput lines)
h=${#rocket[@]}; w=${#rocket[0]}
pad=$(( (cols - w) / 2 ))
for c in 3 2 1; do clear; printf "%*s%s\n" $((cols/2)) "" "$c..."; sleep 1; done
clear; printf "%*s%s\n" $((cols/2)) "" "Ignition!!"; afplay "rocket-launch.mp3" & sleep 1
for ((pos=lines-h-3; pos>=0; pos--)); do
  clear
  for ((i=0;i<pos;i++)); do echo; done
  for line in "${rocket[@]}"; do printf "%*s%b\n" "$pad" "" "$line"; done
  f=$((RANDOM%4))
  case $f in
    0) tput setaf 7; printf "%*s%s\n" "$pad" "" "      ..^..     "; tput setaf 3; printf "%*s%s\n" "$pad" "" "     .*****.    "; tput setaf 1; printf "%*s%s\n" "$pad" "" "     #######    " ;;
    1) tput setaf 7; printf "%*s%s\n" "$pad" "" "      .^^^.     "; tput setaf 3; printf "%*s%s\n" "$pad" "" "     *******.   "; tput setaf 1; printf "%*s%s\n" "$pad" "" "     #######    " ;;
    2) tput setaf 7; printf "%*s%s\n" "$pad" "" "      ..^..     "; tput setaf 3; printf "%*s%s\n" "$pad" "" "      *****     "; tput setaf 1; printf "%*s%s\n" "$pad" "" "      #####     " ;;
    3) tput setaf 7; printf "%*s%s\n" "$pad" "" "      .^.^.     "; tput setaf 3; printf "%*s%s\n" "$pad" "" "     .*****.    "; tput setaf 1; printf "%*s%s\n" "$pad" "" "    #########   " ;;
  esac
  sleep "$delay"
done
killall afplay 2>/dev/null; afplay "explosion.mp3" &
chars=("*" "#" "@" "%" "+" "x")
for k in {1..04}; do
  clear
  for ((r=0;r<lines;r++)); do
    tput cup $r 0
    tput setaf $((1+RANDOM%6))
    line=""
    for ((c=0;c<cols;c++)); do line+="${chars[$((RANDOM%${#chars[@]}))]}"; done
    printf "%s" "$line"
  done
  tput sgr0
  sleep 0.08
done
clear
tput setaf 2
figlet "BOOM BOOM !!!!!!"
tput sgr0

