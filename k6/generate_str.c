//generowanie stringa, arg:s-bufor, n - liczba znakow, c-znak, inc - 0 takie same, 1 - zwiekszaja sie o jeden

#include<stdio.h>
#include<stdlib.h>

char * generate_str(char *s, int n,int c, int inc);

int main(void){
	char *buf=malloc(10);
	int c='a';
	int n=1;
	int inc=1;
printf("Wynik: %s", generate_str(buf,n,c,inc));
free(buf);
	
}

