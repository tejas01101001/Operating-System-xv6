
_memtest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "user.h"
#include "fs.h"
#include <stddef.h>

int main(int argc, char *argv[])
{
   0:	f3 0f 1e fb          	endbr32 
   4:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   8:	83 e4 f0             	and    $0xfffffff0,%esp
   b:	ff 71 fc             	pushl  -0x4(%ecx)
   e:	55                   	push   %ebp
   f:	89 e5                	mov    %esp,%ebp
  11:	57                   	push   %edi
  12:	56                   	push   %esi
  13:	8d 85 5c fe ff ff    	lea    -0x1a4(%ebp),%eax
  19:	53                   	push   %ebx
  1a:	51                   	push   %ecx
  1b:	81 ec d8 01 00 00    	sub    $0x1d8,%esp
  21:	89 85 1c fe ff ff    	mov    %eax,-0x1e4(%ebp)
	int cnt = 0;
  27:	c7 85 18 fe ff ff 00 	movl   $0x0,-0x1e8(%ebp)
  2e:	00 00 00 
	int *address[10];
	int cnt_to_pid[100];

	for (int i = 0; i < 20; i++)
	{
		if (fork() == 0)
  31:	e8 15 04 00 00       	call   44b <fork>
  36:	89 c3                	mov    %eax,%ebx
  38:	85 c0                	test   %eax,%eax
  3a:	0f 85 cf 00 00 00    	jne    10f <main+0x10f>
		{
			cnt++;
  40:	83 85 18 fe ff ff 01 	addl   $0x1,-0x1e8(%ebp)
  47:	c7 85 20 fe ff ff 00 	movl   $0x0,-0x1e0(%ebp)
  4e:	00 00 00 
  51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
			for (int j = 0; j < 10; j++)
			{
				int *ptr = (int *)malloc(4096);
  58:	83 ec 0c             	sub    $0xc,%esp
  5b:	68 00 10 00 00       	push   $0x1000
  60:	e8 ab 07 00 00       	call   810 <malloc>
				address[j] = ptr;

				if (ptr == NULL)
  65:	83 c4 10             	add    $0x10,%esp
				address[j] = ptr;
  68:	89 84 9d 30 fe ff ff 	mov    %eax,-0x1d0(%ebp,%ebx,4)
				int *ptr = (int *)malloc(4096);
  6f:	89 c6                	mov    %eax,%esi
				if (ptr == NULL)
  71:	85 c0                	test   %eax,%eax
  73:	0f 84 21 01 00 00    	je     19a <main+0x19a>
				{
					printf(1, "PID: %d\n", getpid());
					break;
				}

				int pid = getpid();
  79:	e8 55 04 00 00       	call   4d3 <getpid>
  7e:	89 c7                	mov    %eax,%edi
				cnt_to_pid[cnt] = pid;
  80:	8b 85 1c fe ff ff    	mov    -0x1e4(%ebp),%eax

				for (int k = 0; k < 1024; k++)
				{
					int value = pid * 100000 + j * 10000 + k;
  86:	69 d7 a0 86 01 00    	imul   $0x186a0,%edi,%edx
  8c:	03 95 20 fe ff ff    	add    -0x1e0(%ebp),%edx
				cnt_to_pid[cnt] = pid;
  92:	89 38                	mov    %edi,(%eax)
				for (int k = 0; k < 1024; k++)
  94:	8d 82 00 04 00 00    	lea    0x400(%edx),%eax
  9a:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
  a1:	89 85 24 fe ff ff    	mov    %eax,-0x1dc(%ebp)
  a7:	89 f0                	mov    %esi,%eax
  a9:	29 c8                	sub    %ecx,%eax
  ab:	89 c1                	mov    %eax,%ecx
  ad:	8b 85 24 fe ff ff    	mov    -0x1dc(%ebp),%eax
  b3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  b7:	90                   	nop
					*(ptr + k) = value;
  b8:	89 14 91             	mov    %edx,(%ecx,%edx,4)
				for (int k = 0; k < 1024; k++)
  bb:	83 c2 01             	add    $0x1,%edx
  be:	39 c2                	cmp    %eax,%edx
  c0:	75 f6                	jne    b8 <main+0xb8>
				}
				if (j == 0)
  c2:	85 db                	test   %ebx,%ebx
  c4:	0f 84 a2 00 00 00    	je     16c <main+0x16c>
					printf(1, "1st  block - cnt : %d , PID : %d, Start Address : %p\n", cnt, pid, address[j]);
				if (j == 9)
  ca:	83 fb 09             	cmp    $0x9,%ebx
  cd:	74 12                	je     e1 <main+0xe1>
			for (int j = 0; j < 10; j++)
  cf:	81 85 20 fe ff ff 10 	addl   $0x2710,-0x1e0(%ebp)
  d6:	27 00 00 
  d9:	83 c3 01             	add    $0x1,%ebx
  dc:	e9 77 ff ff ff       	jmp    58 <main+0x58>
					printf(1, "10th block - cnt : %d , PID : %d, Start Address : %p\n", cnt, pid, address[j]);
  e1:	83 ec 0c             	sub    $0xc,%esp
  e4:	56                   	push   %esi
  e5:	57                   	push   %edi
  e6:	ff b5 18 fe ff ff    	pushl  -0x1e8(%ebp)
  ec:	68 5c 09 00 00       	push   $0x95c
  f1:	6a 01                	push   $0x1
  f3:	e8 b8 04 00 00       	call   5b0 <printf>
  f8:	83 c4 20             	add    $0x20,%esp
	for (int i = 0; i < 20; i++)
  fb:	83 85 1c fe ff ff 04 	addl   $0x4,-0x1e4(%ebp)
 102:	83 bd 18 fe ff ff 14 	cmpl   $0x14,-0x1e8(%ebp)
 109:	0f 85 22 ff ff ff    	jne    31 <main+0x31>
		}
		else
			break;
	}

	while (wait() != -1); // Execute all the child process
 10f:	e8 47 03 00 00       	call   45b <wait>
 114:	83 f8 ff             	cmp    $0xffffffff,%eax
 117:	75 f6                	jne    10f <main+0x10f>

	if (cnt == 0)
 119:	8b 95 18 fe ff ff    	mov    -0x1e8(%ebp),%edx
		exit();

	for (int i = 0; i < 10; i++)
 11f:	31 c0                	xor    %eax,%eax
	if (cnt == 0)
 121:	85 d2                	test   %edx,%edx
 123:	0f 84 b6 00 00 00    	je     1df <main+0x1df>
	{
		if (i == 0)
 129:	85 c0                	test   %eax,%eax
 12b:	74 10                	je     13d <main+0x13d>
			printf(1, "PID : %d ,Start Address: %p, First value in 1st  block: %d \n", cnt_to_pid[cnt], address[i], *address[i]);
		if (i == 9)
 12d:	83 f8 09             	cmp    $0x9,%eax
 130:	0f 84 81 00 00 00    	je     1b7 <main+0x1b7>
	for (int i = 0; i < 10; i++)
 136:	83 c0 01             	add    $0x1,%eax
		if (i == 0)
 139:	85 c0                	test   %eax,%eax
 13b:	75 f0                	jne    12d <main+0x12d>
			printf(1, "PID : %d ,Start Address: %p, First value in 1st  block: %d \n", cnt_to_pid[cnt], address[i], *address[i]);
 13d:	8b 85 30 fe ff ff    	mov    -0x1d0(%ebp),%eax
 143:	83 ec 0c             	sub    $0xc,%esp
 146:	ff 30                	pushl  (%eax)
 148:	50                   	push   %eax
 149:	8b 85 18 fe ff ff    	mov    -0x1e8(%ebp),%eax
 14f:	ff b4 85 58 fe ff ff 	pushl  -0x1a8(%ebp,%eax,4)
 156:	68 94 09 00 00       	push   $0x994
 15b:	6a 01                	push   $0x1
 15d:	e8 4e 04 00 00       	call   5b0 <printf>
 162:	83 c4 20             	add    $0x20,%esp
	for (int i = 0; i < 10; i++)
 165:	b8 01 00 00 00       	mov    $0x1,%eax
 16a:	eb ca                	jmp    136 <main+0x136>
					printf(1, "1st  block - cnt : %d , PID : %d, Start Address : %p\n", cnt, pid, address[j]);
 16c:	83 ec 0c             	sub    $0xc,%esp
			for (int j = 0; j < 10; j++)
 16f:	bb 01 00 00 00       	mov    $0x1,%ebx
					printf(1, "1st  block - cnt : %d , PID : %d, Start Address : %p\n", cnt, pid, address[j]);
 174:	56                   	push   %esi
 175:	57                   	push   %edi
 176:	ff b5 18 fe ff ff    	pushl  -0x1e8(%ebp)
 17c:	68 24 09 00 00       	push   $0x924
 181:	6a 01                	push   $0x1
 183:	e8 28 04 00 00       	call   5b0 <printf>
			for (int j = 0; j < 10; j++)
 188:	83 c4 20             	add    $0x20,%esp
 18b:	81 85 20 fe ff ff 10 	addl   $0x2710,-0x1e0(%ebp)
 192:	27 00 00 
 195:	e9 be fe ff ff       	jmp    58 <main+0x58>
					printf(1, "PID: %d\n", getpid());
 19a:	e8 34 03 00 00       	call   4d3 <getpid>
 19f:	83 ec 04             	sub    $0x4,%esp
 1a2:	50                   	push   %eax
 1a3:	68 18 09 00 00       	push   $0x918
 1a8:	6a 01                	push   $0x1
 1aa:	e8 01 04 00 00       	call   5b0 <printf>
					break;
 1af:	83 c4 10             	add    $0x10,%esp
 1b2:	e9 44 ff ff ff       	jmp    fb <main+0xfb>
			printf(1, "PID : %d ,Start Address: %p, First value in 10th block: %d \n", cnt_to_pid[cnt], address[i], *address[i]);
 1b7:	8b 85 54 fe ff ff    	mov    -0x1ac(%ebp),%eax
 1bd:	83 ec 0c             	sub    $0xc,%esp
 1c0:	ff 30                	pushl  (%eax)
 1c2:	50                   	push   %eax
 1c3:	8b 85 18 fe ff ff    	mov    -0x1e8(%ebp),%eax
 1c9:	ff b4 85 58 fe ff ff 	pushl  -0x1a8(%ebp,%eax,4)
 1d0:	68 d4 09 00 00       	push   $0x9d4
 1d5:	6a 01                	push   $0x1
 1d7:	e8 d4 03 00 00       	call   5b0 <printf>
 1dc:	83 c4 20             	add    $0x20,%esp
		exit();
 1df:	e8 6f 02 00 00       	call   453 <exit>
 1e4:	66 90                	xchg   %ax,%ax
 1e6:	66 90                	xchg   %ax,%ax
 1e8:	66 90                	xchg   %ax,%ax
 1ea:	66 90                	xchg   %ax,%ax
 1ec:	66 90                	xchg   %ax,%ax
 1ee:	66 90                	xchg   %ax,%ax

000001f0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 1f0:	f3 0f 1e fb          	endbr32 
 1f4:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 1f5:	31 c0                	xor    %eax,%eax
{
 1f7:	89 e5                	mov    %esp,%ebp
 1f9:	53                   	push   %ebx
 1fa:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1fd:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  while((*s++ = *t++) != 0)
 200:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
 204:	88 14 01             	mov    %dl,(%ecx,%eax,1)
 207:	83 c0 01             	add    $0x1,%eax
 20a:	84 d2                	test   %dl,%dl
 20c:	75 f2                	jne    200 <strcpy+0x10>
    ;
  return os;
}
 20e:	89 c8                	mov    %ecx,%eax
 210:	5b                   	pop    %ebx
 211:	5d                   	pop    %ebp
 212:	c3                   	ret    
 213:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 21a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000220 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 220:	f3 0f 1e fb          	endbr32 
 224:	55                   	push   %ebp
 225:	89 e5                	mov    %esp,%ebp
 227:	53                   	push   %ebx
 228:	8b 4d 08             	mov    0x8(%ebp),%ecx
 22b:	8b 55 0c             	mov    0xc(%ebp),%edx
  while(*p && *p == *q)
 22e:	0f b6 01             	movzbl (%ecx),%eax
 231:	0f b6 1a             	movzbl (%edx),%ebx
 234:	84 c0                	test   %al,%al
 236:	75 19                	jne    251 <strcmp+0x31>
 238:	eb 26                	jmp    260 <strcmp+0x40>
 23a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 240:	0f b6 41 01          	movzbl 0x1(%ecx),%eax
    p++, q++;
 244:	83 c1 01             	add    $0x1,%ecx
 247:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 24a:	0f b6 1a             	movzbl (%edx),%ebx
 24d:	84 c0                	test   %al,%al
 24f:	74 0f                	je     260 <strcmp+0x40>
 251:	38 d8                	cmp    %bl,%al
 253:	74 eb                	je     240 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 255:	29 d8                	sub    %ebx,%eax
}
 257:	5b                   	pop    %ebx
 258:	5d                   	pop    %ebp
 259:	c3                   	ret    
 25a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 260:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 262:	29 d8                	sub    %ebx,%eax
}
 264:	5b                   	pop    %ebx
 265:	5d                   	pop    %ebp
 266:	c3                   	ret    
 267:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 26e:	66 90                	xchg   %ax,%ax

00000270 <strlen>:

uint
strlen(const char *s)
{
 270:	f3 0f 1e fb          	endbr32 
 274:	55                   	push   %ebp
 275:	89 e5                	mov    %esp,%ebp
 277:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
 27a:	80 3a 00             	cmpb   $0x0,(%edx)
 27d:	74 21                	je     2a0 <strlen+0x30>
 27f:	31 c0                	xor    %eax,%eax
 281:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 288:	83 c0 01             	add    $0x1,%eax
 28b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
 28f:	89 c1                	mov    %eax,%ecx
 291:	75 f5                	jne    288 <strlen+0x18>
    ;
  return n;
}
 293:	89 c8                	mov    %ecx,%eax
 295:	5d                   	pop    %ebp
 296:	c3                   	ret    
 297:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 29e:	66 90                	xchg   %ax,%ax
  for(n = 0; s[n]; n++)
 2a0:	31 c9                	xor    %ecx,%ecx
}
 2a2:	5d                   	pop    %ebp
 2a3:	89 c8                	mov    %ecx,%eax
 2a5:	c3                   	ret    
 2a6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ad:	8d 76 00             	lea    0x0(%esi),%esi

