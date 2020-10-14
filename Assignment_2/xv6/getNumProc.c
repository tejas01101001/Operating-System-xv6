#include "types.h"
#include "stat.h"
#include "user.h"

int main(int argc, char* argv[])
{

	int nproc = getNumProc();
	printf(1, "Number of Processes: %d\n", nproc);
  exit();
}
