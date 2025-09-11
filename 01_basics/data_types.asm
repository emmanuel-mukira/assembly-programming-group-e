; Assemble: nasm -f elf64 data_types.asm -o data_types.o
; Link:     ld data_types.o -o data_types
; Run:      ./data_types

section .data
    ; --- Basic integer types stored in memory ---
    myByte   db  0x41              ; db = Define Byte (8 bits, 1 byte)
                                   ; Stores value 0x41 = ASCII 'A'

    myWord   dw  0x4243            ; dw = Define Word (16 bits, 2 bytes)
                                   ; Stores 0x4243 ('C' 'B' if read as ASCII, endian-dependent)

    myDword  dd  123456            ; dd = Define Doubleword (32 bits, 4 bytes)
                                   ; Stores decimal 123456 = 0x0001E240

    myQword  dq  1234567890123     ; dq = Define Quadword (64 bits, 8 bytes)
                                   ; Stores 64-bit integer 1234567890123 = 0x11F71FB04CB

    ; --- String example ---
    myString db "Hello", 0         ; db can also define character strings
                                   ; Each character takes 1 byte, ending with 0 (null terminator)

section .bss
    ; --- Uninitialized memory (allocated at runtime) ---
    buffer   resb 64               ; resb = Reserve Bytes
                                   ; Reserves 64 bytes of uninitialized space

section .text
    global _start

_start:
    ; --- Load data from memory into registers ---

    mov al, [myByte]               ; Load 1 byte into AL (low 8 bits of RAX)
    mov ax, [myWord]               ; Load 2 bytes into AX (low 16 bits of RAX)
    mov eax, [myDword]             ; Load 4 bytes into EAX (low 32 bits of RAX)
    mov rax, [myQword]             ; Load 8 bytes into RAX (full 64-bit register)

    ; --- Exit the program with code 0 ---
    mov rax, 60                    ; syscall number for exit (Linux x86-64 ABI)
    xor rdi, rdi                   ; set exit code = 0
    syscall                        ; make system call