000002b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2b0:	f3 0f 1e fb          	endbr32 
 2b4:	55                   	push   %ebp
 2b5:	89 e5                	mov    %esp,%ebp
 2b7:	57                   	push   %edi
 2b8:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 2bb:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2be:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c1:	89 d7                	mov    %edx,%edi
 2c3:	fc                   	cld    
 2c4:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 2c6:	89 d0                	mov    %edx,%eax
 2c8:	5f                   	pop    %edi
 2c9:	5d                   	pop    %ebp
 2ca:	c3                   	ret    
 2cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 2cf:	90                   	nop

000002d0 <strchr>:

char*
strchr(const char *s, char c)
{
 2d0:	f3 0f 1e fb          	endbr32 
 2d4:	55                   	push   %ebp
 2d5:	89 e5                	mov    %esp,%ebp
 2d7:	8b 45 08             	mov    0x8(%ebp),%eax
 2da:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
 2de:	0f b6 10             	movzbl (%eax),%edx
 2e1:	84 d2                	test   %dl,%dl
 2e3:	75 16                	jne    2fb <strchr+0x2b>
 2e5:	eb 21                	jmp    308 <strchr+0x38>
 2e7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2ee:	66 90                	xchg   %ax,%ax
 2f0:	0f b6 50 01          	movzbl 0x1(%eax),%edx
 2f4:	83 c0 01             	add    $0x1,%eax
 2f7:	84 d2                	test   %dl,%dl
 2f9:	74 0d                	je     308 <strchr+0x38>
    if(*s == c)
 2fb:	38 d1                	cmp    %dl,%cl
 2fd:	75 f1                	jne    2f0 <strchr+0x20>
      return (char*)s;
  return 0;
}
 2ff:	5d                   	pop    %ebp
 300:	c3                   	ret    
 301:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
 308:	31 c0                	xor    %eax,%eax
}
 30a:	5d                   	pop    %ebp
 30b:	c3                   	ret    
 30c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000310 <gets>:

