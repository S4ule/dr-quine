#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#define STR "#include <stdio.h>%1$c#include <sys/types.h>%1$c#include <sys/stat.h>%1$c#include <fcntl.h>%1$c#define STR %2$c%3$s%2$c%1$c#define FT(x)int main(){int fd;fd=open(%2$cGrace_kid.c%2$c,O_CREAT|O_RDWR|O_TRUNC,S_IRUSR|S_IWUSR);if(fd<0){return(1);}dprintf(fd,STR,10,34,STR,9);}%1$c/*%1$c%4$cmain%1$c*/%1$cFT(void)%1$c"
#define FT(x)int main(){int fd;fd=open("Grace_kid.c",O_CREAT|O_RDWR|O_TRUNC,S_IRUSR|S_IWUSR);if(fd<0){return(1);}dprintf(fd,STR,10,34,STR,9);}
/*
	main
*/
FT(void)
