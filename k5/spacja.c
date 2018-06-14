//usuniecie POWATARZAJACYCH SIE spacji +gdy 1 to zamiana liter na wielkie

#include<stdio.h>
#include<stdlib.h>

char * usun(char * buf, int zm);
int main(){
	char* wsk = malloc(100);
  sprintf(wsk, "%s", "abc  def   gh ijk");
 
  printf("%s\n", wsk);
 
  //0 - bez zamiany na duze litery; 1 - zamiana na duze litery
  printf("%s\n", usun(wsk, 1));
 
  free(wsk);
  return 0;
}
