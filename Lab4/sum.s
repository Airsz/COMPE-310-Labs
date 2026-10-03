.global sum
.section .text           # code starts here

sum:
    xorl %eax, %eax          # sum = 0
    xorl %ecx, %ecx          # counter i = 0

again:
    cmpl %esi, %ecx          # compare i to count
    jge finish               # if i >= count, returns
    addl (%rdi,%rcx,4), %eax # adds the array element to the total
    incl %ecx                # i = i + 1
    jmp again                # jumps no matter what

finish:
    ret                      # result is in eax

.section .note.GNU-stack,"",@progbits