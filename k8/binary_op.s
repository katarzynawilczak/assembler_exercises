	.type binary_op, @function
	.globl binary_op
binary_op:		#arg: rdi,rsi,rdx,rcx
	xor %r8,%r8	#1 arg
	xor %r9,%r9	#2 arg
	push %rdi
loop:
	mov (%rsi), %r8
	sub $48, %r8
	mov (%rdx), %r9
	sub $48, %r9
	cmp $0, %rcx
	jne op2
	add %r8, %r9
	add $48, %r9
	mov %r9, (%rdi)
	jmp incr
op2:
	cmp $1, %rcx
	jne op3
	and %r8,%r9
	add $48, %r9
	mov %r9, (%rdi)
	jmp incr
op3:
	cmp $2, %rcx
	jne op4
	or %r8, %r9
	add $48, %r9
	mov %r9, (%rdi)
	jmp incr
op4:
	xor %r8, %r9
	add $48, %r9
	mov %r9, (%rdi)
	
incr:
	inc %rdi
	inc %rsi
	inc %rdx
	cmp $0, (%rsi) #na to na co wskazuje!
	jne loop
end:	
	pop %rax
	ret
	
