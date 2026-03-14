SECTION .text
global print_string

; ---------------------------------
; print_string
; Entrada:
;   EAX = direccion de cadena
;   cadena terminada en 0
; ---------------------------------

print_string:

    push ebp
    mov ebp, esp

    push ebx
    push ecx

    mov ecx, eax        ; Dirección de la cadena 
    mov edx, 0          ; Contador de longitud

.loop_len:
    cmp byte [ecx + edx], 0
    je .print
    inc edx
    jmp .loop_len

.print:
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    int 0x80            ; Llamada al sistema

    pop ecx
    pop ebx
    mov esp, ebp
    pop ebp
    ret
