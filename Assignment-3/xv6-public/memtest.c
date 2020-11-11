#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"

int
main(int argc, char *argv[])
{
	for(int i=0; i<60; i++)
	{
		if(fork() == 0)
		{
			for(int j=0;j<10;j++)
			{
				if(malloc(4096) == 0)
				{
					printf(1, "PID: %d\n", getpid());
					break;
				}
			}
			break;
		}
	}
	while(wait()!=-1);
  exit();
}
