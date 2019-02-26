//Jako argumenty przyjmuje 3 liczby, zwraca najmniejsza

#include<stdio.h>

long long int minc(int a, int b, int c){
 int min=a;
 if(min>b){
	  min = b;
	  }
 if(min>c){
	min=c;
		
 }
 return min;
}

long long int mina(int a, int b, int c);

void main(void){
	int a=1;
	int b=2;
	int c=0;
	printf("MinC= %ld, MinA = %ld", minc(a,b,c), mina(a,b,c));

}
