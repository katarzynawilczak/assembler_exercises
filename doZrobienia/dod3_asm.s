#Przyjmuje 3 argumenty, zwraca sume

	.type sum3as, @function
	.global sum3as

 				#rdi, rsi, rdx - argumenty
sum3as:	
	mov %rdx, %rax
	add %rdi, %rax
	add %rsi, %rax

fin:	
	ret #zwracamy warość rax
