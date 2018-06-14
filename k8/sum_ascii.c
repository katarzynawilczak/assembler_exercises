#include<stdio.h>
#include<stdlib.h>

long int sum_ascii(char *str, int a, int b, int charset, int *count );

//---------------------------------------------------------------
// funkcja wyznacza sumę kodów ASCII znaków łańcucha str (o ile
// znajdujš się na odpowiednich pozycjach i pasujš do wybranego
// zbioru znaków) oraz zwraca liczbę uwzględnionych w sumie znaków
//
// Parametry:
//    str     - łańcuch znaków
//    a       - pozycja początkowa sprawdzanych znaków (0<=a<=length(str)-1)
//    b       - pozycja końcowa sprawdzanych znaków (0<=b i a<=b); jeżeli
//              b >= length(str), to obliczenia należy wykonać tak,
//              jakby b było równe length(str)-1
//    charset - 0 = dowolne znaki
//              1 = ['0'..'9'] (uwzględniane są tylko cyfry)
//              2 = ['A'..'Z']
//              3 = ['a'..'z']
//              4 = ['A'..'Z','a'..'z']
//    count  - liczba znaków uwzględnionych w trakcie sumowania
//             (pasujących do charset i na pozycjach z zakresu [a,b]
//cmp $0
// W przypadku gdy str ma długosć np. 10, to dla parametrów a=0, b=9
// i a=0, b=100 funkcja powinna zwracać identyczne wartosci
//
// Wersja minimum : prawidłowe działanie dla charset = 0

int main(){
	char str[]="ab2zef2";
	int a=1; 
	int b=3;
	int charset = 4;
	int count=0;
	long int ret = sum_ascii(str,a,b,charset,&count);
	printf("Wynik: %ld, %d\n", ret, count);
	
return 0;




}
