#----------------------------------------------------------------
# Funkcja do programu lab_6a - Asemblery Laboratorium IS II rok
#SILNIA REKURENCYJNIE, funkcja wywołana pozniej w jezyku C
#----------------------------------------------------------------

	.text
	.type facta, @function
	.globl facta	#musi byc globalna

facta:	mov $1, %rax	#wynik w rax, argumenty kolejno: rdi,rsi,rdx,rcx

	cmp %rax, %rdi
	jbe f_e

	push %rdi

	dec %rdi
	call facta

	pop %rdi	#pobieraj ze stosu

	mul %rdi	#mnóż rdi z rax, wynik w rax

f_e:	ret

