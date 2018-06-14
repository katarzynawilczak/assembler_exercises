#----------------------------------------------------------------
# Program lab_2.s - Asemblery Laboratorium IS II rok
#----------------------------------------------------------------
#
#  To compile: as -o lab_2.o lab_2.s
#  To link:    ld -o lab_2 lab_2.o
#  To run:     ./lab_2
#OPERACJE NA LICZBACH I WYPISYWANIE W POSTACI 16NASTKOWEJ + WLASNA FUNKCJA
#----------------------------------------------------------------

	.equ	write_64, 1	#write data to file function
	.equ	exit_64, 60	#exit program function
	.equ	stdout, 1 	#handle to stdout

	.data
	
arg1txt:
	.ascii	"Arg1 = "
arg2txt:
	.ascii	"Arg2 = "
sumtxt:
	.ascii	"Sum  = "
difftxt:
	.ascii	"Diff = "
ortxt:
	.ascii	"OR   = "
andtxt:
	.ascii	"AND  = "
xortxt:
	.ascii	"XOR  = "
arg1:				#first argument argumenty 16nastkowo
	.byte	0xA0
arg2:				#second argument
	.byte	0x05
result:				#result, nie moze przekroczyc 255
	.byte	0
tmp:
	.byte	0
restxt:
	.ascii	"  \n"
txtlen:
	.quad	7 #potrzebne 8 bajtow .quad - bo wersja 64 bitowa
reslen:
	.quad	3
 
	.text
	.global _start
	
_start:
	NOP

	MOVB	arg1,%al
	MOV	$arg1txt,%rsi
	CALL	disp_line

	NOP

	MOVB	arg2,%al
	MOV	$arg2txt,%rsi
	CALL	disp_line

	NOP

	MOVB	arg1,%al
	ADDB	arg2,%al
	MOVB	%al,result
	MOV	$sumtxt,%rsi
	CALL	disp_line

	NOP

	MOVB	arg1,%al
	SUBB	arg2,%al
	MOVB	%al,result
	MOV	$difftxt,%rsi
	CALL	disp_line

	NOP

	MOVB	arg1,%al
	ORB	arg2,%al
	MOVB	%al,result
	MOV	$ortxt,%rsi
	CALL	disp_line

	NOP

	MOVB	arg1,%al
	ANDB	arg2,%al
	MOVB	%al,result
	MOV	$andtxt,%rsi
	CALL	disp_line

	NOP

	MOVB	arg1,%al
	XORB	arg2,%al
	MOVB	%al,result
	MOV	$xortxt,%rsi
	CALL	disp_line

	NOP

	MOV	$exit_64,%rax #zakonczenie programu
	XOR	%rdi,%rdi 
	SYSCALL

#----------------------------------------------------------------
# disp_line - displays line of text (prompt + hexadecimal number)
#----------------------------------------------------------------

	.type disp_line,@function

disp_line:
	MOVB	%al, tmp #zapamietaj w tmp wartosc początkową

	MOV	$write_64,%rax
	MOV	$stdout,%rdi
	MOV	txtlen,%rdx
	SYSCALL

	MOVB	tmp,%al #operacje na al
	ANDB	$0x0F,%al #tylko mlodsze bity
	CMPB	$10,%al 
	JB	digit1 #jezeli w al liczba mniejsza od 10 - jmp to digit1
	ADDB	$('A'-10),%al #jezeli wieksza lub rowna  +55
	JMP	insert1
digit1:
	ADDB	$'0',%al #+48
insert1:
	MOV	%al,%ah #do rej ah 
	NOP
	MOVB	tmp, %al #do al znowu wartosc początkowa
	SHR	$4,%al #przesuniecie bitow w al w prawo o 4
	CMPB	$10,%al
	JB	digit2
	ADDB	$('A'-10),%al #zamiast 10 moze byc 0x0A
	JMP	insert2
digit2:
	ADDB	$'0',%al
insert2:
	MOVW	%ax,restxt #ax to ah i al

	MOV	$write_64,%rax
	MOV	$stdout,%rdi
	MOV	$restxt,%rsi #wypisz cala liczbe
	MOV	reslen,%rdx
	SYSCALL

	RET
	
