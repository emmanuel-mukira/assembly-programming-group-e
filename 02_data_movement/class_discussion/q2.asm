section .data
    arr dd 10, 20, 30, 40 ; define an array of 4 integers dd = define double word (4 bytes each)

section .text
    global _start

_start:
    mov esi, 2               ; Load index 2 into ESI (Source Index Register)
    mov eax, [arr + esi*4]  ; Load the value at index 2 (30) into EAX (4 bytes each, so multiply index by 4)

    ; Exit
    mov eax, 1
    xor ebx, ebx
    int 0x80