char*
gets(char *buf, int max)
{
 310:	f3 0f 1e fb          	endbr32 
 314:	55                   	push   %ebp
 315:	89 e5                	mov    %esp,%ebp
 317:	57                   	push   %edi
 318:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 319:	31 f6                	xor    %esi,%esi
{
 31b:	53                   	push   %ebx
 31c:	89 f3                	mov    %esi,%ebx
 31e:	83 ec 1c             	sub    $0x1c,%esp
 321:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 324:	eb 33                	jmp    359 <gets+0x49>
 326:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 32d:	8d 76 00             	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 330:	83 ec 04             	sub    $0x4,%esp
 333:	8d 45 e7             	lea    -0x19(%ebp),%eax
 336:	6a 01                	push   $0x1
 338:	50                   	push   %eax
 339:	6a 00                	push   $0x0
 33b:	e8 2b 01 00 00       	call   46b <read>
    if(cc < 1)
 340:	83 c4 10             	add    $0x10,%esp
 343:	85 c0                	test   %eax,%eax
 345:	7e 1c                	jle    363 <gets+0x53>
      break;
    buf[i++] = c;
 347:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 34b:	83 c7 01             	add    $0x1,%edi
 34e:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 351:	3c 0a                	cmp    $0xa,%al
 353:	74 23                	je     378 <gets+0x68>
 355:	3c 0d                	cmp    $0xd,%al
 357:	74 1f                	je     378 <gets+0x68>
  for(i=0; i+1 < max; ){
 359:	83 c3 01             	add    $0x1,%ebx
 35c:	89 fe                	mov    %edi,%esi
 35e:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 361:	7c cd                	jl     330 <gets+0x20>
 363:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 365:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 368:	c6 03 00             	movb   $0x0,(%ebx)
}
 36b:	8d 65 f4             	lea    -0xc(%ebp),%esp
 36e:	5b                   	pop    %ebx
 36f:	5e                   	pop    %esi
 370:	5f                   	pop    %edi
 371:	5d                   	pop    %ebp
 372:	c3                   	ret    
 373:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 377:	90                   	nop
 378:	8b 75 08             	mov    0x8(%ebp),%esi
 37b:	8b 45 08             	mov    0x8(%ebp),%eax
 37e:	01 de                	add    %ebx,%esi
 380:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 382:	c6 03 00             	movb   $0x0,(%ebx)
}
 385:	8d 65 f4             	lea    -0xc(%ebp),%esp
 388:	5b                   	pop    %ebx
 389:	5e                   	pop    %esi
 38a:	5f                   	pop    %edi
 38b:	5d                   	pop    %ebp
 38c:	c3                   	ret    
 38d:	8d 76 00             	lea    0x0(%esi),%esi

00000390 <stat>:

int
stat(const char *n, struct stat *st)
{
 390:	f3 0f 1e fb          	endbr32 
 394:	55                   	push   %ebp
 395:	89 e5                	mov    %esp,%ebp
 397:	56                   	push   %esi
 398:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 399:	83 ec 08             	sub    $0x8,%esp
 39c:	6a 00                	push   $0x0
 39e:	ff 75 08             	pushl  0x8(%ebp)
 3a1:	e8 ed 00 00 00       	call   493 <open>
  if(fd < 0)
 3a6:	83 c4 10             	add    $0x10,%esp
 3a9:	85 c0                	test   %eax,%eax
 3ab:	78 2b                	js     3d8 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 3ad:	83 ec 08             	sub    $0x8,%esp
 3b0:	ff 75 0c             	pushl  0xc(%ebp)
 3b3:	89 c3                	mov    %eax,%ebx
 3b5:	50                   	push   %eax
 3b6:	e8 f0 00 00 00       	call   4ab <fstat>
  close(fd);
 3bb:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 3be:	89 c6                	mov    %eax,%esi
  close(fd);
 3c0:	e8 b6 00 00 00       	call   47b <close>
  return r;
 3c5:	83 c4 10             	add    $0x10,%esp
}
 3c8:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3cb:	89 f0                	mov    %esi,%eax
 3cd:	5b                   	pop    %ebx
 3ce:	5e                   	pop    %esi
 3cf:	5d                   	pop    %ebp
 3d0:	c3                   	ret    
 3d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    return -1;
 3d8:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3dd:	eb e9                	jmp    3c8 <stat+0x38>
 3df:	90                   	nop

000003e0 <atoi>:

int
atoi(const char *s)
{
 3e0:	f3 0f 1e fb          	endbr32 
 3e4:	55                   	push   %ebp
 3e5:	89 e5                	mov    %esp,%ebp
 3e7:	53                   	push   %ebx
 3e8:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3eb:	0f be 02             	movsbl (%edx),%eax
 3ee:	8d 48 d0             	lea    -0x30(%eax),%ecx
 3f1:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
 3f4:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
 3f9:	77 1a                	ja     415 <atoi+0x35>
 3fb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3ff:	90                   	nop
    n = n*10 + *s++ - '0';
 400:	83 c2 01             	add    $0x1,%edx
 403:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
 406:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
 40a:	0f be 02             	movsbl (%edx),%eax
 40d:	8d 58 d0             	lea    -0x30(%eax),%ebx
 410:	80 fb 09             	cmp    $0x9,%bl
 413:	76 eb                	jbe    400 <atoi+0x20>
  return n;
}
 415:	89 c8                	mov    %ecx,%eax
 417:	5b                   	pop    %ebx
 418:	5d                   	pop    %ebp
 419:	c3                   	ret    
 41a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000420 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 420:	f3 0f 1e fb          	endbr32 
 424:	55                   	push   %ebp
 425:	89 e5                	mov    %esp,%ebp
 427:	57                   	push   %edi
 428:	8b 45 10             	mov    0x10(%ebp),%eax
 42b:	8b 55 08             	mov    0x8(%ebp),%edx
 42e:	56                   	push   %esi
 42f:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 432:	85 c0                	test   %eax,%eax
 434:	7e 0f                	jle    445 <memmove+0x25>
 436:	01 d0                	add    %edx,%eax
  dst = vdst;
 438:	89 d7                	mov    %edx,%edi
 43a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    *dst++ = *src++;
 440:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
 441:	39 f8                	cmp    %edi,%eax
 443:	75 fb                	jne    440 <memmove+0x20>
  return vdst;
}
 445:	5e                   	pop    %esi
 446:	89 d0                	mov    %edx,%eax
 448:	5f                   	pop    %edi
 449:	5d                   	pop    %ebp
 44a:	c3                   	ret    

