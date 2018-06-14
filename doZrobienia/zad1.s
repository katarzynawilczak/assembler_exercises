#Jako argumenty przyjmuje 3 liczby, zwraca najmniejsza

	.type mina, @function
	.global mina

mina:   mov %rdi, %rax	#argumenty w rejestrach rdi, rsi, rdx, wynik w rax
	cmp %rax, %rsi	#porownaj pierwszy argument z drugim
	jge rsi_ge_rdi	#jesli drugi wiekszy badz rowny od pierwszego to skacz
	mov %rsi, %rax	#jesli nie, to przenies drugi do rax
rsi_ge_rdi: #drugi wiekszy badz rowny pierwszemu
	cmp %rax,%rdx	#porownaj piewszy (lub drugi) z trzecim
	jge rdx_ge_min	#trzeci wiekszy to skacz
	mov %rdx, %rax	#jesli nie to trzeci najmniejszy
rdx_ge_min: ret		#powroc
