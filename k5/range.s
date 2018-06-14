	.type range, @function
	.global range
range:					#arg: rdi,rsi,rdx,rcx
	cmp %rdi, %rsi
	ja ret_zero
	cmp %rdi, %rcx
	jb ret_three
	cmp %rdi, %rdx
	ja ret_one
	mov $2, %rax
	jmp end

ret_zero:
	mov $0, %rax
	jmp end
ret_three:
	mov $3, %rax
	jmp end
ret_one:
	mov $1, %rax
end:
	ret

		
