//przujmuje: bufor, char * a, char*b, zwraca: łaczny wyraz na przemian znaki
#include<stdio.h>
#include<stdlib.h>

char *fun(char *buf, char *a, char* b);

int main(){
	char *buf = malloc(100);
	char *a="abcd";
	char *b="13 4";
	printf("Wynik: %s\n", fun(buf,a,b));

}
