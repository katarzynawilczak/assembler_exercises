#----------------------------------------------------------------
# Program lab_8.s - Asemblery Laboratorium IS II rok
#----------------------------------------------------------------
#
# To compile&link: gcc -no-pie -o lab_8b lab_8b.s
# To run:	./lab_8
#WYSWIETLENIE ARG. I ZM. SRODOWISKOWYCH, UZYCIE gcc DO ZLINKOWANIA I KOMPILACJI
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
	.global main #zmiana na main

main:

	mov %rdi, argc	#rejestry kolejne to wartosci dla zmiennych, l arg.
	mov %rsi, argv	#adres 1 arg
	mov %rdx, env	#adres 1 zm.srod.

	mov $argc_s,%rdi
	mov argc, %rsi
	mov $0, %al
	call printf		# display value of argc

	mov argv, %rbx
	mov argc, %r12		# get value of argc, licznik petli=l.arg.

next_argv:

	mov $args_s, %rdi	#wyswietlanie kolejnych argumentow
	mov (%rbx), %rsi	#adres lancucha znakow
	mov $0, %al
	call printf		# display value of argv[i]

	add $8,%rbx		# address of argv[i+1], kolejny arg.

	dec %r12		#zmniejsz licznik petli
	jnz next_argv

	mov $sep_s, %rdi	#wyswietlenie separatora
	mov $0, %al
	call printf		# display separator

	mov env, %rbx

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

