#include <getopt.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#include <unistd.h>

#define TIME_FOCUS 1500     // 25 minutes
#define TIME_BREAK 300      // 5 minutes
#define TIME_LONG_BREAK 900 // 15 minutes
#define TIMER_STATE_FILE "/tmp/pomodoro_timer_state"
#define OUTPUT_FILE "/tmp/pomodoro_output"
#define TIMER_SAVED "/tmp/pomodoro_timer_saved"
#define SESSION_FILE "/tmp/pomodoro_session_count"

bool TMUX_MODE = false;

int file_exists(const char *filename) {
  struct stat buffer;
  return (stat(filename, &buffer) == 0);
}

void write_string_to_file(const char *filename, const char *text) {
  FILE *f = fopen(filename, "w");
  if (!f) {
    perror("fopen");
    return;
  }
  fprintf(f, "%s", text);
  fclose(f);
}

int read_int_from_file(const char *filename) {
  FILE *f = fopen(filename, "r");
  if (!f)
    return -1;
  int val;
  if (fscanf(f, "%d", &val) != 1)
    val = -1;
  fclose(f);
  return val;
}

void notify_send(const char *summary, const char *body) {
  char cmd[512];
  snprintf(cmd, sizeof(cmd), "notify-send \"%s\" \"%s\"", summary, body);
  system(cmd);
}

void tmux_refresh() { system("tmux source-file ~/.tmux.conf"); }

void tmux_set_status(const char *text) {
  char cmd[512];
  snprintf(cmd, sizeof(cmd), "tmux set -g status-right \"%s\"", text);
  system(cmd);
}

void remove_file(const char *filename) {
  if (file_exists(filename)) {
    remove(filename);
  }
}

int pomodoro(int seconds, const char *symbol, int current_session) {
  while (seconds > 0) {
    int minutes = seconds / 60;
    int remaining_seconds = seconds % 60;

    char json[256];
    snprintf(json, sizeof(json),
             "{\"text\":\"%s %d:%02d\", \"tooltip\": \"Current Session: %d\"}",
             symbol, minutes, remaining_seconds, current_session);
    write_string_to_file(OUTPUT_FILE, json);

    char time_str[32];
    snprintf(time_str, sizeof(time_str), "%d", seconds);
    write_string_to_file(TIMER_SAVED, time_str);

    if (TMUX_MODE) {
      char tmux_text[64];
      snprintf(tmux_text, sizeof(tmux_text), "%s %d:%02d", symbol, minutes,
               remaining_seconds);
      tmux_set_status(tmux_text);
    }

    sleep(1);
    seconds--;

    if (!file_exists(TIMER_STATE_FILE)) {
      if (TMUX_MODE)
        tmux_refresh();
      notify_send("Pomodoro: Stop", "Timer stopped.");
      return 0;
    }
  }
  remove_file(TIMER_SAVED);
  return 1;
}

void help() {
  printf("Usage: pomodoro [OPTION]\n");
  printf("Options:\n");
  printf("  -t   Display pomodoro on Tmux\n");
}

int main(int argc, char **argv) {
  int opt = 0;

  while ((opt = getopt_long(argc, argv, ":ht", NULL, NULL)) != -1) {
    switch (opt) {
    case 't':
      TMUX_MODE = true;
      break;
    case 'h':
      help();
      return EXIT_SUCCESS;
    case ':':
      printf("option '%c' needs a value\n", opt);
      break;
    case '?':
      printf("unknown option: %c\n", optopt);
      break;
    }
  }

  int time_focus = TIME_FOCUS;
  int time_break = TIME_BREAK;
  int time_long_break = TIME_LONG_BREAK;

  int paused_time = -1;

  if (file_exists(TIMER_SAVED)) {
    paused_time = read_int_from_file(TIMER_SAVED);
  }

  if (file_exists(TIMER_STATE_FILE)) {
    remove_file(TIMER_STATE_FILE);
    if (TMUX_MODE)
      tmux_refresh();
    notify_send("Pomodoro: Stop", "Timer stopped.");
    return 0;
  } else {
    FILE *f = fopen(TIMER_STATE_FILE, "w");
    if (!f) {
      perror("failed to create timer state file");
      return 1;
    }
    fclose(f);
  }

  int current_session = 1;
  if (file_exists(SESSION_FILE)) {
    current_session = read_int_from_file(SESSION_FILE);
    if (current_session < 1 || current_session > 4)
      current_session = 1;
  }

  if (paused_time > 0) {
    char notify_msg[64];
    snprintf(notify_msg, sizeof(notify_msg), "Remaining Time: %d. Session: %d",
             paused_time, current_session);
    notify_send("Pomodoro: Resume", notify_msg);
    time_focus = paused_time;
  } else {
    remove_file(TIMER_SAVED);
  }

  for (int session = current_session; session <= 4; session++) {
    if (!file_exists(TIMER_SAVED)) {
      notify_send("Pomodoro: Start", "Focus time! (25 minutes)");
    }

    if (!pomodoro(time_focus, "", session)) {
      return 0;
    }

    char sess_str[8];
    snprintf(sess_str, sizeof(sess_str), "%d", session);
    write_string_to_file(SESSION_FILE, sess_str);

    if (session == 4) {
      notify_send("Pomodoro: Break", "Long Break time! (15 minutes)");
      if (!pomodoro(time_long_break, "", session)) {
        return 0;
      }
    } else {
      notify_send("Pomodoro: Break", "Break time! (5 minutes)");
      if (!pomodoro(time_break, "", session)) {
        return 0;
      }
    }
  }

  remove_file(TIMER_STATE_FILE);
  remove_file(SESSION_FILE);
  if (TMUX_MODE)
    tmux_refresh();

  notify_send("Pomodoro: Completed!", "");
  return 0;
}
