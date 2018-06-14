#----------------------------------------------------------------
# Program lab_6d.s - Asemblery Laboratorium IS II rok
#----------------------------------------------------------------
#
#  To compile&link: gcc -o lab_6d lab_6d.s
#  To run: 	    ./lab_6d
#ANALOGICZNIE, ZWYKLA KOMPILACJA GCC, INNY KOD ZRODLOWY
#----------------------------------------------------------------

	.data
fmt:
	.asciz	 "Value = %ld\n"
value:
	.quad	15
	
	.text
	.global main
	
main:
	mov value(%rip), %rsi #rip - licznik rozkazow
	lea fmt(%rip), %rdi	#lea- wczytuje efektywny adres do rejestru?
	mov $0, %rax
	call *printf@GOTPCREL(%rip) #konieczne gdy kompilacja bez -no-pie

	mov $0,%rdi
	call *exit@GOTPCREL(%rip)
