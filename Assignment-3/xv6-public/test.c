#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"

int
main(int argc, char *argv[])
{
	for(int i=0; i<1000; i++)
	{
		if(fork() == 0)
		{
			printf(1, "PID: %d\n", getpid());
			break;
		}
	}
	while(wait()!=-1);
  exit();
}
