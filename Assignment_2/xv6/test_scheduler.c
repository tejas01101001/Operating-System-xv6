#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"


int main(int argc, char *argv[])
{
    int t[10] = {40, 70, 10, 90, 60, 30, 20, 80, 100, 50};
    int x = 0;
    set_burst_time(1);
    
    for(int i=0; i<10; i++)
    {
    	if(fork() == 0)
    	{
    		x = set_burst_time(t[i]);
    		int y = 0;
    		
    		for(int i2 = 0; i2<10000000; i2++)
    		{
    			for(int i3 = 0; i3<10000000; i3++)
    			{
    				y++;
    			}
    		}
    		
    		x = y;
    		x = get_burst_time();
    		printf(1, "bt %d \n", x);
    		
    		exit();
    	}
    }
    
    while(wait() != -1);
    exit();
}
