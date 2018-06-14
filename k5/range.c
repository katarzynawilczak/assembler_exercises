//a<b<c, x, zwraca 0,1,2,3 w zaleznosci w ktorym przedziale znajduje sie x
#include<stdio.h>

int range(int x, int a, int b, int c);

int main(void){
	int x=12;
	int a=3;
	int b=5;
	int c=10;
	printf("Wynik= %d\n", range(x,a,b,c));
}
