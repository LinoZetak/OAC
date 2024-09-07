;Nombre : mostrarMayor.asm
;Proposito : muestra el mayor de dos numeros
;Autor : Lino Huaracallo
;FCreacion : 23/06/2010
;FModif. : 06/09/2024
;compilar : nasm -f elf mostrarMayor.asm
;ld -m elf_i386 -s -o mostrarMayor mostrarMayor.o io.o
;./mostrarMayor

%include "io.mac"

section .data
    mensaje: db "ESTE PROGRAMA MUESTRA EL MAYOR DE DOS NUMEROS",10,0

    nro1: db "Ingrese el primer número: ", 0
    nro2: db "Ingrese el segundo número: ", 0

    salida: db "El mayor es: ", 0, 10

section .text
    global _start
_start:

    PutStr mensaje

    PutStr nro1   ; Pedir el primer número
    GetInt ax     ; Leer el primer número en el registro AX 

    PutStr nro2
    GetInt bx

    
    cmp ax, bx   ;Comparar números
    js negativo  ; Si AX es menor que BX, saltar a la etiqueta "negativo"


    ;ax es mayor
    PutStr salida
    PutInt ax
    jmp final     ; Saltar a la etiqueta "final"

negativo:
    ;ax es el menof
    PutStr salida
    PutInt bx

final:
    nwln       ; Nueva línea
    mov ax, 1  ; Colocar el valor 1 en AX (código de salida)
    int 80h    ; Llamada al sistema para salir