	.type generate_str, @function
	.global generate_str
generate_str:		#argumenty w rdi, rsi, rdx(w tym dl), rcx
	mov %rdi, %rax
loop:
	cmp $0, %rsi
	jbe end
	mov %dl, (%rdi)
	cmp $0, %rcx
	je is_zero
	inc %rdx
is_zero:
	inc %rdi
	dec %rsi
	jmp loop

end:
	movb $0, (%rdi)
	ret
	
