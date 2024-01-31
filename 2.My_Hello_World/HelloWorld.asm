BITS 64

section .data
    stdout equ 1
    hello db 'Hello, World!', 0
    len_hello equ $ - hello

section .text
    global _start

_start:
    mov rax,1
    mov rdi,1
    mov rdx,len_hello
    mov rsi,hello
    syscall
    mov eax,60
    syscall
