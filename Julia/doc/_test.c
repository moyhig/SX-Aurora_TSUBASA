#include <stdio.h>
#include <unistd.h>
int flag = 0;
int do_sleep(int secs)
{
	
	printf("VE: flag value %d\n", flag);
        flag++;
	printf("VE: increased flag %d\n", flag);
	
	printf("VE: sleeping %d seconds\n", secs);
	sleep(secs);
	printf("VE: finished sleeping.\n");
	printf("VE: flag value %d\n", flag);
	return secs;
}
