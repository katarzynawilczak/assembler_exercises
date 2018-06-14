	.type generate_str, @function
	.global generate_str
generate_str:		#argumenty w rdi, rsi, rdx(w tym dl), rcx
	mov %rdi, %rax	#rdi - bufor
loop:
	cmp $0, %rsi
	jbe end
	mov %dl, (%rdi)	#przenies znak
	cmp $0, %rcx 	#czy inkrementacja
	je is_zero
	inc %rdx	#jak tak to zwieksz
is_zero:
	inc %rdi	#przesun wskaznik
	dec %rsi	#zmniejsz licznik petli
	jmp loop

end:
	movb $0, (%rdi)	
	ret
	
