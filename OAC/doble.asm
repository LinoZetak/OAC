;Nombre             :   doble
;Proposito          :   Muestra el doble de un numero entero
;Autor              :   Lino Huaracallo
;FCreacion          :   18/07/2019
;FModific.          :   26/08/2024
;Compilar           :   nasm -f elf doble.asm
;Enlazar            :   ld -m elf_i386 io.o doble.o -o doble
;Ejecutar           :   ./doble

%include "io.mac"

section .data 
    strProposito: db "ESTE PROGRMA CALCULA EL DOBLE DE UN ENTERO NATURAL", 10,0
    strLeerEntero: db 9, "INgrese un entero natural menor a 16384: ",0
    strMsgSalida1: db 9, "EL doble de ", 0
    strMsgSalida2: db " es: ",0

section .text
    global _start
_start:
    PutStr strProposito     ;Proposito del programa
    PutStr strLeerEntero    ;pedir datos de entrada
    GetInt ax               ;Leer Datos

    ;Procesar
    mov bx, ax ;bx <-- ax
    add ax, bx ;ax <-- ax + bx

    ;Mostrar Resultado
    PutStr strMsgSalida1
    PutInt bx
    PutStr strMsgSalida2
    PutInt ax
    nwln            ;Imprimir Linea

    mov ebx, 0
    mov ax, 1       ;Salir del programa
    int 80h
    