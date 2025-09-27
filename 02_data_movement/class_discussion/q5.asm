

section .data
    value1 db 5  ; Define a byte (8 bits) with value 5
    value2 db 7  ; Define a byte (8 bits) with value 7

section .text
    global _start

_start:
    mov al, [value1] 
    add al, [value2]  

    ; Exit program
    mov eax, 1
    xor ebx, ebx
    int 0x80
