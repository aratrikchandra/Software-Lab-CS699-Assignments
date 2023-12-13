#!/bin/bash

# Assume this is given exactly ONE command-line argument
# Your code should be EXACTLY one line
# Your code should work even if the filename has one or more space in it

head -1 "$1" | awk -F, '{print NF}'
