#include <errno.h>
#include <fcntl.h>
#include <limits.h>
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/wait.h>
#include <unistd.h>

char *execute_argv(char *const argv[]) {
  int pipefd[2];
  if (pipe(pipefd) == -1) {
    perror("pipe");
    return NULL;
  }

  if (fcntl(pipefd[0], F_SETFD, FD_CLOEXEC) == -1) {
    perror("fcntl pipefd[0] FD_CLOEXEC");
  }

  pid_t pid = fork();
  if (pid == -1) {
    perror("fork");
    close(pipefd[0]);
    close(pipefd[1]);
    return NULL;
  }

  if (pid == 0) {
    if (dup2(pipefd[1], STDOUT_FILENO) == -1) {
      perror("dup2 stdout");
      _exit(127);
    }
    if (dup2(pipefd[1], STDERR_FILENO) == -1) {
      perror("dup2 stderr");
      _exit(127);
    }
    close(pipefd[0]);
    close(pipefd[1]);
    execvp(argv[0], argv);
    perror("execvp");
    _exit(127);
  }

  close(pipefd[1]);
  size_t total_size = 0;
  char *output = NULL;
  const size_t CHUNK = 4096;
  for (;;) {
    char buf[CHUNK];
    ssize_t n = read(pipefd[0], buf, sizeof(buf));
    if (n > 0) {
      char *tmp = realloc(output, total_size + (size_t)n + 1);
      if (!tmp) {
        free(output);
        output = NULL;
        perror("realloc");
        close(pipefd[0]);
        int status;
        waitpid(pid, &status, 0);
        return NULL;
      }
      output = tmp;
      memcpy(output + total_size, buf, (size_t)n);
      total_size += (size_t)n;
      output[total_size] = '\0';
      continue;
    } else if (n == 0) {
      break;
    } else {
      if (errno == EINTR)
        continue;
      perror("read");
      break;
    }
  }

  close(pipefd[0]);

  int status;
  while (waitpid(pid, &status, 0) == -1) {
    if (errno == EINTR)
      continue;
    perror("waitpid");
    break;
  }

  if (!output) {
    output = calloc(1, 1);
  }

  return output;
}

int main(void) {
  char *const argv1[] = {"playerctl", "status", NULL};
  char *status = execute_argv(argv1);
  if (!status) {
    printf("{\"text\": \" No media\"}\n");
    return 0;
  }
  status[strcspn(status, "\r\n")] = '\0';

  char *const argv2[] = {"playerctl", "metadata", "--format", "{{xesam:title}}",
                         NULL};
  char *title = execute_argv(argv2);
  if (title) {
    title[strcspn(title, "\r\n")] = '\0';
  }

  char *const argv3[] = {"playerctl", "metadata", "--format",
                         "{{xesam:artist}}", NULL};
  char *artist = execute_argv(argv3);
  if (artist) {
    artist[strcspn(artist, "\r\n")] = '\0';
  }

  if (!title || title[0] == '\0') {
    if (title)
      free(title);
    title = "Unknown";
  }
  if (!artist || artist[0] == '\0') {
    if (artist)
      free(artist);
    artist = "Unknown";
  }

  char tooltip[2048];
  snprintf(tooltip, sizeof(tooltip), "Title: %s\\nArtist: %s", title, artist);

  if (strcmp(status, "Playing") == 0) {
    printf("{\"text\": \" %s\", \"tooltip\": \"%s\"}\n", title, tooltip);
  } else {
    printf("{\"text\": \" %s\"}\n", "No media");
  }

  free(status);
  free(title);
  free(artist);
  return 0;
}
