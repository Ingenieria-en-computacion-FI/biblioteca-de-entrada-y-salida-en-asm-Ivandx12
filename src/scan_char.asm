SECTION .bss
char_buffer resb 1

SECTION .text
global scan_char

; ---------------------------------
; scan_char
; Salida:
;   AL = caracter leído
; ---------------------------------

scan_char:

    push ebp
    mov ebp, esp

    sub esp, 4          ; Reservamos espacio local en la pila

    mov eax, 3          ; sys_read
    mov ebx, 0          ; stdin
    mov ecx, esp        ; Usamos el espacio de la pila como buffer
    mov edx, 1          ; Leer 1 byte
    int 0x80            ; Llamada al sistema

    mov al, [esp]       ; Movemos el carácter leído a AL
    mov esp, ebp
    pop ebp
    ret
