CC = gcc
CFLAGS = -Wall -g -O2
PROGRAMS = cpu-usage cpu-temp

all: release

cpu-temp: cpu-temp.o
	$(CC) $(CFLAGS) -o cpu-temp cpu-temp.o

cpu-usage: cpu-usage.o
	$(CC) $(CFLAGS) -o cpu-usage cpu-usage.o

cpu-usage.o: cpu-usage.c
	$(CC) $(CFLAGS) -c cpu-usage.c

cpu-temp.o: cpu-temp.c
	$(CC) $(CFLAGS) -c cpu-temp.c

release: $(PROGRAMS)

clean:
	rm -f *.o $(PROGRAMS)
