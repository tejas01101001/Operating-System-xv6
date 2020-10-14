#include "types.h"
#include "stat.h"
#include "user.h"

#include "processInfo.h"

int main(int argc, char* argv[])
{
	if(argc < 2) {
		printf(1, "Not enough arguments.\n");
		exit();
	}
	struct processInfo* st;
  st = (struct processInfo*)malloc(sizeof(struct processInfo));
  int pid = atoi(argv[1]);
  getProcInfo(pid, st);
	printf(1, "Parent PID: %d\nProcess Size: %d\nContext Switches %d\n", st->ppid, st->psize, st->numberContextSwitches);
  exit();
}
