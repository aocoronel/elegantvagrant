#include <stdio.h>
#include <stdlib.h>
#include <sys/sysinfo.h>
#include <unistd.h>

// https://umatechnology.org/c-program-to-find-cpu-usage-in-linux/

void get_cpu_times(long *user, long *nice, long *system, long *idle,
                   long *iowait, long *irq, long *softirq, long *steal) {
  FILE *file = fopen("/proc/stat", "r");
  if (!file) {
    perror("Failed to open /proc/stat");
    exit(EXIT_FAILURE);
  }
  char buffer[256];
  fgets(buffer, sizeof(buffer), file);
  fclose(file);
  sscanf(buffer, "cpu %ld %ld %ld %ld %ld %ld %ld %ld", user, nice, system,
         idle, iowait, irq, softirq, steal);
}

void calculate_idle_and_total(long start[], long end[], long *idle,
                              long *total) {
  long idle_diff = (end[3] + end[4]) - (start[3] + start[4]);
  long total_diff =
      (end[0] + end[1] + end[2] + end[3] + end[4] + end[5] + end[6] + end[7]) -
      (start[0] + start[1] + start[2] + start[3] + start[4] + start[5] +
       start[6] + start[7]);

  *idle = idle_diff;
  *total = total_diff;
}

int main() {
  long start[8], end[8];
  long idle_diff, total_diff;
  get_cpu_times(&start[0], &start[1], &start[2], &start[3], &start[4],
                &start[5], &start[6], &start[7]);
  sleep(1);
  get_cpu_times(&end[0], &end[1], &end[2], &end[3], &end[4], &end[5], &end[6],
                &end[7]);
  // Calculate idle and total time
  calculate_idle_and_total(start, end, &idle_diff, &total_diff);
  double usage = 1.0 - (double)idle_diff / total_diff;
  usage = usage * 100;
  if (usage > 75) {
    printf("{\"text\": \"<span color='#f38ba8'>󰀩 %.2f°C</span>\"}", usage);
  } else {
    printf("{\"text\": \"󰻠 %.0f°C\"}", usage);
  }
}
