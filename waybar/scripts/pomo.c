#include <stdio.h>

const char *OUTPUT_FILE = "/tmp/pomodoro_output";
#define MAX_LINE 1024

int main() {
  FILE *fp = fopen(OUTPUT_FILE, "r");
  if (fp == NULL) {
    printf("%s", "{\"text\":\"\", \"class\":\"pomodoro\"}");
    return 0;
  }

  char line[MAX_LINE];
  while (fgets(line, sizeof(line), fp) != NULL) {
    printf("%s", line);
  }

  return 0;
}
