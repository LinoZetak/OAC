;Nombre             :   SumaSimple.asm
;Proposito          :   Sumar 2 enteros
;Autor              :   Lino Huaracallo
;FCreacion          :   25/08/2024
;FModific.          :   26/08/2024
;Compilar           :   nasm -f elf SumaSimple.asm
;Enlazar            :   ld -m elf_i386 -s -o SumaSimple SumaSimple.o io.o
;Ejecutar           :   ./SumaSimple

%include "io.mac"

section .data 
    registroEAX: db "Contenido de EAX: ", 0, 10
    registroEBX: db "Contenido de EBX: ", 0, 10

section .text
    global _start
_start:
    mov eax, 60
    mov ebx, 25

    

    ;Mostrar datos iniciales
    PutStr registroEAX
    PutInt eax
    nwln

    PutStr registroEBX
    PutInt ebx
    nwln
    
    add eax, ebx
    
    PutStr registroEAX
    PutInt eax
    nwln
    
    mov ebx, 0
    mov eax, 1
    int 80h



    
    