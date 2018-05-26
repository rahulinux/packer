#!/bin/bash

for swappart in $(grep partition /proc/swaps | awk -F ' ' '{print $1}')
do
  sudo swapoff $swappart
  sudo dd if=/dev/zero of=$swappart
  sudo mkswap -f $swappart
  sudo swapon $swappart
done

sudo rm -f /EMPTY
