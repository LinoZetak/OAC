;Nombre    		:   Hola.asm
;Proposito 		:   muestra una cadena en Linux
;Autor     		:   Lino Huaracallo
;FCreacion      :   05/09/2023
;FModificacion  :   24/08/2024
;Compilar 		:	nasm -f elf Hola.asm
;Enlazar		:	ld -m elf_i386 -s Hola.o -o Hola
;Ejecutar		:	./Hola

section .data
	strHi: db "Ho", 10
	longHola: equ $-strHi

section .text
	global _start

_start:
	mov edx, longHola
	mov ecx, strHi
	mov ebx, 1
	mov eax, 4
	int 80h

	mov ebx, 0
	mov eax, 1
	int 80h