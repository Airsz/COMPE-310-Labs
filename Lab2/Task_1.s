.section .bas
.global ram
.lcomm ram, 256   # reserved ram (uninitialized memory)

.section .text
.globl fill_ram   #functions visible to c

fill_ram:
    #direct addressing 
    movb $0xFF, ram+0x50
    movb $0xFF, ram+0x51
    movb $0xFF, ram+0x52
    movb $0xFF, ram+0x53
    movb $0xFF, ram+0x54
    movb $0xFF, ram+0x55
    movb $0xFF, ram+0x56
    movb $0xFF, ram+0x57
    movb $0xFF, ram+0x58

    ret                 # returns control to c program 
 
.section .note.GNU-stack,"",@progbits