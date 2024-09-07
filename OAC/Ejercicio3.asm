
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
    Yes : db "Se puede formar un triángulo?: Si" , 0 , 10
    No : db "Se puede formar un triángulo?: No" , 0 , 10


section .text
    global _start
_start:


    PutStr S1  ; Pedir el primer segmento
    GetInt ax  ; Leer el primer segmento en el registro AX 

    PutStr S2
    GetInt bx

    PutStr S3
    GetInt cx

    ; Econtrar el Segmento mayor

    cmp ax, bx  ;sólo afecta flags del registro de banderas


    ja mayorax

    cmp bx,cx

    ja mayorbx

    PutInt cx

    ;Suma de los dos segmentos menores
    add ax,bx

    cmp cx, ax

    ja siPuede

    PutStr No

    jmp final  


mayorax:
    cmp ax, cx
    ja mayoraxx


mayoraxx:
    PutInt ax
    jmp final 


    ;Suma de los dos segmentos menores
    add bx,cx

    cmp ax, bx

    ja siPuede

    PutStr No

    jmp final 




mayorbx:
    PutInt bx
    jmp final 

    ;Suma de los dos segmentos menores
    add ax,cx

    cmp bx, ax

    ja siPuede

    PutStr No

    jmp final

siPuede:
    PutStr Yes

final:
    nwln       ; Nueva línea
    mov ax, 1  ; Colocar el valor 1 en AX (código de salida)
    int 80h 













