	.type max_ind, @function
	.global max_ind

max_ind:		#arg: rdi,rsi,rdx,rcx
	mov $1, %rbx  	#rejestr pomocniczy przechowujacy indeks	
	mov %rdi, %rax
	cmp %rsi, %rax
	jge niezam1
	mov %rsi, %rax
	mov $2, %rbx
niezam1:
	cmp %rdx, %rax
	jge niezam2
	mov %rdx, %rax
	mov $3, %rbx
niezam2:
	cmp %rcx, %rax
	jge cmp_rest
	mov %rcx, %rax
	mov $4, %rbx
	#najwiekszy w %rax, indeks w rbx
cmp_rest:		#sprawdzenie czy ktorys równy
	cmp %rdi, %rax
	je rdi_e
	jmp cmp_rest1
rdi_e:
	cmp $1, %rbx
	jne ret_0
cmp_rest1:
	cmp %rsi, %rax
	je rsi_e
	jmp cmp_rest3
rsi_e:
	cmp $2, %rbx
	jne ret_0
cmp_rest3:
	cmp %rdx, %rax
	je rdx_e
	jmp cmp_rest4
rdx_e:
	cmp $3, %rbx
	jne ret_0
cmp_rest4:
	cmp %rcx, %rax
	je rcx_e
	jmp end
rcx_e:
	cmp $4, %rbx
	jne ret_0
	jmp end

ret_0:
	mov $0,%rbx
end:
	mov %rbx, %rax
	ret
