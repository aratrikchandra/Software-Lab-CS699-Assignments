#/bin/bash


# This program should compile texample.tex  a file in the ./samleTex. Put all output files in the folder sampleTex, 
# And it should tar-gzip the sampleTex directory to a tgz file called  tex2pdf-a.tar.tgz 

#!/bin/bash

cd sampleTex
latex texample.tex
dvipdfm texample.dvi
cd ..
tar -czvf tex2pdf-a.tar.gz sampleTex