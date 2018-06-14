#----------------------------------------------------------------
# Program lab_1.s - Asemblery Laboratorium IS II rok
#----------------------------------------------------------------
#
#  To compile: as -o lab_1.o lab_1.s
#  To link:    ld -o lab_1 lab_1.o
#  To run:     ./lab_1
#FORMATY I OPERACJE NA LICZBACH
#----------------------------------------------------------------

	.equ	write_64, 1	# write data to file function (64bit)
	.equ	exit_64, 60	# exit program function (64bit)
	.equ	stdout, 0x01	# handle to stdout

	.data
	
starttxt:			# first message
	.ascii	"Start\n"
endtxt:				# second message
	.ascii	"Finish\n"
arg1:				# first argument 8 bit
	.byte		1
arg2:				# second argument 16 bit
	.word		2
arg3:				# third argument 32 bit
	.long		3
result:				# result
	.long		0	

	.equ	startlen, endtxt - starttxt
	.equ	endlen, arg1 - endtxt #zmienne ustawiane po kolei
 
	.text
	.global _start
	
_start:
	MOV	$write_64,%rax
	MOVQ	$stdout,%rdi
	MOV	$starttxt,%rsi
	MOVQ	$startlen,%rdx
	SYSCALL #wyswietlnie f.systemowej dla 64 bit (INT 0x80 dla 32bit)

	NOP
#czyszczenie rej: SUB %eax,%eax | XOR %eax, %eax | MOVL $0, %eax
	XOR	%eax, %eax
	XOR	%ebx,%ebx
	MOV	arg1,%eax #arg1 i arg2 nie zajmuja całego rejestru 32 bit
	MOV	arg2,%ebx
	MOVL	arg3,%ecx
	ADD	%ebx,%eax #eax=eax+ebx
	SUB	%ecx,%eax #eax=eax-ecx
	MOVL	%eax,result

	NOP

	MOV	$write_64,%rax
	MOVQ	$stdout,%rdi
	MOV	$endtxt,%rsi
	MOVQ	$endlen,%rdx
	SYSCALL

	NOP

theend:
	MOV	$exit_64,%rax 
	MOV	result, %rdi #wynik jako kod zakonczenia programu
	SYSCALL

#kompilacja z opcja -gstabs, uruchomienie gdb program, "run" w gdb
