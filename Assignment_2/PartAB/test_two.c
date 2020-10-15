#include "types.h"
#include "stat.h"
#include "user.h"
#include "processInfo.h"

int main()
{	
	// array containing burst times
	int t[10] = {100, 90, 80, 70, 60, 50, 40, 30, 20, 10};
	int x = 0;
	set_burst_time(1);
	
	for(int i=0; i<10; i++)
	{
		if(fork() == 0)
		{
			x = set_burst_time(t[i]);
			
			if(x < 0)
			{
				printf(1, "Counldn't set burst time for process %d\n", getpid());
			}
			
			// CPU bound process
			if(i >= 5)
			{
				double y = 0;
				
				// code to add delay
				for(int i2=0; i2<t[i]*1000000/2; i2++)
				{
					y += 2.69*13.01;
				}
				x = y;
				
				printf(1, "CPU Bound(%d) / ",  x);
			}
			
			// IO bound process
			else
			{
				// mimicking IO wait
				for(int i2=0; i2<t[i]*10; i2++)
				{
					sleep(1);
				}
				printf(1, "IO Bound / ");
			}
			
			x = get_burst_time();
			struct processInfo *info;
			info = (struct processInfo*) malloc(sizeof(struct processInfo));
			getProcInfo(getpid(), info);
			printf(1, "Burst Time: %d Context Switches: %d\n", x, info->numberContextSwitches);
			exit();
						
		}
	}
	
	while(wait() != -1);
	exit();
}
