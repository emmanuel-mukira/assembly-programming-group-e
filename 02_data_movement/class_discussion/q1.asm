section .data
    num dw 1234  ; Define a word (16 bits) with value 1234

section .text
    global _start

_start:
    mov al, [num]  ; Load the lower 8 bits of 'num' into AL , from 1234 

    ; Exit
    mov eax, 1
    xor ebx, ebx
    int 0x80
