.section .data
Numbers:
.long 1
.long 15
.long 4
.long 2
.long 7
.long 9
.long 23
.long 7
.long 3
.long 11
Array_length:
.long 10

.section .text
.globl main
main:
movl $0, %edi                 # i = 0
leaq Numbers(%rip), %rsi      # rsi = address of Numbers
movl (%rsi), %ebx             # max = first number
jmp check                     # jump to the while test first

body:
movl (%rsi,%rdi,4), %eax      # eax = Numbers[i]
cmpl %ebx, %eax               # compare Numbers[i] to max
jle skip                      # if Numbers[i] <= max, skip
movl %eax, %ebx               # otherwise max = Numbers[i]
skip:
addl $1, %edi                 # i++

check:
cmpl Array_length(%rip), %edi # is i < Array_length?
jl body                       # if yes, go back to the body

movl %ebx, %eax               # return max from main
ret