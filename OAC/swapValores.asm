;Nombre             :   swapValores.asm
;Proposito          :   intercambie el contenido de dos registros
;Autor              :   Lino Huaracallo
;FCreacion          :   25/08/2024
;FModific.          :   26/08/2024
;Compilar           :   nasm -f elf swapValores.asm
;Enlazar            :   ld -m elf_i386 -s -o swapValores swapValores.o io.o ; DEPENDE SI SE TRABAJA CON 32 O 16 BITS(tmb se cambia el io.mac)
;Ejecutar           :   ./swapValores

%include "io.mac" ; libreria de macros de entrada/salida

section .data
    estadoAX: db "contenido de AX: ",0,10
    estadoDX: db "contenido de DX: ",0,10

section .text
    global _start

_start:
mov ax, 12 ; 0000 0000 0000 1110 -> ax=12
mov dx, 7 ; 0000 0000 0000 0111 -> dx=7

PutStr estadoAX
PutInt ax
nwln

PutStr estadoDX
PutInt dx
nwln

xor ax, dx ; 0000 0000 0000 1001 -> ax=9
xor dx, ax ; 0000 0000 0000 1110 -> dx=12
xor ax, dx ; 0000 0000 0000 0111 -> ax=7


PutStr estadoAX
PutInt ax
nwln

PutStr estadoDX
PutInt dx
nwln

;volver al sistema
mov bx, 0
mov ax, 1 ; salir del programa
int 80h