0000044b <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 44b:	b8 01 00 00 00       	mov    $0x1,%eax
 450:	cd 40                	int    $0x40
 452:	c3                   	ret    

00000453 <exit>:
SYSCALL(exit)
 453:	b8 02 00 00 00       	mov    $0x2,%eax
 458:	cd 40                	int    $0x40
 45a:	c3                   	ret    

0000045b <wait>:
SYSCALL(wait)
 45b:	b8 03 00 00 00       	mov    $0x3,%eax
 460:	cd 40                	int    $0x40
 462:	c3                   	ret    

00000463 <pipe>:
SYSCALL(pipe)
 463:	b8 04 00 00 00       	mov    $0x4,%eax
 468:	cd 40                	int    $0x40
 46a:	c3                   	ret    

0000046b <read>:
SYSCALL(read)
 46b:	b8 05 00 00 00       	mov    $0x5,%eax
 470:	cd 40                	int    $0x40
 472:	c3                   	ret    

00000473 <write>:
SYSCALL(write)
 473:	b8 10 00 00 00       	mov    $0x10,%eax
 478:	cd 40                	int    $0x40
 47a:	c3                   	ret    

0000047b <close>:
SYSCALL(close)
 47b:	b8 15 00 00 00       	mov    $0x15,%eax
 480:	cd 40                	int    $0x40
 482:	c3                   	ret    

00000483 <kill>:
SYSCALL(kill)
 483:	b8 06 00 00 00       	mov    $0x6,%eax
 488:	cd 40                	int    $0x40
 48a:	c3                   	ret    

