#!/bin/bash

# https://www.codewars.com/kata/56b5afb4ed1f6d5fb0000991/train/shell

rot () { cat |  sed 's/\(.\)\(.*\)/\2\1/g'; }
cubesum () { cat | sed 's/\(.\)/\1^3+/g' | sed 's/.$//' | bc; }

str=$1
sz=$2

[ "$sz" -le 0 ] || [ "$sz" -gt ${#str} ] || [ -z "$str" ] && exit

chunks=`fold -w $sz <<< $str | \
  ( [ $((${#str} % $sz)) != 0 ] && head -n -1 || cat )` 

for chunk in $chunks; do
  ( [ $(( `cubesum <<< $chunk` % 2 )) = 0 ] && rev || rot ) <<< $chunk
done | tr -d '\n'
