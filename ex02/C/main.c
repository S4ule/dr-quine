#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/wait.h>
#define STR "#include <stdio.h>%1$c#include <sys/types.h>%1$c#include <sys/stat.h>%1$c#include <fcntl.h>%1$c#include <unistd.h>%1$c#include <sys/wait.h>%1$c#define STR %2$c%3$s%2$c%1$cint main(){%1$cint i = %5$d;%1$cint fd, t;%1$cchar s_c[100], s[100], s_a[100];%1$cif (access(%2$cSully_5.c%2$c, R_OK) != -1)%1$c%4$c--i;%1$csprintf(s_c, %2$c./Sully_%%d.c%2$c, i);%1$csprintf(s, %2$c./Sully_%%d%2$c, i);%1$csprintf(s_a, %2$cSully_%%d%2$c, i);%1$cchar *av[5] = {%2$cgcc%2$c, s_c, %2$c-o%2$c, s, NULL};%1$cchar *a[2] = {s_a, NULL};%1$cfd = open(s_c,O_RDWR | O_CREAT | O_TRUNC,S_IRUSR);%1$cif (fd < 0)%1$c%4$creturn 1;%1$cdprintf(fd,STR,10,34,STR,9,i);%1$cclose(fd);%1$cfd = fork();%1$cif (fd == -1)%1$c%4$creturn 1;%1$cif (fd == 0){%1$c%4$cexecv(%2$c/usr/bin/gcc%2$c, av);%1$c%4$creturn 1;%1$c}%1$cwaitpid(fd, &t, 0);%1$cif (i <= 0)%1$c%4$creturn 0;%1$cexecv(s, a);}%1$c"
int main(){
int i = 5;
int fd, t;
char s_c[100], s[100], s_a[100];
if (access("Sully_5.c", R_OK) != -1)
	--i;
sprintf(s_c, "./Sully_%d.c", i);
sprintf(s, "./Sully_%d", i);
sprintf(s_a, "Sully_%d", i);
char *av[5] = {"gcc", s_c, "-o", s, NULL};
char *a[2] = {s_a, NULL};
fd = open(s_c,O_RDWR | O_CREAT | O_TRUNC,S_IRUSR);
if (fd < 0)
	return 1;
dprintf(fd,STR,10,34,STR,9,i);
close(fd);
fd = fork();
if (fd == -1)
	return 1;
if (fd == 0){
	execv("/usr/bin/gcc", av);
	return 1;
}
waitpid(fd, &t, 0);
if (i <= 0)
	return 0;
execv(s, a);}