0000048b <exec>:
SYSCALL(exec)
 48b:	b8 07 00 00 00       	mov    $0x7,%eax
 490:	cd 40                	int    $0x40
 492:	c3                   	ret    

00000493 <open>:
SYSCALL(open)
 493:	b8 0f 00 00 00       	mov    $0xf,%eax
 498:	cd 40                	int    $0x40
 49a:	c3                   	ret    

0000049b <mknod>:
SYSCALL(mknod)
 49b:	b8 11 00 00 00       	mov    $0x11,%eax
 4a0:	cd 40                	int    $0x40
 4a2:	c3                   	ret    

000004a3 <unlink>:
SYSCALL(unlink)
 4a3:	b8 12 00 00 00       	mov    $0x12,%eax
 4a8:	cd 40                	int    $0x40
 4aa:	c3                   	ret    

000004ab <fstat>:
SYSCALL(fstat)
 4ab:	b8 08 00 00 00       	mov    $0x8,%eax
 4b0:	cd 40                	int    $0x40
 4b2:	c3                   	ret    

000004b3 <link>:
SYSCALL(link)
 4b3:	b8 13 00 00 00       	mov    $0x13,%eax
 4b8:	cd 40                	int    $0x40
 4ba:	c3                   	ret    

000004bb <mkdir>:
SYSCALL(mkdir)
 4bb:	b8 14 00 00 00       	mov    $0x14,%eax
 4c0:	cd 40                	int    $0x40
 4c2:	c3                   	ret    

000004c3 <chdir>:
SYSCALL(chdir)
 4c3:	b8 09 00 00 00       	mov    $0x9,%eax
 4c8:	cd 40                	int    $0x40
 4ca:	c3                   	ret    

000004cb <dup>:
SYSCALL(dup)
 4cb:	b8 0a 00 00 00       	mov    $0xa,%eax
 4d0:	cd 40                	int    $0x40
 4d2:	c3                   	ret    

000004d3 <getpid>:
SYSCALL(getpid)
 4d3:	b8 0b 00 00 00       	mov    $0xb,%eax
 4d8:	cd 40                	int    $0x40
 4da:	c3                   	ret    

000004db <sbrk>:
SYSCALL(sbrk)
 4db:	b8 0c 00 00 00       	mov    $0xc,%eax
 4e0:	cd 40                	int    $0x40
 4e2:	c3                   	ret    

000004e3 <sleep>:
SYSCALL(sleep)
 4e3:	b8 0d 00 00 00       	mov    $0xd,%eax
 4e8:	cd 40                	int    $0x40
 4ea:	c3                   	ret    

000004eb <uptime>:
SYSCALL(uptime)
 4eb:	b8 0e 00 00 00       	mov    $0xe,%eax
 4f0:	cd 40                	int    $0x40
 4f2:	c3                   	ret    
 4f3:	66 90                	xchg   %ax,%ax
 4f5:	66 90                	xchg   %ax,%ax
 4f7:	66 90                	xchg   %ax,%ax
 4f9:	66 90                	xchg   %ax,%ax
 4fb:	66 90                	xchg   %ax,%ax
 4fd:	66 90                	xchg   %ax,%ax
 4ff:	90                   	nop

00000500 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	57                   	push   %edi
 504:	56                   	push   %esi
 505:	53                   	push   %ebx
 506:	83 ec 3c             	sub    $0x3c,%esp
 509:	89 4d c4             	mov    %ecx,-0x3c(%ebp)
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 50c:	89 d1                	mov    %edx,%ecx
{
 50e:	89 45 b8             	mov    %eax,-0x48(%ebp)
  if(sgn && xx < 0){
 511:	85 d2                	test   %edx,%edx
 513:	0f 89 7f 00 00 00    	jns    598 <printint+0x98>
 519:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 51d:	74 79                	je     598 <printint+0x98>
    neg = 1;
 51f:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
    x = -xx;
 526:	f7 d9                	neg    %ecx
  } else {
    x = xx;
  }

  i = 0;
 528:	31 db                	xor    %ebx,%ebx
 52a:	8d 75 d7             	lea    -0x29(%ebp),%esi
 52d:	8d 76 00             	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 530:	89 c8                	mov    %ecx,%eax
 532:	31 d2                	xor    %edx,%edx
 534:	89 cf                	mov    %ecx,%edi
 536:	f7 75 c4             	divl   -0x3c(%ebp)
 539:	0f b6 92 18 0a 00 00 	movzbl 0xa18(%edx),%edx
 540:	89 45 c0             	mov    %eax,-0x40(%ebp)
 543:	89 d8                	mov    %ebx,%eax
 545:	8d 5b 01             	lea    0x1(%ebx),%ebx
  }while((x /= base) != 0);
 548:	8b 4d c0             	mov    -0x40(%ebp),%ecx
    buf[i++] = digits[x % base];
 54b:	88 14 1e             	mov    %dl,(%esi,%ebx,1)
  }while((x /= base) != 0);
 54e:	39 7d c4             	cmp    %edi,-0x3c(%ebp)
 551:	76 dd                	jbe    530 <printint+0x30>
  if(neg)
 553:	8b 4d bc             	mov    -0x44(%ebp),%ecx
 556:	85 c9                	test   %ecx,%ecx
 558:	74 0c                	je     566 <printint+0x66>
    buf[i++] = '-';
 55a:	c6 44 1d d8 2d       	movb   $0x2d,-0x28(%ebp,%ebx,1)
    buf[i++] = digits[x % base];
 55f:	89 d8                	mov    %ebx,%eax
    buf[i++] = '-';
 561:	ba 2d 00 00 00       	mov    $0x2d,%edx

  while(--i >= 0)
 566:	8b 7d b8             	mov    -0x48(%ebp),%edi
 569:	8d 5c 05 d7          	lea    -0x29(%ebp,%eax,1),%ebx
 56d:	eb 07                	jmp    576 <printint+0x76>
 56f:	90                   	nop
 570:	0f b6 13             	movzbl (%ebx),%edx
 573:	83 eb 01             	sub    $0x1,%ebx
  write(fd, &c, 1);
 576:	83 ec 04             	sub    $0x4,%esp
 579:	88 55 d7             	mov    %dl,-0x29(%ebp)
 57c:	6a 01                	push   $0x1
 57e:	56                   	push   %esi
 57f:	57                   	push   %edi
 580:	e8 ee fe ff ff       	call   473 <write>
  while(--i >= 0)
 585:	83 c4 10             	add    $0x10,%esp
 588:	39 de                	cmp    %ebx,%esi
 58a:	75 e4                	jne    570 <printint+0x70>
    putc(fd, buf[i]);
}
 58c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 58f:	5b                   	pop    %ebx
 590:	5e                   	pop    %esi
 591:	5f                   	pop    %edi
 592:	5d                   	pop    %ebp
 593:	c3                   	ret    
 594:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 598:	c7 45 bc 00 00 00 00 	movl   $0x0,-0x44(%ebp)
 59f:	eb 87                	jmp    528 <printint+0x28>
 5a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5a8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5af:	90                   	nop

