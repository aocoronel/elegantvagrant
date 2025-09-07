CC = gcc
CFLAGS = -Wall -g -O2
DEBUG_CFLAGS = -Wall -g -O0
PROGRAMS = cpu-usage cpu-temp

all: debug

cpu-temp: cpu-temp.o
	$(CC) $(CFLAGS) -o cpu-temp cpu-temp.o

cpu-usage: cpu-usage.o
	$(CC) $(CFLAGS) -o cpu-usage cpu-usage.o

cpu-usage.o: cpu-usage.c
	$(CC) $(CFLAGS) -c cpu-usage.c

cpu-temp.o: cpu-temp.c
	$(CC) $(CFLAGS) -c cpu-temp.c

release: $(PROGRAMS)

debug: CFLAGS = $(DEBUG_CFLAGS)
debug: $(PROGRAMS)

clean:
	rm -f *.o $(PROGRAMS)
