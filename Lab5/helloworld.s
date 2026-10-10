	.file	"helloworld.c"
	.text
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	endbr64
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.globl	string
	.data
	.align 16
	.type	string, @object
	.size	string, 22
string:
	.string	"the bear ate the grub"
	.globl	f
	.align 4
	.type	f, @object
	.size	f, 4
f:
	.long	1067320848
	.globl	c
	.type	c, @object
	.size	c, 1
c:
	.byte	97
	.globl	a
	.align 4
	.type	a, @object
	.size	a, 4
a:
	.long	1
	.ident	"GCC: (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
