
;lea la longitud de tres segmentos y determine si estos pueden formar un triángulo.

;Nombre             :   Ejercicio3.asm
;Proposito          :   
;Autor              :   Lino Zeynt Huaracallo Arenas
;FCreacion          :   25/08/2024
;FModific.          :   26/08/2024
;Compilar           :   nasm -f elf Ejercicio3.asm
;Enlazar            :   ld -m elf_i386 -s -o Ejercicio3 Ejercicio3.o io.o
;Ejecutar           :   ./Ejercicio3


%include "io.mac"

section .data   
    S1 : db "Ingrese Primer Segmento: " ,0
    S2 : db "Ingrese Segundo Segmento: " ,0
    S3 : db "Ingrese Tercer Segmento: " ,0
    Yes : db "Se puede formar un triángulo?: Si" , 0 
    No : db "Se puede formar un triángulo?: No" , 0 


section .text
    global _start
_start:


    PutStr S1  ; Pedir el primer segmento
    GetInt ax  ; Leer el primer segmento en el registro AX 

    PutStr S2
    GetInt bx

    PutStr S3
    GetInt cx
    ;Sumar dos segmentos

    mov dx, ax ;preservar el valor de ax

    add dx, bx 

    cmp cx, dx
    jae noCumple

    ; SI S3 < S1 + S2

    mov dx , bx ; prservar el valor de bx

    add dx, cx
    cmp ax, dx
    jae noCumple

    ;Si  S1 < S2 + S3

    add ax, cx
    
    cmp bx, ax
    jae noCumple

    ;Si S2 < S1 + S3

    PutStr Yes
    jmp final



; Si algun segmento es mayor a la suma  de los otros dos segmentos
noCumple:
    PutStr No



final:
    nwln       ; Nueva línea
    mov ax, 1  ; Colocar el valor 1 en AX (código de salida)
    int 80h 













