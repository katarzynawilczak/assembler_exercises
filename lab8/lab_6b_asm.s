#----------------------------------------------------------------
# Funkcja do programu lab_6b - Asemblery Laboratorium IS II rok
# CIAG FIBONACCIEGO rekurencyjnie
#----------------------------------------------------------------

	.type fiba, @function
	.globl fiba #zmienne lokalne przechowywane na stosie(rej.rsp)

fiba:	push %rbp 	#rbp pomocniczy rejestr
	mov %rsp,%rbp	#rbp wskazuje na rsp, a rsp na stare rbp, rsp sie zmieni, a rbp dalej bedzie pokazywalo na stare rbp

	sub $8,%rsp	#przesuwamy o 8, tam bedzie zmienna lokalna

	cmp $0, %rdi	#jesli arg. jest 0 lub 1 to skok i koniec
	jz f_0

	cmp $1, %rdi
	jz f_1

	push %rdi	#jesli nie to zapamietanie rdi

	sub $2,%rdi	#odejmujemy 2
	call fiba	#rekurencja
	mov %rax,-8(%rbp) #wskazanie na zmienna lokalna

	pop %rdi	#wez rdi

	dec %rdi	#zmniejsz o 1
	call fiba	#rekurencyjnie
	add -8(%rbp),%rax	#to na co wskazuje zmienna lokalna + rax (wynik)

f_e:	mov %rbp,%rsp
	pop %rbp
	ret

f_0:
	mov $0, %rax
	jmp f_e

f_1:
	mov $1, %rax
	jmp f_e
