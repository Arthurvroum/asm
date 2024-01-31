BITS 64

section .text
    global my_Revstr

my_Revstr:
    init_rev:
        xor rax, rax
        xor rcx, rcx
        xor r8, r8
        jmp rev_loop
    rev_loop:
        mov r8b, [rdi + rcx]
        cmp r8b,0
        jne rev_loop_continue
        jmp rev_loop_pop
    rev_loop_continue:
        push r8
        inc rcx
        jmp rev_loop

    rev_loop_pop:
        pop r8
        mov [rdi + rax], r8b
        inc rax
        dec rcx
        cmp rcx, 0
        jne rev_loop_pop
        jmp end_revstr

end_revstr:
        ret