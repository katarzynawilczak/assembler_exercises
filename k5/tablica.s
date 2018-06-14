.text
        .type suma, @function
        .global suma

suma:
        PUSH   %rbp
        MOVL    %esp, %ebp

        #zapisanie zmiennych lokalnych
        MOVL    $0, %eax
        PUSH   %rax                #suma przekatnej
        PUSH   %rax                #licznik petli

        MOVL    8(%ebp), %esi       #pobranie wsk na tablice

        #petla sumujaca wartosci
petla:
        #pobranie elementu
        MOVL    %esi, %edi          #zapisanie pozycji do "tablicy tablic"

        MOVL    (%esi), %ebx        #pobranie wskaznika na wiersz
        MOVL    $4, %eax
        MOVL    -8(%ebp), %ecx
        MUL     %ecx
        ADDL    %eax, %ebx          #wskaznik na konkretny element
        MOVL    %ebx, %esi
        MOVL    (%esi), %eax        #pobranie elementu z tablicy i zapisanie w EAX

        MOVL    %edi, %esi          #przywrocenie wskaznika do "tablicy tablic"
        ADDL    $4, %esi

        #zwiekszenie licznika
        MOVL    -8(%ebp), %ebx
        INCL    %ebx
        MOVL    %ebx, -8(%ebp)

        #dodanie do sumy
        MOVL    -4(%ebp), %ecx
        ADDL    %eax, %ecx
        MOVL    %ecx, -4(%ebp)

        #spr warunku zakonczenia
        MOVL    -8(%ebp), %edx
        MOVL    12(%ebp), %ecx
        CMPL    %ecx, %edx
        JE      koniec

        JMP     petla

koniec:
        MOVL    -4(%ebp), %eax          #zwrocenie wartosci
        MOVL    %ebp, %esp
        POP    %rbp
        RET
