;Nombre             :   Ejercicio1.asm
;Proposito          :   El valor de "X" en la siguiente expresion: X = [(A + B) / (C – D)] + E
;Autor              :   Lino Zeynt Huaracallo Arenas
;FCreacion          :   25/08/2024
;FModific.          :   26/08/2024
;Compilar           :   nasm -f elf Ejercicio1.asm
;Enlazar            :   ld -m elf_i386 -s -o Ejercicio1 Ejercicio1.o io.o
;Ejecutar           :   ./Ejercicio1

%include "io.mac"

section .data
    mensaje: db "ESTE PROGRAMA CALCULA EL VALOR DE X",10,0
    A : db "Ingrese A: ",0
    B : db "Ingrese B: ",0
    C : db "Ingrese C: ",0
    D : db "Ingrese D: ",0
    E : db "Ingrese E: ",0
    X : db "El valro de X es: ",0


section .text
    global _start
_start:

    ;Indicar que hace el programa

    PutStr mensaje
    
    ;Leer A
    PutStr A
    GetLInt eax 

    ;Leer B
    PutStr B
    GetLInt ebx

    ;Procesar:

    add eax, ebx

    ;Leer C
    PutStr C
    GetLInt ebx 

    ;Leer D
    PutStr D
    GetLInt ecx

    sub ebx, ecx

    div ebx ;Cociente en eax y residuo en edx
    ;Mostrar cociente

    ;Leer E
    PutStr E
    GetLInt ebx

    add eax, ebx



    PutStr X
    PutLInt eax
    nwln
    

    ;terminar
    mov ebx, 0
    mov eax, 1
    int 80h
