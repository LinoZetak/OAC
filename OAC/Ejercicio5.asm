;Nombre             :   Ejercicio5.asm
;Proposito          :   determine las retenciones en exceso o deuda
;Autor              :   Lino Zeynt Huaracallo Arenas
;FCreacion          :   25/08/2024
;FModific.          :   26/08/2024
;Compilar           :   nasm -f elf Ejercicio5.asm
;Enlazar            :   ld -m elf_i386 -s -o Ejercicio5 Ejercicio5.o io.o
;Ejecutar           :   ./Ejercicio5


%include "io.mac"

section .data
    msgProposito db "ESTE PROGRAMA DETERMINA LAS RETENCIONES DE EXCESO Y DEUDA",10,0

    msgRem db "Remuneraciones: ",10,0

    msgRemGobReg db "Ingrese sueldo en Gobierno Regional: ",0

    msgRemMinsa db "Ingrese sueldo en el MINSA: ", 0

    msgTotalRem db "El total de Remuneraciones es: ", 0,10
    nwln

    msgUniImposv db "Ingrese la Unidad Impositiva: ", 0

    msgNoAfecto7 db "No afecto 7 UIT: ", 0

    msgRentaNeta db "Renta Neta: ", 0

    msgTotalImp db "EL total del impuesto es: ", 0







    valorTemp dd 0   ; Declarar una variable de 32 bits
    valorTemp2 dd 0   ; Declarar una variable de 32 bits

    Punto db ".",0



section .text
global _start
_start:

    PutStr msgProposito
    PutStr msgRem

    ;Total de Remuneraciones

    PutStr msgRemGobReg
    GetLInt eax ; 12345

    PutStr msgRemMinsa
    GetLInt ebx ;67890

    add eax , ebx ;eax = 80235

    ;Total Remuneraciones
    PutStr msgTotalRem
    PutLInt eax ;80235
    mov ecx, eax ; exc = 80235
    nwln


    ;Unidad Impositiva
    PutStr msgUniImposv
    GetLInt eax ; 4300


    mov [valorTemp], eax ; edx y eax = 4300
    nwln

    mov ebx,7
    mul ebx ;eax = 30100, ebx= 7 , exc = 80235 edx = 0 

    mov edx, [valorTemp]
    PutStr msgNoAfecto7
    PutLInt eax ; eax = 30100, ebx= 7 , edx = 4300 , exc = 80235 [valorTemp]= 4300
    nwln

    sub ecx, eax

    PutStr msgRentaNeta
    PutLInt ecx ; eax = 30100, ebx= 7 , edx = 4300 , exc = 50135 [valorTemp]= 4300
    nwln




    ;Impuesto

    mov eax, 5 ; eax = 5, ebx= 7 , edx = 4300 , exc = 50135 [valorTemp]= 4300

    mul edx

    mov edx , [valorTemp]; eax = 215000 , ebx= 7 , ecx = 50135 , edx = 4300  [valorTemp]= 4300
    cmp ecx, eax


    jb UIT5

    sub ecx , eax ; eax= 21500 ,  ebx= 0.08 , edx = 4300 , ecx = 28635 valorTemp]= 4300
    mov ebx, 8 ; multiplicamos al 0.08 x 100( ya que no se puede manejar directamente numeros reales), al final devidiremos entre 100 y listo

    
    mul ebx ; eax= 1720(00) ,  ebx= 8 , edx = 4300 , ecx = 28635 [valorTemp]= 4300

    mov edx, [valorTemp]

    mov ebx , 20   ; eax= 1720(00) ,  ebx= 20 , edx = 4300 , ecx = 28635 [valorTemp]= 4300

    mov [valorTemp2] , eax ; ; eax= 1720(00) ,  ebx= 20 , edx = 4300, ecx = 28635 [valorTemp]= 4300  [valorTemp2] = 1720(00)  
    
    mov eax, edx

    mul ebx ; eax = 86000   ebx = 20 ecx = 28635 edx = 0  [ValorTemp]= 4300 valorTemp2] = 1720(00)

    cmp ecx, eax

    jb UIT20








;si ecx < 21500
UIT5:           ; eax = 215000 , ebx= 7 , edx = 4300 , ecx = 50135
    mov eax, ecx
    mov ebx, 8
    mul ebx
    PutStr msgTotalImp
    PutLInt eax ; 
    jmp final


; si ecx < 8600
UIT20:; eax = 86000   ebx = 20 ecx = 28635 edx = 0  [ValorTemp]= 4300 valorTemp2] = 1720(00)
    nwln
    nwln
    PutLInt eax 
    nwln
    PutLInt ebx 
    nwln
    PutLInt ecx 
    nwln
    PutLInt edx 
    nwln
    nwln

    mov eax, ecx
    mov ebx, 14
    mul ebx ;   eax  = 400890(00)

    mov edx, [valorTemp2]

    add eax, edx

    ;DIvidimos entre 100

    xor edx, edx 

    mov ebx, 100

    nwln
    nwln
    PutLInt eax 
    nwln
    PutLInt ebx 
    nwln
    PutLInt ecx 
    nwln
    PutLInt edx 
    nwln
    nwln


    
    div ebx   ;eax = 5728.90  ebx = 100 ecx = 28635 edx = 0  [ValorTemp]= 4300 valorTemp2] = 1720(00)


    ;PutLInt eax ; 
    
    PutLInt eax      ; Mostrar parte entera (57)
    PutStr Punto

    mov eax, edx

    ;mov ecx, 100
    ;mul ecx ; Multiplica la parte fraccionaria por 100
    PutLInt eax      ; Mostrar parte fraccionaria (28)
    jmp final

    

final:
    nwln
    mov ebx, 0
    mov eax,1 ;Salimos del programa
    int 80h