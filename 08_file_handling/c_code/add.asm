section .data
    sum dq 0                ; 'dq' = define quadword (8 bytes) for 64-bit sum

section .text
    global _start

_start:
    mov rcx, 15             ; RCX = 15 (loop counter)
    xor rax, rax            ; RAX = 0 (initialize sum = 0)

    ; 💡 WHY WE USE RAX INSTEAD OF EAX:
    ; In 64-bit mode, registers have been extended:
    ; - EAX is the lower 32 bits of RAX.
    ; - Using RAX allows full 64-bit operations (values up to 2^64 - 1).
    ; - If you use EAX, the upper 32 bits of RAX are automatically cleared to 0.
    ;   This means you lose the upper half — fine for small numbers, but unsafe for large ones.

.loop_inc:
    add rax, rcx            ; sum += rcx (64-bit addition)
    inc rcx                 ; rcx = rcx + 1
    cmp rcx, 26             ; stop when rcx == 26
    jl .loop_inc            ; jump back if rcx < 26

    mov [sum], rax          ; store final 64-bit sum in memory (8 bytes)

    ; Exit program using 64-bit syscall
    mov rax, 60             ; syscall number for exit()
    xor rdi, rdi            ; status code 0
    syscall
