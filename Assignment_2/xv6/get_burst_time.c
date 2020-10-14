#include "types.h"
#include "stat.h"
#include "user.h"

int main(int argc, char* argv[])
{
	int bt = get_burst_time();
	printf(1, "Burst time: %d\n", bt);
  exit();
}
