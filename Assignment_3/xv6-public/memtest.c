#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"
#include <stddef.h>

int main(int argc, char *argv[])
{
	int cnt = 0;
	int *address[10];
	int cnt_to_pid[100];

	for (int i = 0; i < 20; i++)
	{
		if (fork() == 0)
		{
			cnt++;
			for (int j = 0; j < 10; j++)
			{
				int *ptr = (int *)malloc(4096);
				address[j] = ptr;

				if (ptr == NULL)
				{
					printf(1, "PID: %d\n", getpid());
					break;
				}

				int pid = getpid();
				cnt_to_pid[cnt] = pid;

				for (int k = 0; k < 1024; k++)
				{
					int value = pid * 100000 + j * 10000 + k;
					*(ptr + k) = value;
				}
				if (j == 0)
					printf(1, "1st  block - cnt : %d , PID : %d, Start Address : %p\n", cnt, pid, address[j]);
				if (j == 9)
					printf(1, "10th block - cnt : %d , PID : %d, Start Address : %p\n", cnt, pid, address[j]);
			}
		}
		else
			break;
	}

	while (wait() != -1); // Execute all the child process

	if (cnt == 0)
		exit();

	for (int i = 0; i < 10; i++)
	{
		if (i == 0)
			printf(1, "PID : %d ,Start Address: %p, First value in 1st  block: %d \n", cnt_to_pid[cnt], address[i], *address[i]);
		if (i == 9)
			printf(1, "PID : %d ,Start Address: %p, First value in 10th block: %d \n", cnt_to_pid[cnt], address[i], *address[i]);
	}
	cnt--;

	exit();
}
