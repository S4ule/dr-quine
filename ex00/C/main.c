#include <stdio.h>
#define STR "#include <stdio.h>%1$c#define STR %2$c%3$s%2$c%1$c/*%1$c%4$cf fonction%1$c*/%1$cvoid f(void)%1$c{return ;}%1$c%1$cint main(void){%1$c/*%1$c%4$ccall f fonction%1$c*/%1$cf();printf(STR,10,34,STR,9);}%1$c"
/*
	f fonction
*/
void f(void)
{return ;}

int main(void){
/*
	call f fonction
*/
f();printf(STR,10,34,STR,9);}
