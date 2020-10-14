#include "types.h"
#include "stat.h"
#include "user.h"

int main(int argc, char* argv[])
{

	int mpid = getMaxPid();
	if(mpid < 0) 
		printf(1, "No eligible processes.\n");
	else 
		printf(1, "Maximum Process ID: %d\n", mpid);
  exit();
}
