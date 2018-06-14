	.type check_tab, @function
	.globl check_tab

check_tab:		#arg: rdi-tab,rsi-n,rdx-max
	mov $0, %r8	#wsk na rdi (tablice)
	mov $0, %r9	#0..63, kolejne liczby
	mov %rsi, %r12	#ile elementow tablicy
	push %rbx
	xor %rbx, %rbx
	mov $0, %cl	#wskaznik przesuniecia
loop:
	mov (%rdi,%r8,4), %r10		#liczby z tablicy, 4-int
	cmp %r9, %r10		#czy dana liczba wystepuje w tablicy
	jne loop_tab		#czemu nie powrownuje poprawnie?

	xor %r11, %r11		#jesli wystepuje
	add $1, %r11
	shl %cl, %r11
	or %r11, %rbx
	jmp next_val
loop_tab:
	incq %r8
	cmp %r12, %r8
	jne loop
	jmp next_val
next_val:
	mov $0, %r8 #zerujemy indeks tablicy!!!
	inc %r9
	inc %cl
	cmp $6, %r9
	jne loop
	jmp end
	
	#mov $0, %rdx #do zrobienia
end:
	mov %rbx, %rax
	pop %rbx
	ret
