#1. Pobiera jeden argument, liczy sume z mniejszymi az do 0

	.type sumas, @function
	.global sumas
sumas:
	mov %rdi, %rax
loop:
	cmp $0, %rdi
	jbe is_zero
	dec %rdi
	add %rdi, %rax
	jmp loop

is_zero:
	ret
