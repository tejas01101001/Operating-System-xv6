#include "types.h"
#include "stat.h"
#include "user.h"

int main(void)
{
	int mpid = getMaxPid();
	if(mpid < 0)
	{
		printf(1, "No active processes in process table.\n");
	}
	else printf(1, "Greatest PID: %d\n", getMaxPid());
	exit();
}
