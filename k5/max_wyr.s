	.type max, @function
	.global max
max: 		#arg:rdi,rsi
	sub %rdx,%rdx	#wyczysczenie rejestrow pomocniczych
	sub %rcx,%rcx
	push %rdi	#zapamietanie a i b
	push %rsi
	add %rdi, %rsi #w rsi suma rsi=a+b
	mov %rsi, %rdx	# w rdx suma a + b
	pop %rsi	
	sub %rsi, %rdi #w rdi roznica rdi=a-b
	mov %rdi, %rcx	#w rcx roznica	a-b
	pop %rdi
	mov %rdx, %rax
	cmp $0, %rax
	cmp %rax, %rcx		#trzeba sprawdzic znaki przy porownywaniu???
	jl end			#wieksza suma
	mov %rcx, %rax		#wieksza roznica
l
#	push %rax		#zapamietaj max
#	imul %rsi, %rdi	#rsi*rdi do rdi, imul-dla operacji ze znakiem#
#	pop %rax	#sciagnij ze stosu roznice lub sume (max) do rax
#	cmp %rax, %rdi	
#	jl end		#najwieksze dotychczasowe max
#	mov %rdi, %rax #najwieksze mnozenie
end:
	ret	#powrot	
	

	
