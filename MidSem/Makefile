# For each of the 3 files marksX.csv (X=1,2,3), we want to generate
# marksX.top3neg as the output of running the script top3-neg.sh .
# Capture this dependence in a Makefile. The Makefile should capture
# the dependence across the relevant scripts as well as the
# input/output files.

# The default target of the Makefile should be the 3 output files
# marksX.top3neg (X=1,2,3)

all: marks1.top3neg marks2.top3neg marks3.top3neg

marks1.top3neg: marks1.csv top3-neg.sh marks-count.awk
	bash top3-neg.sh marks1.csv > marks1.top3neg

marks2.top3neg: marks2.csv top3-neg.sh marks-count.awk
	bash top3-neg.sh marks2.csv > marks2.top3neg

marks3.top3neg: marks3.csv top3-neg.sh marks-count.awk
	bash top3-neg.sh marks3.csv > marks3.top3neg

