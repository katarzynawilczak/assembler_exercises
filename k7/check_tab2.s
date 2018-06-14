.data
	
wynik:
	.quad 0

.type check_tab,@function
.global check_tab

check_tab:


	PUSH %rbp
	MOV %rsp, %rbp
	MOVQ %rdi, -8(%rbp)
	MOVQ %rsi, -16(%rbp)
	MOVQ %rdx, -24(%rbp)

	MOVQ $(-2),%r8 #tutaj bedzie liczba z najwieksza iloscia powtorzen
	MOVQ $(-3),%r9 #ilosc tych powtorzen


	XOR %cl,%cl #zerujemy cl w ktorym bedzie nasz licznik głównej pętli 0-63


petla64:

	XOR %rax,%rax		#w rax bedzie ilość występowań
	MOVQ -16(%rbp),%rsi	#pobieramy dlugosc tablicy
	MOVQ -8(%rbp),%rdi	#pobieramy wskaznik na pierwszy element

zliczajwystepowanie: #pętla wewnętrzna przechodząca po wszystkich elementach i poównująca z aktualnym
	
	CMPB (%rdi),%cl
	JNZ nic_nie_rob


	INCQ %rax


nic_nie_rob:
	ADDQ $4, %rdi	#przesun wskaznik
	
	DECQ %rsi	#zmniejsz liczbe elementow
	CMPQ $0,%rsi	#czy juz koniec elementow
	JA zliczajwystepowanie #przegladamy wszystkie el w tablicy 


	#w rax mamy ile razy występuje ta liczba, w cl jaka to liczba

	CMP $0,%rax
	JZ niewystepuje

	MOVQ $1,%rbx		#przesuwamy itd
	SHL %cl,%rbx		

	ORQ %rbx,wynik		#ustawiam bit wystepowania

	CMP %r9,%rax		#sprawdzamy czy występuje więcej razy
	JL mniejsza_ilosc_powtorzen

	MOVQ %rax,%r9		#w r9 max liczba powtorzen
	MOVB %cl, %r8b		#wstaw do r8 ta liczbe


mniejsza_ilosc_powtorzen:

niewystepuje:

	INCB %cl
	CMPB $64,%cl		# wykorzystuje cl do zliczania, czy juz wszystkie liczby do 64
	JB petla64
	#koniec liczb:

	MOVQ -24(%rbp), %rdx	#czy to konieczne?
	MOVB $0,(%rdx)
	MOVSX %r8b,%eax
	MOV %rax,(%rdx)

	MOVQ wynik,%rax

	POP %rbp
RET
