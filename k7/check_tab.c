//arg:tablica n elementowa, max - bufor ile razy wystapiła najczestsza liczba, zliczyc wystapienia licz 0..63 w tablicy, zwraca:wartosc 64 bit, kazdy bit okresla wystapienie liczby(1 lub 0) odpowiadajacej danemi bitowi

#include<stdio.h>
#include<stdlib.h>

unsigned int check_tab(int* tab, int n, int* max);


int main(){
	
	int tab[5]={1,1,0,5,1};
	int n=5;
	int *max = malloc(sizeof(int));
	printf("Wynik %d\n", check_tab(tab,n,max));
	free(max);

}
