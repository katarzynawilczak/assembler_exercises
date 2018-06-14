.data

.type encode, @function

.globl encode


.text

# char* buf     %rdi
# uint mask     %esi
# int op        %edx
# int c         %ecx
# return char*  %rax
encode:
  MOVL %ecx, %r11d
  CMPL $0, %edx
  JLE end
  CMPL $3, %edx
  JG end
  MOVQ $-1, %r8
loop:
  INCQ %r8	#wsk na bufor
  CMPB $0, (%rdi,%r8,1)	#jesli koniec stringa
  JE end
  CMPB $48, (%rdi,%r8,1)	#jesli nie jest cyfra (zakres ascii)
  JL loop			#to przesuwaj dalej
  CMPB $57, (%rdi,%r8,1)
  JG loop
  MOVL %esi, %eax		#jesli jest cyfra, przenies maske to eax
  MOVB (%rdi,%r8,1), %cl	#dana cyfre do cl
  SUBB $48, %cl			#odejmij 48 (zeby byla odp. dec w ascii)
  SHRL %cl, %eax		#przesun maske w lewo o ta liczbe
  ANDL $1, %eax			#and 1 z maska
  CMPL $0, %eax			#jesli 0 to pomin
  JE loop
  CMPL $1, %edx			#jesli 1 to wykonaj operacje edx
  JE op1
  CMPL $2, %edx
  JE op2
  JMP op3
op1:		#usun
  MOVQ %r8, %r9	#r8 wsk na stringa
loop2:	
  CMPB $0, (%rdi,%r9,1)	#jesli koniec stringa
  JE loop
  INCQ %r9	#jesli nie to zwieksz wskaznik
  MOVB (%rdi,%r9,1), %r10b	#przenies kolejny znak do 8 bit r10b
  DECQ %r9	#zmniejsz wskaznik
  MOVB %r10b, (%rdi,%r9,1)	#przesnies zapamietany znak w miejsce poprzedniego
  INCQ %r9	#zinkrementuj wsk
  JMP loop2	#wykonaj az do konca stringa

op2:		#transpozycja
  MOVB $48+9, %r10b	
  SUBB %cl, %r10b		#odejmij od 57 (9) ta liczbe
  MOVB %r10b, (%rdi,%r8,1)	#przenies ta liczbe na stare miejsce
  JMP loop			#powrot do petli
op3:				#zamien na znak
  MOVB %r11b, (%rdi,%r8,1)	#przenies znak na miejsce liczby
  JMP loop			#wroc do petli
end:
  MOVQ %rdi, %rax
ret
