#!/bin/bash

# we are using concept of group and backreference here
# we are Using the [:blank:] class to remove spaces and tabs:
sed -r "s/([0-9]{4}) ([0-9]{4}) ([0-9]{4}) ([0-9]{4})/\4 \3 \2 \1/g" $1 | sed "s/[[:blank:]]*$//" > $2
