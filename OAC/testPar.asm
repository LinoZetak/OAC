;Nombre : testPar.asm
;Proposito : determina si un numero es par o impar 
;Autor : Edwin Carrasco
;FCreacion : 23/06/2010
;FModif. : 11/09/2019
;compilar : nasm -f elf testPar.asm
;ld -m elf_i386 -s -o testPar testPar.o io.o  
;./testPar

%include "io.mac"

section .data

    msg: db "ESTE PROGRAMA DETERMINA SI UN NUMERO ES PAR",10 ,0
    nro: db "Ingrese el numero: ", 0
    msgPar: db "El numero es par", 0
    msgImpar: db "El numero es impar", 0,10


section .text
    global _start
_start:

    PutStr msg
    PutStr nro
    GetInt ax

    rcr ax, 1 ; Realiza una rotación hacia la derecha con acarreo en AX (equivalente a verificar el bit menos significativo) Si el bit menos significativo es 1, es impar; si es 0, es par.
    jc esImpar ; Si el bit de acarreo está activado (número impar),salta a la etiqueta `esImpar`Y tambien  Si se establece el "carry flag" (bandera de acarreo) después de la rotación, significa que el número es impar, y se salta a la etiqueta esImpar.

    ;es par
    PutStr msgPar
    jmp final

esImpar:
    PutStr msgImpar


final:
    nwln
    mov ax, 1
    int 80h