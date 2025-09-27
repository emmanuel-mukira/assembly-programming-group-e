; JC → Jump if Carry
section .data
    msg_carry db "Carry occurred (CF=1) - Emmanuel Mukira 166146",10,0
    msg_nocarry db "No carry (CF=0) - Emmanuel Mukira 166146",10,0

section .text
    global _start
_start:
    mov ax,0FFFFh
    add ax,1       ; sets CF=1 (0xFFFF + 1 = 0x10000, but AX can only hold 16 bits, so CF=1)
    jc carry

    mov ecx, msg_nocarry
    mov edx, 44        ; Length of "No carry (CF=0) - Emmanuel Mukira 166146" + 1 for newline
    jmp print

carry:
    mov ecx, msg_carry
    mov edx, 48        ; Length of "Carry occurred (CF=1) - Emmanuel Mukira 166146" + 1 for newline

print:
    mov eax,4
    mov ebx,1
    int 0x80

    mov eax,1
    xor ebx,ebx
    int 0x80