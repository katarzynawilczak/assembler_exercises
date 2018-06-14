//arg: 3 liczby, zwraca najwieksza

#include<stdio.h>

int greatest(int a, int b, int c);

int main(void){
	int a=4;
	int b=0;
	int c=2;

	printf("Najwieksza liczba z %d, %d, %d, to: %d ", a,b,c,greatest(a,b,c));

}
