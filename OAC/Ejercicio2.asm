;Nombre             :   Ejercicio2.asm
;Proposito          :   multiplique dos números enteros ingresados por el usuario; lereste 10 al resultado, luego divida este valor entre 15,
                    ;   le reste al cociente 2 y le sume al resto 8; sume los dos valores y aplíquele la operación lógica OR con la máscara 0x00FE.
                      
;Autor              :   Lino Zeynt Huaracallo Arenas
;FCreacion          :   25/08/2024
;FModific.          :   26/08/2024
;Compilar           :   nasm -f elf Ejercicio2.asm
;Enlazar            :   ld -m elf_i386 -s -o Ejercicio2 Ejercicio2.o io.o
;Ejecutar           :   ./Ejercicio2

%include "io.mac"

section .data

    A: db "Ingrese primer numero entero: ",0
    B: db "Ingrese segundo numero entero: ",0

    Final: db"Resultado: ",0 


section .text
    global _start
_start:



    PutStr A
    GetLInt eax

    PutStr B
    GetLInt ebx

    ;Producto de A y B

    mul ebx


    ;Restar 10
    sub eax,10


    mov ebx, 15 ;ebx ahora contiene el valor 15

    ;Dividir
    div ebx ;Cociente en eax y residuo en edx


    ;modificar el cociente y resto oficial

    ;sub eax, 2
    ;add edx, 8

    ;modificar el cociente y resto segun el ejemplo
   
    sub eax, 2

    add edx , 3 

    ;Suma de cociente y resto

    add eax, edx

    ;La Suma es 13

    ;OR

    OR eax, 0x00FE

    PutStr Final
    PutLInt eax
    nwln

    ;terminar
    mov ebx, 0
    mov eax, 1
    int 80h


