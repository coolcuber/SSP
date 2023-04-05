	.file	"ssp.c"
	.text
	.globl	_floatequals
	.def	_floatequals;	.scl	2;	.type	32;	.endef
_floatequals:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	flds	8(%ebp)
	fsubs	12(%ebp)
	fabs
	fldl	LC0
	fucompp
	fnstsw	%ax
	sahf
	seta	%al
	movzbl	%al, %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.globl	_floatpos
	.def	_floatpos;	.scl	2;	.type	32;	.endef
_floatpos:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	flds	8(%ebp)
	fldz
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	jbe	L8
	movl	$1, %eax
	jmp	L6
L8:
	flds	8(%ebp)
	fldl	LC3
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	seta	%al
	movzbl	%al, %eax
L6:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.globl	_makedzs
	.def	_makedzs;	.scl	2;	.type	32;	.endef
_makedzs:
LFB19:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	12(%ebp), %edx
	movl	8(%ebp), %eax
	movl	%edx, (%eax)
	movl	$20, 4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_calloc
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, 4(%eax)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE19:
	.globl	_newssp
	.def	_newssp;	.scl	2;	.type	32;	.endef
_newssp:
LFB20:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$24, 4(%esp)
	movl	$1, (%esp)
	call	_calloc
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE20:
	.section .rdata,"dr"
	.align 4
LC4:
	.ascii "DZ: x = %f, y = %f, w = %f, h = %f, v = %f\12\0"
	.text
	.globl	_printdz
	.def	_printdz;	.scl	2;	.type	32;	.endef
_printdz:
LFB21:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	8(%ebp), %eax
	flds	16(%eax)
	movl	8(%ebp), %eax
	flds	12(%eax)
	movl	8(%ebp), %eax
	flds	8(%eax)
	movl	8(%ebp), %eax
	flds	4(%eax)
	movl	8(%ebp), %eax
	flds	(%eax)
	fxch	%st(4)
	fstpl	36(%esp)
	fxch	%st(2)
	fstpl	28(%esp)
	fstpl	20(%esp)
	fstpl	12(%esp)
	fstpl	4(%esp)
	movl	$LC4, (%esp)
	call	_printf
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE21:
	.section .rdata,"dr"
	.align 4
LC5:
	.ascii "SZ: x = %f, y = %f, w = %f, h = %f\12\0"
	.text
	.globl	_printsz
	.def	_printsz;	.scl	2;	.type	32;	.endef
_printsz:
LFB22:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	8(%ebp), %eax
	flds	12(%eax)
	movl	8(%ebp), %eax
	flds	8(%eax)
	movl	8(%ebp), %eax
	flds	4(%eax)
	movl	8(%ebp), %eax
	flds	(%eax)
	fxch	%st(3)
	fstpl	28(%esp)
	fxch	%st(1)
	fstpl	20(%esp)
	fstpl	12(%esp)
	fstpl	4(%esp)
	movl	$LC5, (%esp)
	call	_printf
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE22:
	.globl	_reward
	.def	_reward;	.scl	2;	.type	32;	.endef
_reward:
LFB23:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	12(%ebp), %eax
	flds	(%eax)
	movl	12(%ebp), %eax
	flds	8(%eax)
	faddp	%st, %st(1)
	movl	8(%ebp), %eax
	flds	(%eax)
	movl	8(%ebp), %eax
	flds	8(%eax)
	faddp	%st, %st(1)
	fxch	%st(1)
	fstpl	8(%esp)
	fstpl	(%esp)
	call	_fmin
	fstpl	-40(%ebp)
	movl	12(%ebp), %eax
	flds	(%eax)
	movl	8(%ebp), %eax
	flds	(%eax)
	fxch	%st(1)
	fstpl	8(%esp)
	fstpl	(%esp)
	call	_fmax
	fsubrl	-40(%ebp)
	fstps	-12(%ebp)
	movl	12(%ebp), %eax
	flds	4(%eax)
	movl	12(%ebp), %eax
	flds	12(%eax)
	faddp	%st, %st(1)
	movl	8(%ebp), %eax
	flds	4(%eax)
	movl	8(%ebp), %eax
	flds	12(%eax)
	faddp	%st, %st(1)
	fxch	%st(1)
	fstpl	8(%esp)
	fstpl	(%esp)
	call	_fmin
	fstpl	-40(%ebp)
	movl	12(%ebp), %eax
	flds	4(%eax)
	movl	8(%ebp), %eax
	flds	4(%eax)
	fxch	%st(1)
	fstpl	8(%esp)
	fstpl	(%esp)
	call	_fmax
	fsubrl	-40(%ebp)
	fstps	-16(%ebp)
	flds	-12(%ebp)
	fstps	(%esp)
	call	_floatpos
	testl	%eax, %eax
	je	L15
	flds	-16(%ebp)
	fstps	(%esp)
	call	_floatpos
	testl	%eax, %eax
	jne	L16
