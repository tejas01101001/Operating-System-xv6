#include "types.h"
#include "stat.h"
#include "user.h"
#include "processInfo.h"

int main(int argc, char *argv[])
{	
	if(argc < 2){
    	  printf(2, "Usage: getProcInfo...\n");
    	  exit();
  	}
  	
  	for(int i=1; i<argc; i++)
  	{
  		struct processInfo* ptr;
  		ptr = (struct processInfo*) malloc(sizeof(struct processInfo));
  		
  		if(getProcInfo(atoi(argv[i]), ptr) < 0)
  		{
  			printf(2, "getProcInfo: %s failed\n", argv[i]);
  			break;
  		}
  		
  		printf(1, "PPID: %d\n", ptr->ppid);
  		printf(1, "Psize: %d\n", ptr->psize);
  		printf(1, "Context switches: %d\n", ptr->numberContextSwitches);
  	}
  	
  	exit();
}
