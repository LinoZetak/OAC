;Nombre : division.asm
;Proposito : Divide dos enteros y muestra el cociente y elresiduo
;Autor : Lino Zeynt
;FCreacion : 8/07/2019
;FModific. : 26/08/2024
;Compilacion : nasm -f elf division.asm
;Enlace : ld -m elf_i386 -s -o division division.o io.o
;Ejecucion : ./division

%include "io.mac" ;

section .data
    mensaje: db "ESTE PROGRAMA CALCULA EL COCIENTE Y EL RESIDUO",10,0
    dividendo: db "Ingrese el dividendo: ",0
    divisor: db "Ingrese el divisor: ",0
    cociente: db "El cociente es: ",0
    residuo: db "El residuo es: ",0

section .text
    global _start
_start:

    ;Indicar que hace el programa
    PutStr mensaje
    ;Leer dividendo
    PutStr dividendo
    GetLInt eax
    ;Leer divisor
    PutStr divisor
    GetLInt ebx

    ;Procesar: Dividir
    div ebx ;Cociente en eax y residuo en edx
    
    ;Mostrar cociente
    PutStr cociente
    PutLInt eax
    nwln
    ;Mostrar residuo
    PutStr residuo
    PutLInt edx
    nwln

    ;terminar
    mov ebx, 0
    mov eax, 1
    int 80h