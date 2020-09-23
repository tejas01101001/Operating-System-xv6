#include "types.h"
#include "stat.h"
#include "user.h"

//maximum size of the buffer
const int max_size = 1578;

int main(void)
{

    // Created a buffer with maximum size as max_size 
    void *wolf_buffer = malloc(max_size);

    // Called the system call and stored the size of image.
    int wolf_size = wolfie(wolf_buffer, max_size);

    // If the size of image is in buffer is greater than max_size then print a error message
    if (wolf_size == -1)
    {
        // file descriptor 1 used to print on the standard output i.e (stdout)
        printf(1, "Buffer size is too small\n");
    }
    else
    {
         // file descriptor 1 used to print on the standard output i.e (stdout)
        printf(1, "%s\n", (char *)wolf_buffer);
    }

    return 0;
}
