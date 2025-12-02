section .data
    msg1 db "Start ...", 10
    len1 equ $ - msg1

    msg2 db "Stop ...", 10
    len2 equ $ - msg2

section .text
    global _start

print_str:
    mov rax, 1
    mov rdi, 1
    syscall
    ret

delay:
    mov rcx,rdi

my_loop:
    loop my_loop
    ret

_start:
    ; Print msg1
    mov rsi, msg1
    mov rdx, len1
    call print_str


    mov rdi, 1000000000
    call delay

    ; Print msg2
    mov rsi, msg2
    mov rdx, len2
    call print_str

    mov rax, 60
    xor rdi, rdi
    syscall

