#/bin/bash

# This program should compile texample.tex, 
# a file in the ./samleTex.  And it should tar-gzip the entire
# current directory (from the current directory) to a tgz file called
# tex2pdf.tar.tgz 


#!/bin/bash

latex sampleTex/texample.tex
dvipdfm texample.dvi
tar -czvf tex2pdf.tar.gz .
