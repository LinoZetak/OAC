
;Nombre             :   Practica1.asm
;Proposito          :   El valor de "X" en la siguiente expresion: X = [(A + B) / (C – D)] + E
;Autor              :   Lino Zeynt Huaracallo Arenas
;FCreacion          :   25/08/2024
;FModific.          :   26/08/2024
;Compilar           :   nasm -f elf Practica1.asm
;Enlazar            :   ld -m elf_i386 -s -o Practica1 Practica1.o io.o
;Ejecutar           :   ./Practica1

%include "io.mac"

section .data
    mensaje: db "ESTE PROGRAMA CALCULA EL VALOR DE X",10,0
    A : db "Ingrese A: ",0
    B : db "Ingrese B: ",0
    C : db "Ingrese C: ",0
    D : db "Ingrese D: ",0
    E : db "Ingrese E: ",0

     X : db "El valor de X es: ",0


section .text
    global _start
_start:

    ;ndicar que hace el programa

    PutStr mensaje
    
    ;Leer A
    PutStr A
    GetLInt eax 

    ;Leer B
    PutStr B
    GetLInt ebx

    ;Multiplicacion:

    mul ebx


    ;Leer C
    PutStr C
    GetLInt ebx

    ;Leer D
    PutStr D
    GetLInt ecx

    sub ebx, ecx

     

    mov ecx, eax ;almacenar suma
    mov eax, ebx ;alamacenar resta

    PutStr E
    GetLInt ebx

    div ebx

    sub ecx, eax


    PutStr X
    PutLInt ecx
    nwln

    
    

    ;terminar
    mov ebx, 0
    mov eax, 1
    int 80h

