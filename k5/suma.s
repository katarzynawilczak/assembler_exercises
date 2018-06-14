	.type sum, @function
	.global sum

sum:		#arg:rdi,rsi
	cmp %rdi,%rsi
	jae loop
	push %rsi 	#zamiana
	mov %rdi, %rsi
	pop %rdi

	mov %rdi, %rax
loop:
	inc %rdi
	cmp %rdi, %rsi
	je end
	add %rdi, %rax
	jmp loop

end:
	add %rsi,%rax
	ret
