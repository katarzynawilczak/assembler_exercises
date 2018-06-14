#----------------------------------------------------------------
# Program lab_0a.s - Asemblery Laboratorium IS II rok
#----------------------------------------------------------------
#
#  To compile: as -o lab_0a.o lab_0a.s
#  To link:    ld -o lab_0a lab_0a.o
#  To run:     ./lab_0a
#
#----------------------------------------------------------------

	.data #zaczynaja sie dane
	
dummy:				# some data, dummy - etykieta = adres 
	.byte	0x00 #jeden bajt danych - rezerwacja w obszarze danych

	.text #zaczyna sie kod
	.global _start		# entry point, globalny - widoczny na zewnatrz
	
_start:
	JMP	_start #skok bezwarunkowy
