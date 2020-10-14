#include "types.h"
#include "stat.h"
#include "user.h"

int main(int argc, char* argv[])
{

	if(argc < 2) {
		printf(1, "Not enough arguments.\n");
		exit();
	}
	int bt = atoi(argv[1]);
	set_burst_time(bt);
	printf(1, "Burst time set to %d\n", get_burst_time());
  exit();
}
