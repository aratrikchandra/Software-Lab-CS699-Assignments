#!/bin/bash

ifconfig | grep -A1 'ens33' | grep 'inet ' | awk '{print $2}'

# Write a SINGLE LINE bash command to get the IP address of your linux
# machine's eth0 interface.  The output should correspond to the
# relevant line in the output of the ifconfig command.
