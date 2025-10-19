CC = gcc
CFLAGS = -Wall -g -O2
PROGRAMS = cpu-usage cpu-temp pomo media-player pomodoro

all: release

pomodoro: pomodoro.o
	$(CC) $(CFLAGS) -o pomodoro.out pomodoro.o

media-player: media-player.o
	$(CC) $(CFLAGS) -o media-player.out media-player.o

pomo: pomo.o
	$(CC) $(CFLAGS) -o pomo.out pomo.o

pomodoro.o:
	$(CC) $(CFLAGS) -c pomodoro.c

media-player.o:
	$(CC) $(CFLAGS) -c media-player.c

pomo.o:
	$(CC) $(CFLAGS) -c pomo.c

release: $(PROGRAMS)

clean:
	rm -f *.o $(PROGRAMS)
