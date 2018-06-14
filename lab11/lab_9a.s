#----------------------------------------------------------------
# Program lab_9a.s - Asemblery Laboratorium IS II rok
#----------------------------------------------------------------
#
#   to compile & link:  gcc -no-pie -lm -o lab_9a lab_9a.s
#   to run: 		./lab_9a
#ZMIENNOPRZECINKOWE LICZENIE PIERWIASTKA
#----------------------------------------------------------------

	.data
i:				# loop counter
	.long		1
x:				# function argument
	.double		0.0
y:
	.double		0.0	#trzy wyniki dla porownania
sqr_a:				# function result (x87), tylko dla zmiennoprzecinkowych liczy
	.double		0.0
sqr_b:				# function result (SSE)
	.double		0.0
sqr_c:				# function result (x87 software approximation)
	.double		0.0

two:				# constant
	.long		2
fmt_str:
	.asciz	"Square root of %lf = %.20lf\n"

	
	.text
	.global main
	
main:
	FINIT			# FPU initialization, inicjalizacja jednostki floating point (wyczyszczenie rej. ustaw. zaokraglen i dokładnosci)
next:
	FILDL	i		# i -> ST(0), zmiana i na liczbe zmprzec., ! arg- l. calowita(aby dobrze zinterpretowac), DL - pobieraja z pamieci lub tworza dana o okreslonej wartosci - rejestr zajety
	FSTPL	x		# ST(0) -> x & pop from stack
				#zapisz dane w pamieci, zwolnij rejestr,  L-double dla zmprzec, S - float 
	FLDL	x		# function argument -> ST(0), zczytuj wartosci x
	FSQRT			# sqrt( ST(0) ) -> ST(0), pierwiatek z wierzch stosu
	FSTPL	sqr_a		# ST(0) -> sqr_a  & pop from stack, zapisz w rejestrze, dla x87
				#------------------------------
	FLDL	sqr_a		# load & display first result
	FSTPL	y		#x-argument, y-wartosc pierwiastka
	CALL	disp		#jak printf
#dla SSE
	MOVSD	x, %xmm1	# function argument -> xmm1
	SQRTSD	%xmm1, %xmm0	# sqrt( xmm1 ) -> xmm0
	MOVSD	%xmm0, sqr_b	# xmm0 -> sqr_b, wynik, D-typ double, S-opracja na poj danej, P-pakiecie danychs

	MOVSD	%xmm0, y	# load & display second result
	CALL	disp
				#------------------------------
	FLDL	x		# first approximation (a0) -> ST(0)

iter:	FLDL	x		# function argument -> ST(0), ak in ST(1)
	FDIV	%ST(1), %ST(0)	# ST(0)/ST(1) -> ST(0)    x/ak
	FADD	%ST(1), %ST(0)	# ST(0)+ST(1) -> ST(0)    ak+x/ak
	FIDIVL	two		# ST(0)/two -> ST(0)      (ak+x/ak)/2
	FCOMI	%ST(1)		# ST(1) ? ST(0)           ak ? ak+1
	FSTP	%ST(1)		# ST(0) -> ST(1) & pop from stack
	JNZ	iter		# test of convergence

	FSTPL	sqr_c		# ST(0) -> sqr_b & pop from stack
				#------------------------------
	FLDL	sqr_c		# load & display second result
	FSTPL	y
	CALL	disp
				#------------------------------

	INCL	i		# next argument
	CMPL	$10, i		# enough ?
	JBE	next
				#------------------------------
	mov $0, %rdi		# the end
	CALL	exit
	

	.type	disp, @function	# printf( fmt_str, x, y )
disp:
	movq	x, %xmm0
	movq	y, %xmm1
	mov	$fmt_str, %rdi	# address of fmt_str, adres lancucha formatujacego
	mov $2, %al		#wykorzystanie dwoch rej zmiennoprzecink.
	CALL	printf
	RET

