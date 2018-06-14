#----------------------------------------------------------------
# Program LAB_5.S - Asemblery Laboratorium IS II rok
#----------------------------------------------------------------
#
#  To compile: as -o lab_5.o lab_5.s
#  To link:    ld -o lab_5 lab_5.o
#  To run:     ./lab_5
#CZYTANIE Z KLAWIATURY, ZAMIANA LITER, CYFR
#----------------------------------------------------------------


.equ	read_64,	0x00	# read data from file function
.equ	write_64,	0x01	# write data to file function
.equ	exit_64,	0x3C	# exit program function

.equ	tooval,	-1
.equ	errval,	-2
.equ	stdin,	0
.equ	stdout, 1
.equ	stderr, 2

	.data
	
buffer:			# buffer for file data
	.space		1024, 0
bufsize:		# size of buffer
	.quad		( . - buffer )
b_read:			# size of read data
	.quad		0
errmsg:			# file error message
	.ascii	"File error!\n"
errlen:
	.quad		( . - errmsg )
toomsg:			# file too big error message
	.ascii	"File too big!\n"
toolen:
	.quad		( . - toomsg ) 
promptmsg:
	.ascii	"String: "
promptlen:
	.quad		( . - promptmsg ) 
befmsg:
	.ascii	"Before:\n"
beflen:
	.quad		( . - befmsg ) 
aftmsg:
	.ascii	"After:\n"
aftflen:
	.quad		( . - aftmsg ) 

	.text
	.global _start
	
_start:
	NOP

	MOV	$write_64,%rax	# write function
	MOV	$stdout,%rdi	# file handle in RDI
	MOV	$promptmsg,%rsi	# RSI points to message
	MOV	promptlen,%rdx	# bytes to be written
	SYSCALL
	
	MOV	$read_64,%rax	# read function
	MOV	$stdin,%rdi	# file handle in RDI
	MOV	$buffer,%rsi	# RSI points to data buffer
	MOV	bufsize,%rdx	# bytes to be read
	SYSCALL

	CMP	$0,%rax
	JL	error		# if RAX<0 then something went wrong

	MOV	%rax,b_read	# store count of read bytes

	CMP	bufsize,%rax	# whole file was read ?
	JE	toobig		# probably not

	MOV	$write_64,%rax	# write function
	MOV	$stdout,%rdi	# file handle in RDI
	MOV	$befmsg,%rsi	# RSI points to message
	MOV	beflen,%rdx	# bytes to be written
	SYSCALL

	MOV	$write_64,%rax	# write function
	MOV	$stdout,%rdi	# file handle in RDI
	MOV	$buffer,%rsi	# offset to first character
	MOV	b_read,%rdx	# count of characters
	SYSCALL

	MOV	$buffer,%rsi
	MOV	%rsi,%rdi
	MOV	b_read,%rcx
	CLD #zmiana flagi kierunku na 0(0-dodwanie, 1-odejmujemy), STD - zmiana znacznika na 1?,


next:
	LODSB			# al := MEM[ rsi ]; rsi++, pobiera bajt z bufora, umieszcza w al

	#zamiana cyfr na #
	CMPB	$'0', %al
	JB skip
	CMPB	$'9', %al
	JBE digit 

	#zamiana cyfr dużych na małe i malych na duże
	CMPB	$'A', %al
	JB skip
	CMPB	$'z', %al
	JA skip

	CMPB	$'Z', %al
	JBE	change
	CMPB	$'a', %al
	JB	skip

	JMP	change

change: 
	XOR	$0x20, %al		#zamiana na duze i male za pomoca 5 bitu
	#SUB $32, %al	#zamiana na duze
	#AND $0xdf, %al	#zamiana na duze, DF = 01111, zerowanie 5 bita
	#ADD	$32, %al #zamiana na male
	#OR	$0x20, %al #zamiana na małe, 0x20 = 10000
	JMP skip


digit:
	MOVB $'#', %al

skip:	STOSB			# MEM[ rdi ] := al; rdi++, z powrotem do bufora
	LOOP next

	MOV	$write_64,%rax	# write function
	MOV	$stdout,%rdi	# file handle in RDI
	MOV	$aftmsg,%rsi	# RSI points to message
	MOV	aftflen,%rdx	# bytes to be written
	SYSCALL

	MOV	$write_64,%rax	# write function
	MOV	$stdout,%rdi	# file handle in RDI
	MOV	$buffer,%rsi	# offset to first character
	MOV	b_read,%rdx	# count of characters
	SYSCALL

	MOV	b_read,%rdi
	JMP	theend

toobig:
	MOV	$write_64,%rax	# write function
	MOV	$stderr,%rdi	# file handle in RDI
	MOV	$toomsg,%rsi	# RSI points to toobig message
	MOV	toolen,%rdx	# bytes to be written
	SYSCALL
	MOV	$tooval,%rdi
	JMP	theend

error:
	MOV	$write_64,%rax	# write function
	MOV	$stderr,%rdi	# file handle in RDI
	MOV	$errmsg,%rsi	# RSI points to file error message
	MOV	errlen,%rdx	# bytes to be written
	SYSCALL
	MOV	$errval,%rdi

theend:
	MOV	$exit_64,%rax	# exit program function
	SYSCALL
