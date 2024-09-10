


;Nombre             :   Ejercicio4.asm
;Proposito          :   Escriba un programa que lea el año, mes y día de nacimiento de dos personas e indiquecuál de los dos es mayor. Asuma que no existen años bisiestos.
;Autor              :   Lino Zeynt Huaracallo Arenas
;FCreacion          :   25/08/2024
;FModific.          :   26/08/2024
;Compilar           :   nasm -f elf Ejercicio4.asm
;Enlazar            :   ld -m elf_i386 -s -o Ejercicio4 Ejercicio4.o io.o
;Ejecutar           :   ./Ejercicio4

%include "io.mac"


section .data
    Anio1: db "Ingrese el año de nacimiento de la primera persona: " ,0
    Anio2: db "Ingrese el año de nacimiento de la segunda persona: " ,0

    Mes1: db "Ingrese el mes de nacimiento de la primera persona: " ,0
    Mes2: db "Ingrese el mes de nacimiento de la segunda persona: " ,0

    Dia1: db "Ingrese el dia de nacimiento de la primera persona: " ,0
    Dia2: db "Ingrese el dia de nacimiento de la segunda persona: " ,0

    Primer: db "La primera persona es mayor",0
    Segun: db "La segunda persona es mayor",0
    Igual: db "Tienen la misma edad", 0


section .text
    global _start
_start:


    PutStr Anio1  ; Pedir el primer Año
    GetInt ax  ; Leer el primer Año en el registro AX 

    PutStr Anio2
    GetInt bx

    cmp ax, bx
    jb mPrimer
    ja mSegun


    ;Para Mes
    PutStr Mes1  
    GetInt ax   

    PutStr Mes2
    GetInt bx

    cmp ax, bx
    jb mPrimer
    ja mSegun


    ;Para DIa
    PutStr Dia1  
    GetInt ax   

    PutStr Dia2
    GetInt bx

    cmp ax,bx
    jb mPrimer
    ja mSegun

    PutStr Igual
    jmp final

mPrimer:
    PutStr Primer
    jmp final

mSegun:
    PutStr Segun


final:

    nwln       ; Nueva línea
    mov ax, 1  ; Colocar el valor 1 en AX (código de salida)
    int 80h 

