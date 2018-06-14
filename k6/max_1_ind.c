//arg: tablica, l.elementow, buf.l.parzystych, buf.l.nieparzystych wynik: liczba dla ktorej max 1 w reprez.binarnej
#include<stdio.h>
#include<stdlib.h>

long long max_1_ind(long long *tab,long long n,long long *even_count, long long *neg_count);

int main(){
	long long tab[5]={-10,2,3,5,1};
	long long n=5;
	long long *a=malloc(sizeof(long long));
	long long *b=malloc(sizeof(long long));
	printf("Wynik: %lld\n", max_1_ind(tab,n,a,b),a, b);

}
