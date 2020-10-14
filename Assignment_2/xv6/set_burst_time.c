#include "types.h"
#include "stat.h"
#include "user.h"

int main(int argc, char* argv[])
{

	if(argc < 2)
	{
		printf(2, "Usage: set_burst_time...\n");
    	  	exit();
    	}
    	
    	int n = atoi(argv[1]);
    	
    	if(set_burst_time(n) < 0)
    	{
    		printf(2, "set_burst_time failed\n");
		exit();
	}
	
	exit();
}	
