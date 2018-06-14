	.type max_dif, @function
	.global max_dif

max_dif:			#arg: rdi,rsi,rdx,rcx
	mov %edi, %eax	#szukam najwiekszego
	cmp %esi, %eax
	jge niezam1
	mov %esi, %eax
niezam1:
	cmp %edx, %eax
	jge niezam2
	mov %edx, %eax
niezam2:
	cmp %ecx, %eax
	jge niezam3
	mov %ecx, %eax	#najwiekszy w rax, teraz szukam najwiekszego
niezam3:		
	push %rax 	#zapamietuje max na stosie, PUSH RAX!!!(nie eax)
	mov %edi, %eax	
	cmp %esi, %eax
	jle niezam4
	mov %esi, %eax
niezam4:
	cmp %edx, %eax
	jle niezam5
	mov %edx, %eax
niezam5:
	cmp %ecx, %eax
	jle minus
	mov %ecx, %eax
minus:	
	mov %eax, %edi	# w rdi najmniejszy
	pop %rax	# w rax najwiekszy
	subl %edi, %eax #roznica
end:
	ret

	
