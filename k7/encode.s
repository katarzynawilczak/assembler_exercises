.data
	ex_loop_counter: .quad 0
	int_loop_counter: .quad 0
	dig: .quad 0
	maskbit: .quad 0

	.equ ascii_zero, '0'
	.equ ascii_nine, '9'

.text
.type encode, @function
.globl encode

encode:
	xor %r11, %r11
	xor %r12, %r12
	xor %r13, %r13
	xor %r14, %r14

	mov %rdi, %r11		#char*buf
	mov %esi, %r12d		#mask
	mov %edx, %r13d		#op
	mov %ecx, %r14d		#char

	mov %r11, %rsi
	mov %r11, %rdi

ext_loop:
	lodsb
	
	cmp $0, %al
	jnz not_end

	stosb
	jmp theend

not_end:
	cmp $'9', %al		#czy jest litera czy cyfra
	jbe digit

	jmp ext_loop_store	#jak litera to pomijam

digit:
	push %rax
	sub $ascii_zero, %al	#zamiana na ascii?
	mov %al, dig
	pop %rax
	
	push %r12
	push %rcx
	mov dig, %rcx		#rcx licznikiem petli?
	shr %cl, %r12
	pop %rcx
	and $1, %r12
	mov %r12, maskbit
	pop %r12

	jz ext_loop_store

operations:
	cmp $0, %r13
	jz nothing

	cmp $1, %r13
	jz delete

	cmp $2, %r13
	jz trans

	cmp $3, %r13
	jz change

nothing:
	jmp ext_loop_store

delete:
	jmp ext_loop_next

trans:
	push %rbx
	mov %rax, %rbx
	sub $ascii_zero, %rbx
	mov $ascii_nine, %rax
	sub %rbx, %rax
	pop %rbx
	jmp ext_loop_store
change:
	mov %r14b, %al
	jmp ext_loop_store

ext_loop_store:
	stosb

ext_loop_next:
	jmp ext_loop

theend:
	mov %r11, %rax
	ret
	
