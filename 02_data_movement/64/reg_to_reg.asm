; section .text
; 	global _start
; _start:
; 	mov ax ,5 	;example value
; 	mov bx ,10	;example value

; 	;swap using a third register (cx)
; 	mov cx , ax	; value of ax moved to cx
; 	mov ax , bx	; value of bx moved to ax
; 	mov bx , cx 	; value of cx (originally in ax) moved to bx
	
; ; Exit
; mov rax, 60
; xor rdi, rdi
; syscall
section .text
    global _start

_start:
    mov ax, 5
    mov bx, 10

    ; XOR swap
    xor ax, bx     ; AX = AX XOR BX
    xor bx, ax     ; BX = BX XOR AX (BX = old AX)
    xor ax, bx     ; AX = AX XOR BX (AX = old BX)

    ; Exit
    mov rax, 60
    xor rdi, rdi
    syscall
