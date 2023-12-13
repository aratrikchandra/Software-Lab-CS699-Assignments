#/bin/bash

# This program should compile texample.tex  a file in the ./samleTex. Put all output files in the folder sampleTex, 
# And it should tar-gzip the sampleTex directory to a tgz file called tex2pdf-b.tar.tgz 
# Check if the command worked or not. If worked correctly print "success" else print "fail"

#!/bin/bash

cd sampleTex
latex texample.tex
if [ $? -eq 0 ]; then
    echo "success"
    dvipdfm texample.dvi
    cd ..
    tar -czf tex2pdf-b.tar.gz sampleTex
else
    echo "fail"
fi