L15:
	fldz
	jmp	L17
L16:
	movl	12(%ebp), %eax
	flds	16(%eax)
	fmuls	-12(%ebp)
	fmuls	-16(%ebp)
L17:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE23:
	.globl	_setup
	.def	_setup;	.scl	2;	.type	32;	.endef
_setup:
LFB24:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$56, %esp
	movl	8(%ebp), %eax
	flds	16(%eax)
	fstps	-16(%ebp)
	movl	8(%ebp), %eax
	flds	20(%eax)
	fstps	-20(%ebp)
	movl	$0, -24(%ebp)
	movl	$0, -28(%ebp)
	movl	$0, -12(%ebp)
	jmp	L19
L20:
	movl	8(%ebp), %eax
	movl	4(%eax), %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	flds	4(%eax)
	fstps	4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_pladd
	movl	8(%ebp), %eax
	movl	4(%eax), %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	flds	4(%eax)
	movl	8(%ebp), %eax
	movl	4(%eax), %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	flds	12(%eax)
	faddp	%st, %st(1)
	fsubs	-20(%ebp)
	fstps	4(%esp)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_pladd
	movl	16(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -24(%ebp)
	movl	8(%ebp), %eax
	movl	4(%eax), %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	flds	(%eax)
	fstps	-32(%ebp)
	movl	8(%ebp), %eax
	movl	4(%eax), %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	flds	8(%eax)
	fstps	-36(%ebp)
	flds	-32(%ebp)
	fsubs	-16(%ebp)
	fstps	4(%esp)
	movl	16(%ebp), %eax
	movl	%eax, (%esp)
	call	_pladd
	flds	-32(%ebp)
	fstps	4(%esp)
	movl	16(%ebp), %eax
	movl	%eax, (%esp)
	call	_pladd
	flds	-32(%ebp)
	fadds	-36(%ebp)
	fsubs	-16(%ebp)
	fstps	4(%esp)
	movl	16(%ebp), %eax
	movl	%eax, (%esp)
	call	_pladd
	movl	%eax, -24(%ebp)
	flds	-32(%ebp)
	fadds	-36(%ebp)
	fstps	4(%esp)
	movl	16(%ebp), %eax
	movl	%eax, (%esp)
	call	_pladd
	movl	8(%ebp), %eax
	movl	4(%eax), %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	flds	(%eax)
	movl	-12(%ebp), %eax
	movl	%eax, 8(%esp)
	fstps	4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_imadd
	movl	8(%ebp), %eax
	movl	4(%eax), %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	flds	(%eax)
	movl	8(%ebp), %eax
	movl	4(%eax), %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	flds	8(%eax)
	faddp	%st, %st(1)
	fsubs	-16(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, 8(%esp)
	fstps	4(%esp)
	movl	20(%ebp), %eax
	movl	%eax, (%esp)
	call	_imadd
	movl	8(%ebp), %eax
	movl	4(%eax), %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	flds	(%eax)
	fsubs	-16(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, 8(%esp)
	fstps	4(%esp)
	movl	24(%ebp), %eax
	movl	%eax, (%esp)
	call	_imadd
	movl	8(%ebp), %eax
	movl	4(%eax), %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	flds	(%eax)
	movl	8(%ebp), %eax
	movl	4(%eax), %ecx
	movl	-12(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	flds	8(%eax)
	faddp	%st, %st(1)
	movl	-12(%ebp), %eax
	movl	%eax, 8(%esp)
	fstps	4(%esp)
	movl	24(%ebp), %eax
	movl	%eax, (%esp)
	call	_imadd
	addl	$1, -12(%ebp)
L19:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	-12(%ebp), %eax
	jg	L20
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE24:
	.globl	_solvessp
	.def	_solvessp;	.scl	2;	.type	32;	.endef
_solvessp:
LFB25:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$136, %esp
	movl	8(%ebp), %eax
	addl	$8, %eax
	movl	%eax, -48(%ebp)
	call	_newpl
	movl	%eax, -52(%ebp)
	call	_newpl
	movl	%eax, -56(%ebp)
	call	_newim
	movl	%eax, -60(%ebp)
	call	_newim
	movl	%eax, -64(%ebp)
	movl	-64(%ebp), %eax
	movl	%eax, 16(%esp)
	movl	-60(%ebp), %eax
	movl	%eax, 12(%esp)
	movl	-56(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	-52(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_setup
	fldz
	fstps	-12(%ebp)
	movl	8(%ebp), %eax
	flds	16(%eax)
	fstps	-68(%ebp)
	movl	-52(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -32(%ebp)
	movl	$0, -36(%ebp)
	jmp	L22
L31:
	movl	-32(%ebp), %eax
	flds	(%eax)
	fstps	-72(%ebp)
	movl	-48(%ebp), %eax
	flds	-72(%ebp)
	fstps	4(%eax)
	fldz
	fstps	-16(%ebp)
	fldz
	fstps	-20(%ebp)
	movl	-56(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -36(%ebp)
	jmp	L23
L30:
	movl	-36(%ebp), %eax
	flds	(%eax)
	fstps	-76(%ebp)
	flds	-76(%ebp)
	fstps	4(%esp)
	movl	-64(%ebp), %eax
	movl	%eax, (%esp)
	call	_evaluate
	movl	%eax, -40(%ebp)
	jmp	L24
L25:
	movl	8(%ebp), %eax
	movl	4(%eax), %ecx
	movl	-40(%ebp), %eax
	movl	(%eax), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	flds	(%eax)
	movl	-48(%ebp), %eax
	fstps	(%eax)
	movl	8(%ebp), %eax
	movl	4(%eax), %ecx
	movl	-40(%ebp), %eax
	movl	(%eax), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	movl	%eax, 4(%esp)
	movl	-48(%ebp), %eax
	movl	%eax, (%esp)
	call	_reward
	fdivs	-68(%ebp)
	flds	-20(%ebp)
	faddp	%st, %st(1)
	fstps	-20(%ebp)
	movl	-40(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -40(%ebp)
L24:
	cmpl	$0, -40(%ebp)
	jne	L25
	flds	-76(%ebp)
	fstps	4(%esp)
	movl	-60(%ebp), %eax
	movl	%eax, (%esp)
	call	_evaluate
	movl	%eax, -44(%ebp)
	jmp	L26
L27:
	movl	8(%ebp), %eax
	movl	4(%eax), %ecx
	movl	-44(%ebp), %eax
	movl	(%eax), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	flds	(%eax)
	movl	-48(%ebp), %eax
	fstps	(%eax)
	movl	8(%ebp), %eax
	movl	4(%eax), %ecx
	movl	-44(%ebp), %eax
	movl	(%eax), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	addl	%ecx, %eax
	movl	%eax, 4(%esp)
	movl	-48(%ebp), %eax
	movl	%eax, (%esp)
	call	_reward
	fdivs	-68(%ebp)
	flds	-20(%ebp)
	fsubp	%st, %st(1)
	fstps	-20(%ebp)
	movl	-44(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -44(%ebp)
L26:
	cmpl	$0, -44(%ebp)
	jne	L27
	movl	-36(%ebp), %eax
	movl	4(%eax), %eax
	flds	(%eax)
	fsubs	-76(%ebp)
	fmuls	-20(%ebp)
	flds	-16(%ebp)
	faddp	%st, %st(1)
	fstps	-16(%ebp)
	flds	-16(%ebp)
	flds	-12(%ebp)
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	jbe	L28
	flds	-16(%ebp)
	fstps	-12(%ebp)
	movl	-36(%ebp), %eax
	movl	4(%eax), %eax
	flds	(%eax)
	fstps	-24(%ebp)
	flds	-72(%ebp)
	fstps	-28(%ebp)
L28:
	movl	-36(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -36(%ebp)
L23:
	movl	-36(%ebp), %eax
	movl	4(%eax), %eax
	testl	%eax, %eax
	jne	L30
	movl	-32(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -32(%ebp)
L22:
	cmpl	$0, -32(%ebp)
	jne	L31
	movl	-48(%ebp), %eax
	flds	-24(%ebp)
	fstps	(%eax)
	movl	-48(%ebp), %eax
	flds	-28(%ebp)
	fstps	4(%eax)
	movl	-52(%ebp), %eax
	movl	%eax, (%esp)
	call	_plfree
	movl	-56(%ebp), %eax
	movl	%eax, (%esp)
	call	_plfree
	movl	-60(%ebp), %eax
	movl	%eax, (%esp)
	call	_imfree
	movl	-64(%ebp), %eax
	movl	%eax, (%esp)
	call	_imfree
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_totalreward
	fstps	-92(%ebp)
	movl	-92(%ebp), %eax
	movl	%eax, -92(%ebp)
	flds	-92(%ebp)
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE25:
	.globl	_sspfree
	.def	_sspfree;	.scl	2;	.type	32;	.endef
_sspfree:
LFB26:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, (%esp)
	call	_free
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_free
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE26:
	.globl	_szequals
	.def	_szequals;	.scl	2;	.type	32;	.endef
_szequals:
LFB27:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$8, %esp
	movl	12(%ebp), %eax
	flds	(%eax)
	movl	8(%ebp), %eax
	flds	(%eax)
	fxch	%st(1)
	fstps	4(%esp)
	fstps	(%esp)
	call	_floatequals
	testl	%eax, %eax
	je	L36
	movl	12(%ebp), %eax
	flds	4(%eax)
	movl	8(%ebp), %eax
	flds	4(%eax)
	fxch	%st(1)
	fstps	4(%esp)
	fstps	(%esp)
	call	_floatequals
	testl	%eax, %eax
	je	L36
	movl	12(%ebp), %eax
	flds	8(%eax)
	movl	8(%ebp), %eax
	flds	8(%eax)
	fxch	%st(1)
	fstps	4(%esp)
	fstps	(%esp)
	call	_floatequals
	testl	%eax, %eax
	je	L36
	movl	12(%ebp), %eax
	flds	12(%eax)
	movl	8(%ebp), %eax
	flds	12(%eax)
	fxch	%st(1)
	fstps	4(%esp)
	fstps	(%esp)
	call	_floatequals
	testl	%eax, %eax
	je	L36
	movl	$1, %eax
	jmp	L38
L36:
	movl	$0, %eax
L38:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE27:
	.globl	_totalreward
	.def	_totalreward;	.scl	2;	.type	32;	.endef
_totalreward:
LFB28:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	fldz
	fstps	-12(%ebp)
	movl	$0, -16(%ebp)
	jmp	L40
L41:
	movl	8(%ebp), %eax
	movl	4(%eax), %ecx
	movl	-16(%ebp), %edx
	movl	%edx, %eax
	sall	$2, %eax
	addl	%edx, %eax
	sall	$2, %eax
	leal	(%ecx,%eax), %edx
	movl	8(%ebp), %eax
	addl	$8, %eax
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_reward
	flds	-12(%ebp)
	faddp	%st, %st(1)
	fstps	-12(%ebp)
	addl	$1, -16(%ebp)
L40:
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	cmpl	-16(%ebp), %eax
	jg	L41
	flds	-12(%ebp)
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE28:
	.section .rdata,"dr"
	.align 8
LC0:
	.long	1202590843
	.long	1065646817
	.align 8
LC3:
	.long	1202590843
	.long	-1081836831
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_calloc;	.scl	2;	.type	32;	.endef
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_fmin;	.scl	2;	.type	32;	.endef
	.def	_fmax;	.scl	2;	.type	32;	.endef
	.def	_pladd;	.scl	2;	.type	32;	.endef
	.def	_imadd;	.scl	2;	.type	32;	.endef
	.def	_newpl;	.scl	2;	.type	32;	.endef
	.def	_newim;	.scl	2;	.type	32;	.endef
	.def	_evaluate;	.scl	2;	.type	32;	.endef
	.def	_plfree;	.scl	2;	.type	32;	.endef
	.def	_imfree;	.scl	2;	.type	32;	.endef
	.def	_free;	.scl	2;	.type	32;	.endef
