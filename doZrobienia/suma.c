//1. Pobiera jeden argument, liczy sume z mniejszymi az do 0

#include <stdio.h>

long long int sumac(int arg){
	int suma=0;
	for(int i=arg; i>0; i--){
		suma=suma+i;
	}

	return suma;
}

int main(void){
	int arg=10;
	printf("Suma dla liczby %d wynosi: sumac=  %lld , sumaS=  %lld\n", arg,sumac(arg), sumas(arg));


}
