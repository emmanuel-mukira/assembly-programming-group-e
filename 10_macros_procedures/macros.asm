section .data
    message db "Hello, Assembly!", 0Ah
    msg_len equ $ - message

section .text
    global _start

; Define the macro
%macro PRINT_MSG 0
    mov rax, 1          ; syscall: write
    mov rdi, 1          ; file descriptor: stdout
    mov rsi, message    ; message address
    mov rdx, msg_len    ; message length
    syscall             ; perform the syscall
%endmacro

_start:
    PRINT_MSG           ; invoke the macro

    ; Exit program
    mov rax, 60         ; syscall: exit
    xor rdi, rdi        ; status = 0
    syscall
