	.type fun, @function
	.global fun
fun:				#arg: rdi,rsi,rdx
	mov $0, %r8	#pomocnicze wskazniki na a, b i buf
	mov $0, %r9
	mov $0, %r10
	
loop:
	cmp $0, (%rsi,%r8,1)
	jne put_a

cmp_b:
	cmp $0, (%rdx,%r9,1)
	jnz put_b
	
	cmp $0, (%rsi, %r8,1)
	jne put_a
	jmp end

put_a:
	push (%rsi,%r8,1)
	pop (%rdi, %r10,1)
	inc %r8
	inc %r10
	jmp cmp_b	

put_b:
	push (%rdx,%r9,1)
	pop (%rdi, %r10,1)
	inc %r9
	inc %r10
	jmp loop


end:
	movb $0, (%rdi,%r10,1)
	mov %rdi, %rax
	ret
