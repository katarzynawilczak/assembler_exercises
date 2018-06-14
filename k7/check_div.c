//jesli c=0, to wynik:1(a podzielne przez b), 0(a niepodzielne przez b), jesli c inne to dzieli a przez 1..64, ustawia kolejno bity podzielnosci 1 lub niepodzielnosci 0
#include <stdio.h>


unsigned long check_div(long a, long b, long c);

int main(void){
	long a=10;
	long b=5;
	long c=1;
	printf("Wynik: %ld\n", check_div(a,b,c));
}
