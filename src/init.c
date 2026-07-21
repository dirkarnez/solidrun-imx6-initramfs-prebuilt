#include <stdio.h>
#include <sys/mount.h>
#include <stddef.h>

void init() {
	 mount("proc", "/target/path/proc", "proc", 0, NULL);
}

void main() {
	init();
	
	char buff[100];
	printf("Enter anything");
	while(1)
	{
		scanf("%s",buff);
		printf("%s\n",buff);
	}
}
