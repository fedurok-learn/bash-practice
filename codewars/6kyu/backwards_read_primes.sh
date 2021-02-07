#!/bin/sh -c

# https://www.codewars.com/kata/5539fecef69c483c5a000015/train/shell

isPrime() {
  factor $1 | grep -qE "^([0-9]+): \1$"
}

start=$1
end=$2

# cornercase
[ $1 = 1 ] && start=2

for num in $(seq $start $end); do
  if isPrime $num; then
    revnum=$(rev <<< $num | sed 's/^0*//')
    [ $revnum != $num ] && `isPrime $revnum` && echo $num
  fi
done | paste -sd' '

