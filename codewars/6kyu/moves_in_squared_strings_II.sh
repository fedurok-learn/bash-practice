#!/bin/bash

# https://www.codewars.com/kata/56dbe7f113c2f63570000b86/train/shell

rot() { tr -s ',' '\n' <<< "$1" | tac | rev; }

selfieAndRot() { 
  dots=$(sed 's/././g' <<< ${1##*,})
  
  printf "$1", | sed "s/\([,^]*\),/\1$dots\n/g"
  rot "$1" | sed "s/\(.*\)\$/$dots\1/g"
}

$1 "$2" | tr -s '\n' '\r'
