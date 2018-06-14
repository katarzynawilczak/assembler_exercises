#include <stdio.h>

//tworzymy kolejne znaki  np:  dla 3,"A" wynik: "A,B,C" 

char * create_str(char * buf, int n, int c); //int c czy char c?


void main( void )
{
		char buf[10];
		printf("%s\n",create_str(buf,10,'A'));

}
