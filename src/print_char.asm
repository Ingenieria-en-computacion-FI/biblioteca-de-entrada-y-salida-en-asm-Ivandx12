SECTION .text
global print_char

; ---------------------------------
; print_char
; Entrada:
;   AL = caracter a imprimir
; ---------------------------------

print_char:

    push ebp
    mov ebp, esp
    push eax            ; Guardamos el carácter (AL) en la pila
    
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    mov ecx, esp        ; La dirección del carácter es el tope de la pila
    mov edx, 1          ; 1 byte
    int 0x80            ; Llamada al sistema

    add esp, 4          
    mov esp, ebp
    pop ebp
    ret
