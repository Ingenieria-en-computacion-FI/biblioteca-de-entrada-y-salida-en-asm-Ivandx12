SECTION .text
global scan_string

; ---------------------------------
; scan_string
; Entrada:
;   EAX = buffer destino
;   EBX = tamaño máximo
; ---------------------------------

scan_string:

    push ebp
    mov ebp, esp

 ; EAX = dirección destino , EBX = tamaño máximo
    mov ecx, eax        
    mov edx, ebx        
    mov eax, 3          ; sys_read
    mov ebx, 0          ; stdin
    int 0x80            ; Llamada al sistema

    ; EAX retorna el número de bytes leídos
    mov byte [ecx + eax - 1], 0
    mov esp, ebp
    pop ebp
    ret
