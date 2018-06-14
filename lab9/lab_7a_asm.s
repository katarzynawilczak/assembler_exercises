#----------------------------------------------------------------
# Funkcja do programu lab_7a - Asemblery Laboratorium IS II rok
# SILNIA ITERACYJNIE
#----------------------------------------------------------------

	.text
	.type facta, @function
	.globl facta	

facta:	mov $1, %rax

next:	cmp $1, %rdi	
	jbe f_e		#jesli arg. mniejszy to powrót
	mul %rdi	#jesli wiekszy to pomnoż z rax
	dec %rdi	#zmniejsz o jeden argument
	jmp next	#wykonaj ponownie w petli

f_e:	ret

