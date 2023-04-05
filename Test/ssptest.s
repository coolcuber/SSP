	.file	"ssptest.c"
	.section .rdata,"dr"
LC0:
	.ascii "Size: %d\12\0"
	.text
	.globl	_printSSP
	.def	_printSSP;	.scl	2;	.type	32;	.endef
_printSSP:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	addl	$8, %eax
	movl	%eax, (%esp)
	call	_printsz
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	movl	$0, -12(%ebp)
	jmp	L2
L3:
	movl	8(%ebp), %eax
	movl	4(%eax), %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	movl	%eax, (%esp)
	call	_printdz
	addl	$1, -12(%ebp)
L2:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	-12(%ebp), %eax
	jg	L3
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.section .rdata,"dr"
LC1:
	.ascii "Test 1: \0"
	.align 4
LC13:
	.ascii "Failed\12Expected SSP Solution to be:\0"
LC14:
	.ascii "But was:\0"
	.align 4
LC17:
	.ascii "Failed\12Expected SSP optimal reward to be (%.2f), but was (%.2f)\12\0"
LC18:
	.ascii "Succeeded\0"
	.text
	.globl	_test1
	.def	_test1;	.scl	2;	.type	32;	.endef
_test1:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$88, %esp
	movl	$LC1, (%esp)
	call	_printf
	flds	LC2
	fstps	-32(%ebp)
	flds	LC3
	fstps	-28(%ebp)
	flds	LC4
	fstps	-24(%ebp)
	flds	LC2
	fstps	-20(%ebp)
	call	_newssp
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	fldz
	fstps	8(%eax)
	movl	-12(%ebp), %eax
	fldz
	fstps	12(%eax)
	movl	-12(%ebp), %eax
	flds	LC4
	fstps	16(%eax)
	movl	-12(%ebp), %eax
	flds	LC2
	fstps	20(%eax)
	movl	$5, 4(%esp)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_makedzs
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	fldz
	fstps	(%eax)
	flds	LC3
	fstps	4(%eax)
	flds	LC3
	fstps	8(%eax)
	flds	LC6
	fstps	12(%eax)
	flds	LC4
	fstps	16(%eax)
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	addl	$20, %eax
	fld1
	fstps	(%eax)
	fldz
	fstps	4(%eax)
	flds	LC6
	fstps	8(%eax)
	flds	LC8
	fstps	12(%eax)
	flds	LC9
	fstps	16(%eax)
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	addl	$40, %eax
	flds	LC6
	fstps	(%eax)
	flds	LC6
	fstps	4(%eax)
	flds	LC9
	fstps	8(%eax)
	flds	LC9
	fstps	12(%eax)
	flds	LC3
	fstps	16(%eax)
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	addl	$60, %eax
	flds	LC4
	fstps	(%eax)
	flds	LC2
	fstps	4(%eax)
	flds	LC9
	fstps	8(%eax)
	flds	LC9
	fstps	12(%eax)
	flds	LC2
	fstps	16(%eax)
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	addl	$80, %eax
	flds	LC10
	fstps	(%eax)
	flds	LC11
	fstps	4(%eax)
	flds	LC9
	fstps	8(%eax)
	flds	LC6
	fstps	12(%eax)
	flds	LC8
	fstps	16(%eax)
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_solvessp
	fldl	LC12
	faddp	%st, %st(1)
	fstps	-16(%ebp)
	movl	-12(%ebp), %eax
	addl	$8, %eax
	movl	%eax, 4(%esp)
	leal	-32(%ebp), %eax
	movl	%eax, (%esp)
	call	_szequals
	testl	%eax, %eax
	jne	L5
	movl	$LC13, (%esp)
	call	_puts
	leal	-32(%ebp), %eax
	movl	%eax, (%esp)
	call	_printsz
	movl	$LC14, (%esp)
	call	_puts
	movl	-12(%ebp), %eax
	addl	$8, %eax
	movl	%eax, (%esp)
	call	_printsz
	movl	$-1, (%esp)
	call	_exit
L5:
	flds	LC15
	fstps	4(%esp)
	flds	-16(%ebp)
	fstps	(%esp)
	call	_floatequals
	testl	%eax, %eax
	jne	L6
	flds	-16(%ebp)
	fstpl	12(%esp)
	fldl	LC16
	fstpl	4(%esp)
	movl	$LC17, (%esp)
	call	_printf
	movl	$-1, (%esp)
	call	_exit
L6:
	movl	-12(%ebp), %eax
	movl	%eax, (%esp)
	call	_sspfree
	movl	$LC18, (%esp)
	call	_puts
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
	.align 4
LC20:
	.ascii "All tests completed successfully\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$16, %esp
	call	___main
	call	_test1
	movl	$LC20, (%esp)
	call	_puts
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.section .rdata,"dr"
	.align 4
LC2:
	.long	1077936128
	.align 4
LC3:
	.long	1088421888
	.align 4
LC4:
	.long	1082130432
	.align 4
LC6:
	.long	1084227584
	.align 4
LC8:
	.long	1092616192
	.align 4
LC9:
	.long	1086324736
	.align 4
LC10:
	.long	1091567616
	.align 4
LC11:
	.long	1073741824
	.align 8
LC12:
	.long	-755914244
	.long	1062232653
	.align 4
LC15:
	.long	1126301696
	.align 8
LC16:
	.long	0
	.long	1080311808
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_printsz;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_printdz;	.scl	2;	.type	32;	.endef
	.def	_newssp;	.scl	2;	.type	32;	.endef
	.def	_makedzs;	.scl	2;	.type	32;	.endef
	.def	_solvessp;	.scl	2;	.type	32;	.endef
	.def	_szequals;	.scl	2;	.type	32;	.endef
	.def	_puts;	.scl	2;	.type	32;	.endef
	.def	_exit;	.scl	2;	.type	32;	.endef
	.def	_floatequals;	.scl	2;	.type	32;	.endef
	.def	_sspfree;	.scl	2;	.type	32;	.endef
