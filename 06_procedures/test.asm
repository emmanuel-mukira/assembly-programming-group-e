section .data  
    num db 25  ; numerator
    den db 6   ; denominator


section .text 
    global _start 


_start: 
    mov al, [num]   ; AL = 25
    mov ah, 0       ; Clear AH to make AX = 0025h
    mov bl, [den]   ; BL = 6
    div bl          ; AX ÷ BL → AL=4, AH=1

    ; Exit cleanly (for Linux)
    mov eax, 60     ; syscall: exit
    xor edi, edi
    syscall
