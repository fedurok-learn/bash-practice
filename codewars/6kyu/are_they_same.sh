#!/bin/bash

# https://www.codewars.com/kata/550498447451fbbd7600041c/train/shell
# parameters are strings; return "true" or "false" (see Sample Tests)

sort_spaced() {
  for var in "$@"
  do
    echo "$var"
  done | sort -rn | paste -sd ' '
}

square() {
  for val in $1
  do
    echo $((val ** 2))
  done | paste -sd ' '
}

comp() {
  asorted=$(sort_spaced "$1")
  asquared=$(square "$asorted")
  bsorted=$(sort_spaced "$2")

  [ "$asquared" = "$bsorted" ] && echo true || echo false
}

comp "$1" "$2"
