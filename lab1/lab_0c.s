#----------------------------------------------------------------
# Program lab_0c.s - Asemblery Laboratorium IS II rok
#----------------------------------------------------------------
#
#  To compile: as -o lab_0c.o lab_0c.s
#  To link:    ld -o lab_0c lab_0c.o
#  To run:     ./lab_0c
#WYPISYWANIE NA EKRAN, DLUGOSCI CIAGOW ZNAKOW
#----------------------------------------------------------------
#dyrektywy - tworzenie stałych,przypisanie odpowiedniej wartosci (wszystkie 32 bit):
	.equ	kernel,0x80	#Linux system functions entry
	.equ	write,0x04	#write data to file function
	.equ	exit,0x01	#exit program function

	.data
	#etykiety:
starttxt:			#first message
	.ascii	"Start\n"
endtxt:				#last message
	.ascii	"Finish\n"
gurutxt:
	.ascii	"A jem assembler guru\n"	#other message

	.text
	.global _start  #waznie aby _start byl global- widoczny na zewnatrz
	
_start:
	MOVL	$write,%eax	#write first message
	MOVL	$1,%ebx		#eax - adres operacji, , ebx - stdout 1, exc - tekst, edx - dlugosc tekstu
	MOVL	$starttxt,%ecx
	MOVL	$6,%edx
	INT	$kernel		#przerwanie procesora na adres systemu aby wywołac funkcje

	NOP			#odczekanie

	MOVL	$write,%eax	#write other message
	MOVL	$1,%ebx
	MOVL	$gurutxt,%ecx
	MOVL	$21,%edx
	INT	$kernel

	NOP #odczekanie jednobajtowej operacji nic nie robiacej

	MOVL	$write,%eax	#write last message
	MOVL	$1,%ebx
	MOVL	$endtxt,%ecx
	MOVL	$7, %edx
	INT	$kernel

	NOP

theend:
	MOVL	$exit,%eax	#exit program
	INT	$kernel
