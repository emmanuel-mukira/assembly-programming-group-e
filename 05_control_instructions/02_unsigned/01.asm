; JA / JNBE -> Jump if Above
section .data
    str_above db "AX > BX (Above)-Emmanuel Mukira 166146",10,0
    len_above equ $ - str_above          ; Calculate length automatically
    
    str_not_above db "AX <= BX (Not Above)-Emmanuel Mukira 166146",10,0
    len_not_above equ $ - str_not_above  ; Calculate length automatically

section .text
    global _start
_start:
    mov ax, 7
    mov bx, 3
    cmp ax, bx
    ja above

    mov ecx, str_not_above
    mov edx, len_not_above    ; Use calculated length
    jmp print

above:
    mov ecx, str_above
    mov edx, len_above        ; Use calculated length

print:
    mov eax, 4
    mov ebx, 1
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80