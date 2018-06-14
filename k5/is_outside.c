//przyjmuje x-liczba, a,b - granice przedzialu(nie wiadomo ktory mniejszy), zwraca -1(nizej) 0(w przedziale) +1(wyzej)

#include<stdio.h>

int is_outside(int x, int a, int b);
int main(void){
	int x=15;
	int a=14;
	int b=8;
	printf("Wynik: %d", is_outside(x,a,b));

}
