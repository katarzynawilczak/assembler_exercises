  
  
	.text
	.type binary_op,@function
	.globl binary_op

# rdi - result, rsi - 1, rdx - 2, ecx - n
binary_op:
	mov	%rdi, %rax	# rdi bede przesuwac, wiec od razu zapamietuje wskaznik w rax
	push	%r8		# przechowanie dotychczasowej wartosci na wszelki wypadek
	push	%r9
	xor	%r8, %r8	# arg1
	xor	%r9, %r9	# arg2
write_tmp1:			# konwersja stringa z arg1 na liczbe w r8
	cmpb	$0, (%rsi)	# czy jest koniec stringa?
	je	write_tmp2
	shl	$1, %r8		# przesuwamy dotychczasowa wartosc w lewo bo czytamy coraz mlodsze bity
	cmpb	$'0', (%rsi)	
	je	write1_continue	# zostawiamy bit 0, czytamy kolejny znak
	inc	%r8		# znak to '1', czyli najmlodszy przeczytany bit to 1
write1_continue:
	inc	%rsi
	jmp	write_tmp1
write_tmp2:			# to samo dla arg2 -> r9
	cmpb	$0, (%rdx)
	je	count
	shl	$1, %r9
	cmpb	$'0', (%rdx)
	je	write2_continue
	inc	%r9
write2_continue:
	inc	%rdx
	jmp	write_tmp2
count:				# sprawdzamy jaka ma byc operacja i liczymy
	cmpl	$0, %ecx
	je	op_add
	cmpl	$1, %ecx
	je	op_and
	cmpl	$2, %ecx
	je	op_or
	xor	%r9, %r8	# zakladam, ze jedyna pozostala mozliwa wartosc to 3
	jmp	write_str
op_add:
	add	%r9, %r8
	jmp	write_str
op_and:
	and	%r9, %r8
	jmp	write_str
op_or:
	or	%r9, %r8
	jmp	write_str
write_str:			# przepisanie wartosci z r8 do stringa
	mov	$1, %rcx
	shl	$63, %rcx	# ustawiam maske na 1000...0
write_ch:			# sprawdzam wartosci kolejnych bitow w liczbie od najstarszego
	test	%rcx, %r8	
	jz	write_0		# jesli bit ustawiony to dopisuje '1', jak nie to '0'
	movb	$'1', (%rdi)
	jmp	next_char
write_0:
	movb	$'0', (%rdi)
next_char:
	inc	%rdi
	shr	$1, %rcx	# po sprawdzeniu wszystkich bitow rcx = 0
	jnz	write_ch
	jmp	finish
finish:
	movb	$0, (%rdi)	# znak konca napisu
	pop	%r9
	pop	%r8
	ret
