//wykonaj dana operacje na stringu w zaleznosci czy maska rowna 1 (jak 0 to nie)
#include <stdio.h>

char* encode(char* buf, unsigned int mask, int operation, int charr);

int main(){
	char buf[] = {'1','a','2','b','5','6','7','8','9','0','3', 0};
	printf("%s \n", encode(buf, 3, 3, 'b'));
	return 0;
}
//0- brak operacji, 1-usun, 2-transpozycja, 3-podmien na literke
