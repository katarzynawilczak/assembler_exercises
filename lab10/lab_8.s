#----------------------------------------------------------------
# Program lab_8.s - Asemblery Laboratorium IS II rok
#----------------------------------------------------------------
#
# To compile:	as -o lab_8.o lab_8.s #nie zadziala bo zmiana punktu startowego na stosie
# To link:	ld -dynamic-linker /lib64/ld-linux-x86-64.so.2 -lc -o lab_8 lab_8.o
# To run:	./lab_8
#WYSWIETLENIE ARG. I ZM. SRODOWISKOWYCH, UZYCIE -dynamic-linker /lib64/ld-linux-x86-64.so.2 DO ZLINKOWANIA I KOMPILACJI
#----------------------------------------------------------------

	.data
argc_s:
	.asciz "argc = %d\n"
args_s:
	.asciz "%s\n"
sep_s:
	.asciz "----------------------------\n"
argc:			#adresy argumentow rózniace sie o 8
	.quad 0
argv:
	.quad 0
env:
	.quad 0


	.text
	.global _start

_start:

	mov (%rsp), %rax	# argc is here, liczba arg. wierzchokiem stosu
	mov %rax, argc		# store value of argc

	mov $argc_s,%rdi
	mov argc, %rsi
	mov $0, %al		#niejaswny arg. w al, ma wyswietlicz liczby calk i wskazniki
	call printf		# display value of argc

	mov %rsp, %rbx		# use rbx as a pointer, wskazuje na argc
	add $8, %rbx		# argv[] is here, +8 - adres pierwszego arg
	mov %rbx, argv		# store address of argv[], zapamietanie

	mov argc, %r12		# get value of argc, licznik petli=l.arg.

next_argv:

	mov $args_s, %rdi	#wyswietlanie kolejnych argumentow
	mov (%rbx), %rsi
	mov $0, %al
	call printf		# display value of argv[i]

	add $8,%rbx		# address of argv[i+1], kolejny arg.

	dec %r12		#zmniejsz licznik petli
	jnz next_argv

	mov $sep_s, %rdi	#wyswietlenie separatora
	mov $0, %al
	call printf		# display separator

	add $8, %rbx		# env[] is here - skip zero/NULL, adres zm.srod.
	mov %rbx, env		# store address of env[]

next_env:

	cmp $0,(%rbx)		# is env[i] == NULL, czy jest jakas zmienna srod.
	je finish		# yes

	mov $args_s, %rdi	#string
	mov (%rbx), %rsi	# no
	mov $0, %al
	call printf		# displays value of env[i]

	add $8,%rbx		# address of env[i+1], kolejna zmienna
	jmp next_env

finish:
	mov $0,%rdi		# this is the end...
	call exit

