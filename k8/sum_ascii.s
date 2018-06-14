	.type sum_ascii, @function
	.globl sum_ascii
sum_ascii:
	push %rcx
	mov $0, %r9 #wsk na str
	mov $0, %r10
	mov $0, %r11 #liczba zsumowan
	mov $0, %rax #suma w rax
	
	#arg: rdi-str, rsi-a, rdx-b, rcx-charset, r8-count
loop_a:
	mov (%rdi,%r9,1), %r10b
	cmp %r9, %rsi
	jg incr_a
	jmp check_charset
check_charset: 
	cmp $0, %rcx
	je op0
	cmp $1, %rcx
	je op1
	cmp $2, %rcx
	je op2
	cmp $3, %rcx
	je op3
	cmp $4, %rcx
	je op4
	jmp end
op0:
	add %r10, %rax
	inc %r11
	jmp incr_a
op1:
	cmp $48, %r10
	jb incr_a
	cmp $57, %r10
	ja incr_a
	add %r10, %rax
	inc %r11
	jmp incr_a
	
op2:
	cmp $65, %r10
	jb incr_a
	cmp $90, %r10
	ja incr_a
	add %r10, %rax
	inc %r11
	jmp incr_a
op3:
	cmp $97, %r10
	jb incr_a
	cmp $122, %r10
	ja incr_a
	add %r10, %rax
	inc %r11
	jmp incr_a
op4:
	cmp $65, %r10
	jb incr_a
	cmp $122, %r10
	ja incr_a
	cmp $90, %r10
	jbe add
	cmp $97, %r10
	jae add
	jmp incr_a
	
add:
	add %r10, %rax
	inc %r11
	jmp incr_a

incr_a:
	cmp %r9, %rdx
	je end
	cmp $0, (%rdi)	#koniec stringu, b poza stringiem
	je end
	inc %r9
	jmp loop_a	
end:
	mov %r11, (%r8)
	pop %rcx
	ret

	
