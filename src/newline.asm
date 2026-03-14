extern print_char
global newline

SECTION .text

newline:

    push ebp
    mov ebp, esp

    mov al, 10          ; salto de línea
    call print_char     

    mov esp, ebp
    pop ebp
    ret
