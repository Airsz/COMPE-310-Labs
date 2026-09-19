.section .bss
.globl ram
.lcomm ram, 256

.section .text
.globl sum_series


sum_series:
    #summing
    xorb %al, %al        # used for loop, set to 0 for now
    movb $1, %bl          # counter 

sum_loop:
    addb %bl, %al         # AL = AL + BL  (sum += i)
    incb %bl              # i = i + 1
    cmpb $11, %bl          # compare BL to 11
    jne sum_loop           # 
  
    lea ram+0x50(%rip), %rbx   # load address of ram+0x50
    movb %al, (%rbx)             # store FF at address rbx points to move pointer to next byte
   
    ret                 # returns control to c program 
 
.section .note.GNU-stack,"",@progbits