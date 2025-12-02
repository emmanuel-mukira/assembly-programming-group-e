section .data
    msg1 db "Start ...", 10
    len1 equ $ - msg1

    msg2 db "Stop ...", 10
    len2 equ $ - msg2

section .text
    global _start

%macro PRINT_STR 2
    mov rax, 1
    mov rdi, 1
    mov rsi, %1
    mov rdx, %2
    syscall
%endmacro

%macro DELAY 1
    mov rcx, %1
my_loop:
    loop my_loop
%endmacro

_start:
    ; Print msg1
    PRINT_STR msg1, len1

    ; Delay
    DELAY 1000000000

    ; Print msg2
    PRINT_STR msg2, len2

    mov rax, 60
    xor rdi, rdi
    syscall