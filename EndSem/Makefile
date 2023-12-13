all: csv2html

csv2html: csv2html.c
	gcc -o csv2html csv2html.c -ll

csv2html.c: csv2html.l
	flex -t csv2html.l > csv2html.c

clean:
	rm -f csv2html csv2html.c
