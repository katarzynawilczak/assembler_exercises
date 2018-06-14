	.type check_div, @function
	.global check_div

check_div: 		#arg:rdi,rsi,rdx
	cmp $0, %rdx #sprawdzenie c
	jnz no_zero
	mov %rdi, %rax
	idiv %rsi	#operacja: rax/rsi, wynik w rax, reszta w rdx
	mov %rdx, %rax
	cmp $0, %rax
	jnz change_to_one
	mov $1, %rax
	jmp end
change_to_one:
 	mov $0, %rax
	jmp end
no_zero:
	xor %rsi, %rsi	#zeruje niepotrzebne rejestry
	xor %rbx, %rbx	#wynik
	xor %rdx, %rdx 	#w rdx reszta
	xor %rcx, %rcx

	mov $1, %rsi	#dzielnik, bedzie inkrementowany
	mov $63, %cl	#o ile przesunac (64-1) w lewo
			#cl -dostep do mlod. bajta
loop:
	mov %rdi, %rax	#dzielna w rax
	idiv %rsi 	#wynik w rax, reszta w rdx
	cmp $0, %rdx
	jnz only_shift
	xor %r8, %r8	#pomocniczy rejestr r8
	add $1,%r8
	shl %cl, %r8	#przesun w lewo jedynke
	add %r8, %rbx 	#uaktualnij wynik
only_shift:
	xor %rdx, %rdx	#wyzeruj reszte
	dec %cl 	#zmniejsz liczbe przesuniec
	inc %rsi	#zwieksz dzielnik
	cmp $65, %rsi	#sprawdz czy juz koniec dzielenia
	jnz loop
end:
	mov %rbx, %rax
	ret
	
