
section .data
    ; define byte array
    array db 10, 20, 30, 40 ; 

section .text
    global _start

_start:

    mov ebx, array          ; Load address of array into EBX (base register) , 

    mov dl, [ebx]         ; load first element (10) into DL (ebx points to the start of the array)

    mov dh, [ebx+1]       ; load second element (20) into DH (ebx+1 points to the next byte)

    ; Exit program
    mov ax, 1
    xor bx, bx
    int 0x80
