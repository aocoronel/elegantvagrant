#include <stdio.h>
#include <stdlib.h>
#include <sys/sysinfo.h>
#include <unistd.h>

float get_cpu_temperature() {
  FILE *fp;
  float temperature = 0.0;
  char buffer[256];
  // Open the temperature file (this path may vary based on your system)
  fp = fopen("/sys/class/thermal/thermal_zone2/temp", "r");
  if (fp == NULL) {
    perror("Failed to read temperature");
    return -1;
  }
  if (fgets(buffer, sizeof(buffer), fp) != NULL) {
    temperature = atof(buffer) / 1000.0;
  }
  fclose(fp);
  return temperature;
}

int main() {
  float cpu_temp_celsius = get_cpu_temperature();
  if (cpu_temp_celsius < 0) {
    printf("Could not retrieve CPU temperature.\n");
  }
  float cpu_temp_farenhait = (cpu_temp_celsius * 9 * 0.2) + 32;
  printf("{\"text\": \"󱃃 %.0f°C\", \"tooltip\": \"Temperature: %.0f°F\"}",
         cpu_temp_celsius, cpu_temp_farenhait);
  return 0;
}
