#możliwe .equ w obszarze .data, np:

.data
...
...
.equ startlen, endtxt- starttxt
.equ endtxt, .- endtxt #adres pamieci w ktorej sie znajdujesz - adres przypisany do etykiety endtxt


#kazda litera tekstu - 1 bajt w stosie programu, ciag znakow - nieprzerwana tablica bajtow

#uzywanie dolarów:
MOV $1, %ebx #wprowadz zmienna 1 do rejestru ( 1 oznaczałoby adres)
MOV $start, %ecx #adres tekstu
MOV $start, %edx #numerkodu ASCII pierwszej litery tekstu
