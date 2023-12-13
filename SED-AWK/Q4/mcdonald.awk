#!/usr/bin/awk -f

BEGIN {
    FS=":"
}

{
    animal = $1
    sound = $2

    print "Old McDonald had a farm ei-ei-o"
    print "On that farm he had a " animal " ei-ei-o"
    print "With a " sound "-" sound " here, " sound "-" sound " there"
    print "Here a " sound " there a " sound ", everywhere " sound "-" sound
    print ""
}

END {
    print "Old McDonald had a farm ei-ei-o"
}

