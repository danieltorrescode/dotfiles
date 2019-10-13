#!/bin/bash
for((i=16; i<256; i++)); do
    printf "\e[48;5;${i}m%03d" $i;
    printf '\e[0m';
    [ ! $((($i - 15) % 6)) -eq 0 ] && printf ' ' || printf '\n'
done

# check Xterm code list 
# convert hexadeciaml to  ANSI color code
# search for web cheatsheet to check convertion