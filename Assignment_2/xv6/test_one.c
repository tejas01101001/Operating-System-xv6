#include "types.h"
#include "stat.h"
#include "user.h"

int main()
{	
	// array containing burst times
	int t[10] = {40, 70, 10, 90, 60, 30, 20, 80, 100, 50};
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
			if(i%2 == 0)
			{
				int y = 0;
				
				// code to add delay
				for(int i2=0; i2<t[i]*100000000; i2++)
				{
					y += 10;
				}
				x = y;
				printf(1, "CPU Bound / ");
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
			
			printf(1, "Burst Time: %d \n", x);
			exit();
						
		}
	}
	
	while(wait() != -1);
	exit();
}
