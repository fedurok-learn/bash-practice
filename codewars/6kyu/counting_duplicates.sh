#!/bin/bash

# https://www.codewars.com/kata/54bf1c2cd5b56cc47f0007a1/train/shell

sorted=`tr [:upper:] [:lower:] <<< "$1" | fold -w1 | sort | tr -d '\n'`
unique=`tr -s '[:alnum:]' <<< $sorted`
cleaned=`sed 's/\([a-z]\)\1\+//g' <<< $sorted`

echo $(( ${#unique} - ${#cleaned} ))
