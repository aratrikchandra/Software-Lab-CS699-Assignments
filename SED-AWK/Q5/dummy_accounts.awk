#!/usr/bin/awk -f

BEGIN{
	FS=" "
	maxID=0
}

NR > 1{
	
	if($4 == "/bin/false")
	{
		print $1
		
		if($1 > maxID){
		 maxID=$1
		}
	}
	}

END{
	print maxID
}


