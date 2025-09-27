<<<<<<< Updated upstream
; simple loop

; nasm -f elf32 loop1.asm -o loop1.o -g
; ld -m elf_i386 loop1.o -o loop1
; to run = ./loop1
; to debug = gdb --silent loop1

=======
>>>>>>> Stashed changes
section .data
    str_msg db "Hello from LOOP!", 10
    len equ $ - str_msg

section .text
    global _start

_start:
    mov ecx, 5              ; loop counter

print_loop:
    mov eax, 4             ;eax = 4 tells the computer we want to write/print something 
    mov ebx, 1             ;ebx = 1 tells it to print to the screen (not a file) 
    push ecx                ; save loop counter
    mov ecx, str_msg       ;ecx = address of the string to print
    mov edx, len           ;edx = length of the string
    int 0x80               ; call kernel to perform the write
    pop ecx                 ; restore loop counter from stack
    loop print_loop          ; decrements ecx, jumps if not 0


    mov eax, 1      ; syscall number (sys_exit)
    xor ebx, ebx    ; status 0
    int 0x80        ; call kernel to exit
