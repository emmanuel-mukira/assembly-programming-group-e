; JGE / JNL → Jump if Greater or Equal
section .data
    msg_ge db "AX >= BX (Signed Greater or Equal) - Emmanuel Mukira 166146",10,0
    msg_less db "AX < BX (Signed Less) - Emmanuel Mukira 166146",10,0
    
section .text
    global _start
_start:
    mov ax,5
    mov bx,5
    cmp ax,bx
    jge ge_label

    mov ecx, msg_less
    mov edx, 48
    jmp print

ge_label:
    mov ecx, msg_ge
    mov edx, 60

print:
    mov eax,4
    mov ebx,1
    int 0x80

    mov eax,1
    xor ebx,ebx
    int 0x80