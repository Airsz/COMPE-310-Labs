.section .data
prompt1:
    .ascii "Enter first string: "
    prompt1_len = . - prompt1
prompt2:
    .ascii "Enter second string: "
    prompt2_len = . - prompt2
result_msg:
    .ascii "Hamming distance: "
    result_msg_len = . - result_msg
newline:
    .ascii "\n"
.section .bss
    .lcomm buffer1, 256
    .lcomm buffer2, 256
    .lcomm result_str, 21
.section .text
.global _start
_start:
    # print first question
    mov     $1, %rax
    mov     $1, %rdi
    lea     prompt1(%rip), %rsi
    mov     $prompt1_len, %rdx
    syscall
    # get first string
    lea     buffer1(%rip), %rdi
    mov     $255, %rsi
    call    read_line
    mov     %rax, %r12
    # print second question
    mov     $1, %rax
    mov     $1, %rdi
    lea     prompt2(%rip), %rsi
    mov     $prompt2_len, %rdx
    syscall
    # get second string
    lea     buffer2(%rip), %rdi
    mov     $255, %rsi
    call    read_line
    mov     %rax, %r13
    # find the shorter string
    mov     %r12, %r14
    cmp     %r13, %r14
    jbe     min_ok
    mov     %r13, %r14

min_ok:
    # r14 = number of characters to compare
    xor     %r15, %r15
    xor     %r8, %r8
compare_loop:
    cmp     %r14, %r8
    jge     compare_done
    # get character from first string
    lea     buffer1(%rip), %rbx
    movzbl  (%rbx, %r8), %eax
    # get character from second string
    lea     buffer2(%rip), %rbx
    movzbl  (%rbx, %r8), %edx
    # find the bits that are diffrent
    xor     %edx, %eax
    call    popcount8
    # add different bits to the answer
    add     %rax, %r15
    inc     %r8
    jmp     compare_loop

compare_done:
    # turn answer into a printable number
    mov     %r15, %rdi
    call    int_to_string
    mov     %rsi, %r8
    mov     %rdx, %r9
    # print the result message
    mov     $1, %rax
    mov     $1, %rdi
    lea     result_msg(%rip), %rsi
    mov     $result_msg_len, %rdx
    syscall
    # print the nuber
    mov     $1, %rax
    mov     $1, %rdi
    mov     %r8, %rsi
    mov     %r9, %rdx
    syscall
    # print newline
    mov     $1, %rax
    mov     $1, %rdi
    lea     newline(%rip), %rsi
    mov     $1, %rdx
    syscall
    # exit
    mov     $60, %rax
    xor     %rdi, %rdi
    syscall
# Read one character at a time
read_line:
    push    %rbx
    push    %r10
    push    %r11
    mov     %rdi, %rbx
    mov     %rsi, %r11
    xor     %r10, %r10
rl_loop:
    cmp     %r11, %r10
    jge     rl_finish
    # read on character
    mov     $0, %rax
    mov     $0, %rdi
    lea     (%rbx, %r10), %rsi
    mov     $1, %rdx
    syscall
    cmp     $0, %rax
    jle     rl_finish
    # stop when Enter is pressed
    movb    (%rbx, %r10), %al
    cmp     $10, %al
    je      rl_finish
    inc     %r10
    jmp     rl_loop

rl_finish:
    movb    $0, (%rbx, %r10)
    mov     %r10, %rax
    pop     %r11
    pop     %r10
    pop     %rbx
    ret
# count ths 1 bits in eax
popcount8:
    xor     %ecx, %ecx
pc_loop:
    test    %al, %al
    jz      pc_done
    mov     %al, %dl
    and     $1, %dl
    add     %dl, %cl
    shr     $1, %al
    jmp     pc_loop
pc_done:
    movzbl  %cl, %eax
    ret
# convert a number to decimal
int_to_string:
    lea     result_str(%rip), %rsi
    add     $20, %rsi
    movb    $0, (%rsi)
    mov     %rdi, %rax
    mov     $10, %rbx
    xor     %rcx, %rcx
    cmp     $0, %rax
    jne     its_convert_loop
    dec     %rsi
    movb    $'0', (%rsi)
    inc     %rcx
    jmp     its_done
its_convert_loop:
    cmp     $0, %rax
    je      its_done
    xor     %rdx, %rdx
    div     %rbx
    add     $'0', %dl
    dec     %rsi
    mov     %dl, (%rsi)
    inc     %rcx
    jmp     its_convert_loop
its_done:
    mov     %rcx, %rdx
    ret