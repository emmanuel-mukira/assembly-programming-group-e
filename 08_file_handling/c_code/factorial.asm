; factorial.asm — computes factorial(n) in 64-bit mode
; Function signature (for C):  uint64_t factorial(uint64_t n)

section .text
    global factorial             ; make visible to C

factorial:
    mov rax, 1                   ; result = 1

    cmp rdi, 1                   ; if n <= 1
    jbe .done                    ;   return 1

.loop:
    imul rax, rdi                ; result *= n
    dec rdi                      ; n--
    cmp rdi, 1                   ; while n > 1
    ja .loop

.done:
    ret                          ; return result in RAX
