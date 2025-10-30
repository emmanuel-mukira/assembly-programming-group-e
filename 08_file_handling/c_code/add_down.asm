section .data
    sum dq 0                ; Reserve 8 bytes for 64-bit sum storage

section .text
    global _start

_start:
    mov rcx, 25             ; RCX = 25 (starting number)
    xor rax, rax            ; RAX = 0 (initialize sum = 0)

    ; 💡 Explanation:
    ; - We use RAX (not EAX) for full 64-bit arithmetic.
    ; - RCX will be decremented down to 15 using DEC.
    ; - The loop continues as long as RCX >= 15.

.loop_dec:
    add rax, rcx            ; sum += rcx
    dec rcx                 ; rcx = rcx - 1
    cmp rcx, 14             ; stop when rcx == 14
    jg .loop_dec            ; jump back if rcx > 14

    mov [sum], rax          ; store the final sum (205)

    ; Exit cleanly (Linux syscall)
    mov rax, 60             ; syscall number for exit()
    xor rdi, rdi            ; exit status = 0
    syscall
