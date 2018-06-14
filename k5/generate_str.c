//generowanie stringa, arg:s-bufor, n - liczba znakow, c-znak, inc - 0 takie same, 1 - zwiekszaja sie o jeden

#include<stdio.h>

char * generate_str(char *s, int n,int c, int inc);

int main(void){
	char buf[10];
	int c='a';
	int n=5;
	int inc=0;
printf("Wynik: %s", generate_str(buf,n,c,inc));
	
}

