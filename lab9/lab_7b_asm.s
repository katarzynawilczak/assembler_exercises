#----------------------------------------------------------------
# Funkcja do programu lab_7b - Asemblery Laboratorium IS II rok
# CIAG FIBONACCIEGO ITERACYJNIE
#----------------------------------------------------------------

	.type fiba, @function
	.global fiba

fiba:	push %rbx #zapamietujemy wartosc rbx

	mov $0, %rbx	#umieszczamu 0 i 1 w rbx i rcx
	mov $1, %rcx	

	cmp %rbx, %rdi	#jesli wartosc w rdi rowna ktoremus to koniec
	jz	f_0
	cmp %rcx, %rdi
	jz	f_1

next:
	mov %rbx, %rax	#jesli nie to zapisujemy rbx(k-1) w rax(suma)
	add %rcx, %rax 	#dodajemy rcx(k)
	mov %rcx, %rbx	#zamiana aby zachowac kolejnosc
	mov %rax, %rcx
	dec %rdi	#zmniejszamy rdi (ile razy petla sie wykona)
	cmp $1, %rdi	#porownujemy czy koniec
	ja next	

f_e:	pop %rbx
	ret

f_0:
	mov %rbx, %rax
	jmp f_e

f_1:
	mov %rcx, %rax
	jmp f_e
