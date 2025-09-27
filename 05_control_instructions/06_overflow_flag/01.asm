; JO → Jump if Overflow
section .data
    msg_ov db "Overflow occurred (OF=1) - Emmanuel Mukira 166146",10,0
    msg_noov db "No overflow (OF=0) - Emmanuel Mukira 166146",10,0

section .text
    global _start
_start:
    mov ax,7FFFh
    add ax,1       ; causes signed overflow (0x7FFF + 1 = 0x8000, which flips sign bit)
    jo overflow

    mov ecx, msg_noov
    mov edx, 46        ; Length of "No overflow (OF=0) - Emmanuel Mukira 166146" + 1 for newline
    jmp print

overflow:
    mov ecx, msg_ov
    mov edx, 50        ; Length of "Overflow occurred (OF=1) - Emmanuel Mukira 166146" + 1 for newline

print:
    mov eax,4
    mov ebx,1
    int 0x80

    mov eax,1
    xor ebx,ebx
    int 0x80