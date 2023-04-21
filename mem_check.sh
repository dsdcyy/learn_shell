#!/bin/bash

free_mem=$(free -m | awk 'NR==2{print $NF}')

if [[ $free_mem -lt "20000" ]]; then
  echo "Low memory waring,Memory free less than 20000M!r、Remaining: $free_mem Mb"
else
  echo "sufficient memory,remaining: $free_mem Mb"
fi
