%macro escribir 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro
%macro lectura 2
	mov eax,3
	mov ebx,2
	mov ecx,%1
	mov edx,%2
	int 80h
%endmacro

section .data
    msj01 db "Ingrese el primer numero:",10
	len01 equ $ - msj01

	msj02 db "Ingrese el segundo numero:",10
	len02 equ $ - msj02

    msj1 db "Número Mayor"
    len1 equ $ - msj1
    msj2 db "Número Menor"
    len2 equ $ - msj2

section .bss
	n1 resb 1
	n2 resb 1

section .text
    global _start
_start:
    escribir msj01,len01
    lectura n1,2
    escribir msj02,len0
    lectura n2,2
;*********proceso**********
    mov al,[n1]
    mov bl,[n2]
    cmp al,bl
    jg mayor
    jmp menor
    ;je para el igual

mayor:
    escribir msj1,len1
    jmp salir

menor:
    escribir msj2,len2
    int 80h

salir:
    mov eax,1
	int 80h