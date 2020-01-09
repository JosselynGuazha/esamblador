section .data
    msj db 10,'Item: '
    len equ $ -msj

section .bss
	n1 resb 2

section .text
    global _start:
_start:
    mov cx,10

ciclo:
    
    cmp cx,0
    jz salir
    dec cx
    jnz imprimir_mensaje

imprimir_mensaje:
    mov eax,4
    mov ebx,1
    push cx
    add cx,'0' 
    mov [n1],cx
    mov ecx,msj
    mov edx,len
    int 80h

    mov eax,4
	mov ebx,1
    mov ecx,n1
    mov edx,1
    int 80h
    pop cx
    jmp ciclo
	

salir:
    mov eax,1
    int 80h