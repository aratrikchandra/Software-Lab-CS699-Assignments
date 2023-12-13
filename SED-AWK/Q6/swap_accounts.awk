#!/usr/bin/awk -f

BEGIN{
	OFS=" "
}

{
	temp=$2
	$2=$3
	$3=temp
	print $0
	
}
