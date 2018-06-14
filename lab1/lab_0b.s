#----------------------------------------------------------------
# Program lab_0b.s - Asemblery Laboratorium IS II rok
#----------------------------------------------------------------
#
#  To compile: as -o lab_0b.o lab_0b.s
#  To link:    ld -o lab_0b lab_0b.o
#  To run:     ./lab_0b
#
#----------------------------------------------------------------

	.data			#rozpoczęcie obszaru danych
	
dummy:				# some data
	.byte	0x00		#rezerwacja 1 bajta w obszarze danych

	.text			#rozpoczęcie kodu
	.global _start		# entry point
	
_start:
	MOV	$1, %eax	# exit function,  1 oznacza wyjscie (32 bit)
	INT	$0x80		# system interrupt, przerwanie
