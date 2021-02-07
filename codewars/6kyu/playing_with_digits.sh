#!/bin/sh -c

# https://www.codewars.com/kata/5552101f47fc5178b1000050/train/shell

find_sum() {
  sum=0
  p=$2
  
  for digit in $(echo $1 | sed -e 's/\(.\)/\1\n/g'); do
    let sum+=digit**p++
  done
  
  echo $sum
}

dig_pow () {
  sum=$(find_sum $1 $2)
  [ "$(( $sum % $1 ))" -eq 0 ] && echo $(( $sum / $1 )) || echo "-1"
}

dig_pow $1 $2
