CC=gcc
CFLAGS=-I.

%.o: %.c
	@$(CC) -c -o $@ $< $(CFLAGS)

programEntry: $(patsubst %.c,%.o,$(wildcard *.c))
	@$(CC) -o $@ $^
.PHONY:clean
clean:
	@rm -f *.o programEntry
