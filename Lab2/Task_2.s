.section .bss
.globl ram
.lcomm ram, 256

.section .text
.globl fill_ram_indirect

fill_ram_indirect:
    #Indirect addressing 

    lea ram+0x50(%rip), %rbx   # load address of ram+0x50 into rbx

    movb $0xFF, (%rbx)         # store FF at address rbx points to move pointer to next byte
    inc %rbx                  # incriments one to the next adress or like mail box of sorts
    movb $0xFF, (%rbx)
    inc %rbx
    movb $0xFF, (%rbx)
    inc %rbx
    movb $0xFF, (%rbx)
    inc %rbx
    movb $0xFF, (%rbx)
    inc %rbx
    movb $0xFF, (%rbx)
    inc %rbx
    movb $0xFF, (%rbx)
    inc %rbx
    movb $0xFF, (%rbx)
    inc %rbx
    movb $0xFF, (%rbx)

    ret                 # returns control to c program 
 
.section .note.GNU-stack,"",@progbits