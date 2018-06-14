#najwieksza liczba  z trzech podanych
	.type greatest, @function
	.global greatest
greatest:		#argumenty w rdi, rsi, rdx
	mov %rdi, %rax
	cmp %rax, %rsi
	jbe rdi_g_rsi
	mov %rsi, %rax
rdi_g_rsi:
	cmp %rax, %rdx
	jbe max_g_rdx
	mov %rdx, %rax
max_g_rdx:
	ret
