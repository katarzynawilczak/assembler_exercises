	.type max_dif, @function
	.global max_dif

max_dif:			#arg: rdi,rsi,rdx,rcx
	mov %rdi, %rax	#szukam najwiekszego
	cmp %rsi, %rax
	jge niezam1
	mov %rsi, %rax
niezam1:
	cmp %rdx, %rax
	jge niezam2
	mov %rdx, %rax
niezam2:
	cmp %rcx, %rax
	jge niezam3
	mov %rcx, %rax	#najwiekszy w rax, teraz szukam najwiekszego
niezam3:		
	push %rax 	#zapamietuje max na stosie
	mov %rdi, %rax	
	cmp %rsi, %rax
	jle niezam4
	mov %rsi, %rax
niezam4:
	cmp %rdx, %rax
	jle niezam5
	mov %rdx, %rax
niezam5:
	cmp %rcx, %rax
	jle minus
	mov %rcx, %rax
minus:	
	mov %rax, %rdi	# w rdi najmniejszy
	pop %rax	# w rax najwiekszy
	sub %rdi, %rax #roznica
end:
	ret

	
