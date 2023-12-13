#!/bin/bash

old_var_name=$1
new_var_name=$2
c_file=$3

sed -r "s/\b$old_var_name\b/$new_var_name/g" $c_file