000005b0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5b0:	f3 0f 1e fb          	endbr32 
 5b4:	55                   	push   %ebp
 5b5:	89 e5                	mov    %esp,%ebp
 5b7:	57                   	push   %edi
 5b8:	56                   	push   %esi
 5b9:	53                   	push   %ebx
 5ba:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5bd:	8b 75 0c             	mov    0xc(%ebp),%esi
 5c0:	0f b6 1e             	movzbl (%esi),%ebx
 5c3:	84 db                	test   %bl,%bl
 5c5:	0f 84 b4 00 00 00    	je     67f <printf+0xcf>
  ap = (uint*)(void*)&fmt + 1;
 5cb:	8d 45 10             	lea    0x10(%ebp),%eax
 5ce:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
 5d1:	8d 7d e7             	lea    -0x19(%ebp),%edi
  state = 0;
 5d4:	31 d2                	xor    %edx,%edx
  ap = (uint*)(void*)&fmt + 1;
 5d6:	89 45 d0             	mov    %eax,-0x30(%ebp)
 5d9:	eb 33                	jmp    60e <printf+0x5e>
 5db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 5df:	90                   	nop
 5e0:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 5e3:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
 5e8:	83 f8 25             	cmp    $0x25,%eax
 5eb:	74 17                	je     604 <printf+0x54>
  write(fd, &c, 1);
 5ed:	83 ec 04             	sub    $0x4,%esp
 5f0:	88 5d e7             	mov    %bl,-0x19(%ebp)
 5f3:	6a 01                	push   $0x1
 5f5:	57                   	push   %edi
 5f6:	ff 75 08             	pushl  0x8(%ebp)
 5f9:	e8 75 fe ff ff       	call   473 <write>
 5fe:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
 601:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 604:	0f b6 1e             	movzbl (%esi),%ebx
 607:	83 c6 01             	add    $0x1,%esi
 60a:	84 db                	test   %bl,%bl
 60c:	74 71                	je     67f <printf+0xcf>
    c = fmt[i] & 0xff;
 60e:	0f be cb             	movsbl %bl,%ecx
 611:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 614:	85 d2                	test   %edx,%edx
 616:	74 c8                	je     5e0 <printf+0x30>
      }
    } else if(state == '%'){
 618:	83 fa 25             	cmp    $0x25,%edx
 61b:	75 e7                	jne    604 <printf+0x54>
      if(c == 'd'){
 61d:	83 f8 64             	cmp    $0x64,%eax
 620:	0f 84 9a 00 00 00    	je     6c0 <printf+0x110>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 626:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 62c:	83 f9 70             	cmp    $0x70,%ecx
 62f:	74 5f                	je     690 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 631:	83 f8 73             	cmp    $0x73,%eax
 634:	0f 84 d6 00 00 00    	je     710 <printf+0x160>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 63a:	83 f8 63             	cmp    $0x63,%eax
 63d:	0f 84 8d 00 00 00    	je     6d0 <printf+0x120>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 643:	83 f8 25             	cmp    $0x25,%eax
 646:	0f 84 b4 00 00 00    	je     700 <printf+0x150>
  write(fd, &c, 1);
 64c:	83 ec 04             	sub    $0x4,%esp
 64f:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 653:	6a 01                	push   $0x1
 655:	57                   	push   %edi
 656:	ff 75 08             	pushl  0x8(%ebp)
 659:	e8 15 fe ff ff       	call   473 <write>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 65e:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 661:	83 c4 0c             	add    $0xc,%esp
 664:	6a 01                	push   $0x1
 666:	83 c6 01             	add    $0x1,%esi
 669:	57                   	push   %edi
 66a:	ff 75 08             	pushl  0x8(%ebp)
 66d:	e8 01 fe ff ff       	call   473 <write>
  for(i = 0; fmt[i]; i++){
 672:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
        putc(fd, c);
 676:	83 c4 10             	add    $0x10,%esp
      }
      state = 0;
 679:	31 d2                	xor    %edx,%edx
  for(i = 0; fmt[i]; i++){
 67b:	84 db                	test   %bl,%bl
 67d:	75 8f                	jne    60e <printf+0x5e>
    }
  }
}
 67f:	8d 65 f4             	lea    -0xc(%ebp),%esp
 682:	5b                   	pop    %ebx
 683:	5e                   	pop    %esi
 684:	5f                   	pop    %edi
 685:	5d                   	pop    %ebp
 686:	c3                   	ret    
 687:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 68e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 16, 0);
 690:	83 ec 0c             	sub    $0xc,%esp
 693:	b9 10 00 00 00       	mov    $0x10,%ecx
 698:	6a 00                	push   $0x0
 69a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 69d:	8b 45 08             	mov    0x8(%ebp),%eax
 6a0:	8b 13                	mov    (%ebx),%edx
 6a2:	e8 59 fe ff ff       	call   500 <printint>
        ap++;
 6a7:	89 d8                	mov    %ebx,%eax
 6a9:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6ac:	31 d2                	xor    %edx,%edx
        ap++;
 6ae:	83 c0 04             	add    $0x4,%eax
 6b1:	89 45 d0             	mov    %eax,-0x30(%ebp)
 6b4:	e9 4b ff ff ff       	jmp    604 <printf+0x54>
 6b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        printint(fd, *ap, 10, 1);
 6c0:	83 ec 0c             	sub    $0xc,%esp
 6c3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6c8:	6a 01                	push   $0x1
 6ca:	eb ce                	jmp    69a <printf+0xea>
 6cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
 6d0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
 6d3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 6d6:	8b 03                	mov    (%ebx),%eax
  write(fd, &c, 1);
 6d8:	6a 01                	push   $0x1
        ap++;
 6da:	83 c3 04             	add    $0x4,%ebx
  write(fd, &c, 1);
 6dd:	57                   	push   %edi
 6de:	ff 75 08             	pushl  0x8(%ebp)
        putc(fd, *ap);
 6e1:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 6e4:	e8 8a fd ff ff       	call   473 <write>
        ap++;
 6e9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
 6ec:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6ef:	31 d2                	xor    %edx,%edx
 6f1:	e9 0e ff ff ff       	jmp    604 <printf+0x54>
 6f6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 6fd:	8d 76 00             	lea    0x0(%esi),%esi
        putc(fd, c);
 700:	88 5d e7             	mov    %bl,-0x19(%ebp)
  write(fd, &c, 1);
 703:	83 ec 04             	sub    $0x4,%esp
 706:	e9 59 ff ff ff       	jmp    664 <printf+0xb4>
 70b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 70f:	90                   	nop
        s = (char*)*ap;
 710:	8b 45 d0             	mov    -0x30(%ebp),%eax
 713:	8b 18                	mov    (%eax),%ebx
        ap++;
 715:	83 c0 04             	add    $0x4,%eax
 718:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
 71b:	85 db                	test   %ebx,%ebx
 71d:	74 17                	je     736 <printf+0x186>
        while(*s != 0){
 71f:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
 722:	31 d2                	xor    %edx,%edx
        while(*s != 0){
 724:	84 c0                	test   %al,%al
 726:	0f 84 d8 fe ff ff    	je     604 <printf+0x54>
 72c:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 72f:	89 de                	mov    %ebx,%esi
 731:	8b 5d 08             	mov    0x8(%ebp),%ebx
 734:	eb 1a                	jmp    750 <printf+0x1a0>
          s = "(null)";
 736:	bb 11 0a 00 00       	mov    $0xa11,%ebx
        while(*s != 0){
 73b:	89 75 d4             	mov    %esi,-0x2c(%ebp)
 73e:	b8 28 00 00 00       	mov    $0x28,%eax
 743:	89 de                	mov    %ebx,%esi
 745:	8b 5d 08             	mov    0x8(%ebp),%ebx
 748:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 74f:	90                   	nop
  write(fd, &c, 1);
 750:	83 ec 04             	sub    $0x4,%esp
          s++;
 753:	83 c6 01             	add    $0x1,%esi
 756:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
 759:	6a 01                	push   $0x1
 75b:	57                   	push   %edi
 75c:	53                   	push   %ebx
 75d:	e8 11 fd ff ff       	call   473 <write>
        while(*s != 0){
 762:	0f b6 06             	movzbl (%esi),%eax
 765:	83 c4 10             	add    $0x10,%esp
 768:	84 c0                	test   %al,%al
 76a:	75 e4                	jne    750 <printf+0x1a0>
 76c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
      state = 0;
 76f:	31 d2                	xor    %edx,%edx
 771:	e9 8e fe ff ff       	jmp    604 <printf+0x54>
 776:	66 90                	xchg   %ax,%ax
 778:	66 90                	xchg   %ax,%ax
 77a:	66 90                	xchg   %ax,%ax
 77c:	66 90                	xchg   %ax,%ax
 77e:	66 90                	xchg   %ax,%ax

00000780 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 780:	f3 0f 1e fb          	endbr32 
 784:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 785:	a1 cc 0c 00 00       	mov    0xccc,%eax
{
 78a:	89 e5                	mov    %esp,%ebp
 78c:	57                   	push   %edi
 78d:	56                   	push   %esi
 78e:	53                   	push   %ebx
 78f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 792:	8b 10                	mov    (%eax),%edx
  bp = (Header*)ap - 1;
 794:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 797:	39 c8                	cmp    %ecx,%eax
 799:	73 15                	jae    7b0 <free+0x30>
 79b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 79f:	90                   	nop
 7a0:	39 d1                	cmp    %edx,%ecx
 7a2:	72 14                	jb     7b8 <free+0x38>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7a4:	39 d0                	cmp    %edx,%eax
 7a6:	73 10                	jae    7b8 <free+0x38>
{
 7a8:	89 d0                	mov    %edx,%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7aa:	8b 10                	mov    (%eax),%edx
 7ac:	39 c8                	cmp    %ecx,%eax
 7ae:	72 f0                	jb     7a0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7b0:	39 d0                	cmp    %edx,%eax
 7b2:	72 f4                	jb     7a8 <free+0x28>
 7b4:	39 d1                	cmp    %edx,%ecx
 7b6:	73 f0                	jae    7a8 <free+0x28>
      break;
  if(bp + bp->s.size == p->s.ptr){
 7b8:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7bb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7be:	39 fa                	cmp    %edi,%edx
 7c0:	74 1e                	je     7e0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 7c2:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7c5:	8b 50 04             	mov    0x4(%eax),%edx
 7c8:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7cb:	39 f1                	cmp    %esi,%ecx
 7cd:	74 28                	je     7f7 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 7cf:	89 08                	mov    %ecx,(%eax)
  freep = p;
}
 7d1:	5b                   	pop    %ebx
  freep = p;
 7d2:	a3 cc 0c 00 00       	mov    %eax,0xccc
}
 7d7:	5e                   	pop    %esi
 7d8:	5f                   	pop    %edi
 7d9:	5d                   	pop    %ebp
 7da:	c3                   	ret    
 7db:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 7df:	90                   	nop
    bp->s.size += p->s.ptr->s.size;
 7e0:	03 72 04             	add    0x4(%edx),%esi
 7e3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 7e6:	8b 10                	mov    (%eax),%edx
 7e8:	8b 12                	mov    (%edx),%edx
 7ea:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 7ed:	8b 50 04             	mov    0x4(%eax),%edx
 7f0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7f3:	39 f1                	cmp    %esi,%ecx
 7f5:	75 d8                	jne    7cf <free+0x4f>
    p->s.size += bp->s.size;
 7f7:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 7fa:	a3 cc 0c 00 00       	mov    %eax,0xccc
    p->s.size += bp->s.size;
 7ff:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 802:	8b 53 f8             	mov    -0x8(%ebx),%edx
 805:	89 10                	mov    %edx,(%eax)
}
 807:	5b                   	pop    %ebx
 808:	5e                   	pop    %esi
 809:	5f                   	pop    %edi
 80a:	5d                   	pop    %ebp
 80b:	c3                   	ret    
 80c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000810 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 810:	f3 0f 1e fb          	endbr32 
 814:	55                   	push   %ebp
 815:	89 e5                	mov    %esp,%ebp
 817:	57                   	push   %edi
 818:	56                   	push   %esi
 819:	53                   	push   %ebx
 81a:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 81d:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 820:	8b 3d cc 0c 00 00    	mov    0xccc,%edi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 826:	8d 70 07             	lea    0x7(%eax),%esi
 829:	c1 ee 03             	shr    $0x3,%esi
 82c:	83 c6 01             	add    $0x1,%esi
  if((prevp = freep) == 0){
 82f:	85 ff                	test   %edi,%edi
 831:	0f 84 a9 00 00 00    	je     8e0 <malloc+0xd0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 837:	8b 07                	mov    (%edi),%eax
    if(p->s.size >= nunits){
 839:	8b 48 04             	mov    0x4(%eax),%ecx
 83c:	39 f1                	cmp    %esi,%ecx
 83e:	73 6d                	jae    8ad <malloc+0x9d>
 840:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 846:	bb 00 10 00 00       	mov    $0x1000,%ebx
 84b:	0f 43 de             	cmovae %esi,%ebx
  p = sbrk(nu * sizeof(Header));
 84e:	8d 0c dd 00 00 00 00 	lea    0x0(,%ebx,8),%ecx
 855:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
 858:	eb 17                	jmp    871 <malloc+0x61>
 85a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 860:	8b 10                	mov    (%eax),%edx
    if(p->s.size >= nunits){
 862:	8b 4a 04             	mov    0x4(%edx),%ecx
 865:	39 f1                	cmp    %esi,%ecx
 867:	73 4f                	jae    8b8 <malloc+0xa8>
 869:	8b 3d cc 0c 00 00    	mov    0xccc,%edi
 86f:	89 d0                	mov    %edx,%eax
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 871:	39 c7                	cmp    %eax,%edi
 873:	75 eb                	jne    860 <malloc+0x50>
  p = sbrk(nu * sizeof(Header));
 875:	83 ec 0c             	sub    $0xc,%esp
 878:	ff 75 e4             	pushl  -0x1c(%ebp)
 87b:	e8 5b fc ff ff       	call   4db <sbrk>
  if(p == (char*)-1)
 880:	83 c4 10             	add    $0x10,%esp
 883:	83 f8 ff             	cmp    $0xffffffff,%eax
 886:	74 1b                	je     8a3 <malloc+0x93>
  hp->s.size = nu;
 888:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 88b:	83 ec 0c             	sub    $0xc,%esp
 88e:	83 c0 08             	add    $0x8,%eax
 891:	50                   	push   %eax
 892:	e8 e9 fe ff ff       	call   780 <free>
  return freep;
 897:	a1 cc 0c 00 00       	mov    0xccc,%eax
      if((p = morecore(nunits)) == 0)
 89c:	83 c4 10             	add    $0x10,%esp
 89f:	85 c0                	test   %eax,%eax
 8a1:	75 bd                	jne    860 <malloc+0x50>
        return 0;
  }
}
 8a3:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 8a6:	31 c0                	xor    %eax,%eax
}
 8a8:	5b                   	pop    %ebx
 8a9:	5e                   	pop    %esi
 8aa:	5f                   	pop    %edi
 8ab:	5d                   	pop    %ebp
 8ac:	c3                   	ret    
    if(p->s.size >= nunits){
 8ad:	89 c2                	mov    %eax,%edx
 8af:	89 f8                	mov    %edi,%eax
 8b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 8b8:	39 ce                	cmp    %ecx,%esi
 8ba:	74 54                	je     910 <malloc+0x100>
        p->s.size -= nunits;
 8bc:	29 f1                	sub    %esi,%ecx
 8be:	89 4a 04             	mov    %ecx,0x4(%edx)
        p += p->s.size;
 8c1:	8d 14 ca             	lea    (%edx,%ecx,8),%edx
        p->s.size = nunits;
 8c4:	89 72 04             	mov    %esi,0x4(%edx)
      freep = prevp;
 8c7:	a3 cc 0c 00 00       	mov    %eax,0xccc
}
 8cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 8cf:	8d 42 08             	lea    0x8(%edx),%eax
}
 8d2:	5b                   	pop    %ebx
 8d3:	5e                   	pop    %esi
 8d4:	5f                   	pop    %edi
 8d5:	5d                   	pop    %ebp
 8d6:	c3                   	ret    
 8d7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 8de:	66 90                	xchg   %ax,%ax
    base.s.ptr = freep = prevp = &base;
 8e0:	c7 05 cc 0c 00 00 d0 	movl   $0xcd0,0xccc
 8e7:	0c 00 00 
    base.s.size = 0;
 8ea:	bf d0 0c 00 00       	mov    $0xcd0,%edi
    base.s.ptr = freep = prevp = &base;
 8ef:	c7 05 d0 0c 00 00 d0 	movl   $0xcd0,0xcd0
 8f6:	0c 00 00 
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8f9:	89 f8                	mov    %edi,%eax
    base.s.size = 0;
 8fb:	c7 05 d4 0c 00 00 00 	movl   $0x0,0xcd4
 902:	00 00 00 
    if(p->s.size >= nunits){
 905:	e9 36 ff ff ff       	jmp    840 <malloc+0x30>
 90a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        prevp->s.ptr = p->s.ptr;
 910:	8b 0a                	mov    (%edx),%ecx
 912:	89 08                	mov    %ecx,(%eax)
 914:	eb b1                	jmp    8c7 <malloc+0xb7>
