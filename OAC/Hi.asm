section .data
	; Seccion de Variables

	msg db "HiWorld",0xA,0XD  ;msg -> etiqueta, db -> utilze 1 byte(8bits) para almacenar un solo dato de memoria
	 						  ; 
	len equ $ - msg           ;equ (Directiva) -> len constante, "$""(centinela) 


section .text
	global _start             ;Donde inicia el programa (Main)

_start:
	
	mov eax, 4                  ;(eax = 4) ->llamada al sistema (sys_write)

	mov ebx, 1                  ; stdout (Quiero escribir en la pantalla)

	mov ecx, msg                ;  msg pantalla -> escirbir la "variable" msg en pantalla

	mov edx, len                ;  longitud del mensaje (9bytes en este caso "HiWorld0xA0xD")
 
	int 0x80                    ;llamada al sistema 

	mov eax , 1                 ; exit
 
	int 0x80
