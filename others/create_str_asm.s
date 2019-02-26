#tworzymy kolejne znaki  np:  dla 3,"A" wynik: "A,B,C" 
	.type create_str, @function
	.global create_str

 				#rdi, rsi, rdx - argumenty
				#rdx=(   | edx(32)  =(  |dx(16)= (dh | dl))) 
create_str:	
	mov %rdi, %rax 
label:  
	cmp $0,%rsi
	jbe koniec
	    
	mov %dl, (%rdi)		#przenosimy tam gdzie wskazuje rdi?
	inc %rdi		#zwiekszamy adres
	inc %rdx		#zwiekszamy znak
	dec %rsi		#zmiejszamy ile razy mial byc zapisany
	jmp label

koniec:
	movb $0, (%rdi)		#przeniesienie 0 na koniec tam gdzie wskuje rdi w buforze?
	ret
