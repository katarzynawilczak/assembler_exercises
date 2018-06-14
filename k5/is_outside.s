	.type is_outside, @function
	.global is_outside
is_outside:		#arg: rdi,rsi,rdx
	cmp %rsi, %rdx
	jae rsi_l_rdx
	push %rsi	#jak nie to zamiana miejscami
	mov %rdx, %rsi
	pop %rdx	#sciagnij ze stosu do rdx
rsi_l_rdx:	#w rsi mniejsza, w rdx wieksza wartosc
	cmp %rdi, %rsi
	ja  ret_minus
	cmp %rdi, %rdx
	jb ret_plus
	mov $0, %rax
	jmp end
ret_minus:
	mov $-1, %rax
	jmp end
ret_plus:
	mov $1, %rax
end:
	ret

	
