	.type max_1_ind, @function
	.global max_1_ind

max_1_ind:		#arg: rdi, rsi-n, rdx, rcx
	mov $0, %r8	#rejestry pomocnicze: wsk na tablice,il parz, il uj
	mov $0, %r9
	mov $0, %r10

loop_neg:
	cmp %rsi, %r8 	#czy koniec petli
	je loop_even1
	cmp $0, (%rdi, %r8,8)	#8!!!
	jge not_neg
	inc %r10
not_neg:
	inc %r8
	jmp loop_neg

loop_even1:
	mov $0, %r8 #znowu wyzeruj wskaznik
loop_even:
	cmp %rsi, %r8			#czy koniec petli
	je end
	mov (%rdi, %r8,8), %r11	#rej.pomocniczy
	and $1, %r11		#nieparzyste maja zawsze 1 na koncu??
	cmp $0, %r11		#8!!!
	jnz not_even
	inc %r9
not_even:
	inc %r8
	jmp loop_even
end:
	mov %r9, %rax	#jak znalezc indeks max1 bin?
	ret
	
