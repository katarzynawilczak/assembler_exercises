#----------------------------------------------------------------
# Program lab_6c.s - Asemblery Laboratorium IS II rok
#----------------------------------------------------------------
#
#  To compile&link: gcc -no-pie -o lab_6c lab_6c.s
#  To run: 	    ./lab_6c
#PROGRAM W ASSEMBLERZE ALE TAK JAK W C, KOMPILACJA -NO-PIE
#----------------------------------------------------------------

	.data
fmt:
	.asciz	 "Value = %ld\n" #asciz!
value:
	.quad	15
	
	.text
	.global main
	
main:	#konieczna main a nie _start
	mov value, %rsi	#stos- najpierw wartosc pozniej napis
	mov $fmt, %rdi
	mov $0, %rax #nie bedzie szukac dodatkowych argumentow
	call printf

	mov $0,%rdi
	call exit
