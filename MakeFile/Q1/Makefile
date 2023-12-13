all: programEntry

programEntry: multiplication.o addition.o programEntry.o
	gcc -o programEntry multiplication.o addition.o programEntry.o

multiplication.o: multiplication.c
	gcc -c multiplication.c

addition.o: addition.c
	gcc -c addition.c

programEntry.o: programEntry.c
	gcc -c programEntry.c

clean:
	rm *.o programEntry
