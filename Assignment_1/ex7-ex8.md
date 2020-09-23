## Ex7 
1) The following files were edited:
   1) sysproc.c : Implemented a function **int sys_wolfie(void)** .If the buffer is too small returns a negative value i.e -1. If the call succeeds, return the number of bytes copied to the buffer.
   2) syscall.h : Defined the position of the system call vector that connect to my implementation.
   3) syscall.c : **extern int sys_wolfie(void);** This external function is visible to the whole program,it connects the shell and the kernel and the system call function was added to the system call vector at the position defined in syscall.h
   4) usys.S : Created a user level system call definition for the system call sys_wolfie.Used to connect the call of user to system call function.
   5) user.h : Included the system call which copies the ASCII image of a wolf picture  i.e. **int wolfie(void *buf, uint size);** in the user header file.
   
2) The following files were created:
   1) wolfietest.c : A code in c++ which included user,types,stat header files and which would print the image of the wolfie on the console if the size of buffer is greater than size of the image else prints a error message.

## Ex8

1) Makefile was edited :
   Makefile needs to be edited before our program i.e wolfietest.c is available for xv6 source code for compilation .Made just one change in Makefile i.e included **wolfietest** in under the USER PROGRAMS (UPROGS) in the makefile.
2) Then executed the following commands in the terminal:
   ```bash
   tejas@tejas-XPS-13-9380:~$ cd xv6-public
   tejas@tejas-XPS-13-9380:~/xv6-public$ make clean
   tejas@tejas-XPS-13-9380:~/xv6-public$ make
   tejas@tejas-XPS-13-9380:~/xv6-public$ make qemu
   ```
3) Then after entering the xv6 shell's command prompt checked the contents of fs.img by using **ls** and then executed **wolfietest** to get the wolfie image from the kernal and printing it on the console.