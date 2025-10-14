CC = gcc
CFLAGS = -Wall -g -O2
PROGRAMS = cpu-usage cpu-temp pomo

all: release

pomo: pomo.o
	$(CC) $(CFLAGS) -o pomo.out pomo.o

cpu-temp: cpu-temp.o
	$(CC) $(CFLAGS) -o cpu-temp.out cpu-temp.o

cpu-usage: cpu-usage.o
	$(CC) $(CFLAGS) -o cpu-usage.out cpu-usage.o

pomo.o:
	$(CC) $(CFLAGS) -c pomo.c

cpu-usage.o: cpu-usage.c
	$(CC) $(CFLAGS) -c cpu-usage.c

cpu-temp.o: cpu-temp.c
	$(CC) $(CFLAGS) -c cpu-temp.c

release: $(PROGRAMS)

clean:
	rm -f *.o $(PROGRAMS)
