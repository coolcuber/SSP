	.file	"structures.c"
	.text
	.globl	_addToIntMapping
	.def	_addToIntMapping;	.scl	2;	.type	32;	.endef
_addToIntMapping:
LFB4:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	movl	8(%ebp), %eax
	leal	4(%eax), %edx
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_iladd
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE4:
	.globl	_emptyILL
	.def	_emptyILL;	.scl	2;	.type	32;	.endef
_emptyILL:
LFB5:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$4, 4(%esp)
	movl	$1, (%esp)
	call	_calloc
	movl	%eax, -12(%ebp)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE5:
	.globl	_evaluate
	.def	_evaluate;	.scl	2;	.type	32;	.endef
_evaluate:
LFB6:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$16, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -4(%ebp)
	jmp	L4
L8:
	movl	-4(%ebp), %eax
	flds	(%eax)
	flds	12(%ebp)
	fucomp	%st(1)
	fnstsw	%ax
	sahf
	jp	L10
	flds	12(%ebp)
	fucompp
	fnstsw	%ax
	sahf
	jne	L5
	movl	-4(%ebp), %eax
	movl	4(%eax), %eax
	jmp	L7
L10:
	fstp	%st(0)
L5:
	movl	-4(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -4(%ebp)
L4:
	cmpl	$0, -4(%ebp)
	jne	L8
	movl	$0, %eax
L7:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE6:
	.globl	_newil
	.def	_newil;	.scl	2;	.type	32;	.endef
_newil:
LFB7:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$4, 4(%esp)
	movl	$1, (%esp)
	call	_calloc
	movl	%eax, -12(%ebp)
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_newiln
	movl	%eax, %edx
	movl	-12(%ebp), %eax
	movl	%edx, (%eax)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE7:
	.globl	_iladd
	.def	_iladd;	.scl	2;	.type	32;	.endef
_iladd:
LFB8:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_newiln
	movl	%eax, -20(%ebp)
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, -16(%ebp)
	cmpl	$0, -12(%ebp)
	jne	L14
	movl	8(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	%edx, (%eax)
	movl	-20(%ebp), %eax
	jmp	L15
L14:
	movl	-12(%ebp), %eax
	movl	(%eax), %edx
	movl	12(%ebp), %eax
	cmpl	%eax, %edx
	jne	L16
	movl	-12(%ebp), %eax
	jmp	L15
L16:
	movl	-12(%ebp), %eax
	movl	(%eax), %edx
	movl	12(%ebp), %eax
	cmpl	%eax, %edx
	jbe	L18
	movl	-20(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%eax)
	movl	8(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	%edx, (%eax)
	movl	-20(%ebp), %eax
	jmp	L15
L20:
	movl	-12(%ebp), %eax
	movl	%eax, -16(%ebp)
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -12(%ebp)
L18:
	cmpl	$0, -12(%ebp)
	je	L19
	movl	-12(%ebp), %eax
	movl	(%eax), %edx
	movl	12(%ebp), %eax
	cmpl	%eax, %edx
	jb	L20
L19:
	cmpl	$0, -12(%ebp)
	jne	L21
	movl	-16(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	%edx, 4(%eax)
	movl	-20(%ebp), %eax
	jmp	L15
L21:
	movl	-12(%ebp), %eax
	movl	(%eax), %edx
	movl	12(%ebp), %eax
	cmpl	%eax, %edx
	jne	L22
	movl	-12(%ebp), %eax
	jmp	L15
L22:
	movl	-16(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	%edx, 4(%eax)
	movl	-20(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%eax)
	movl	-20(%ebp), %eax
L15:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE8:
	.globl	_ilfree
	.def	_ilfree;	.scl	2;	.type	32;	.endef
_ilfree:
LFB9:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	$0, -16(%ebp)
	jmp	L24
L25:
	movl	-12(%ebp), %eax
	movl	%eax, -16(%ebp)
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_free
L24:
	cmpl	$0, -12(%ebp)
	jne	L25
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_free
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE9:
	.globl	_imadd
	.def	_imadd;	.scl	2;	.type	32;	.endef
_imadd:
LFB10:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	16(%ebp), %eax
	movl	%eax, 4(%esp)
	flds	12(%ebp)
	fstps	(%esp)
	call	_newIndexMapping
	movl	%eax, -20(%ebp)
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	$0, -16(%ebp)
	jmp	L27
L29:
	movl	-12(%ebp), %eax
	movl	%eax, -16(%ebp)
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -12(%ebp)
L27:
	cmpl	$0, -12(%ebp)
	je	L28
	movl	-12(%ebp), %eax
	flds	(%eax)
	flds	12(%ebp)
	fucompp
	fnstsw	%ax
	sahf
	ja	L29
L28:
	cmpl	$0, -12(%ebp)
	jne	L30
	cmpl	$0, -16(%ebp)
	jne	L31
	movl	8(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	%edx, (%eax)
	movl	-20(%ebp), %eax
	jmp	L32
L31:
	movl	-16(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	-20(%ebp), %eax
	jmp	L32
L30:
	movl	-12(%ebp), %eax
	flds	(%eax)
	flds	12(%ebp)
	fucomp	%st(1)
	fnstsw	%ax
	sahf
	jp	L37
	flds	12(%ebp)
	fucompp
	fnstsw	%ax
	sahf
	jne	L33
	movl	-12(%ebp), %eax
	leal	4(%eax), %edx
	movl	16(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_iladd
	movl	-12(%ebp), %eax
	jmp	L32
L37:
	fstp	%st(0)
L33:
	cmpl	$0, -16(%ebp)
	jne	L35
	movl	8(%ebp), %eax
	movl	(%eax), %edx
	movl	-20(%ebp), %eax
	movl	%edx, 8(%eax)
	movl	8(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	%edx, (%eax)
	movl	-20(%ebp), %eax
	jmp	L32
L35:
	movl	-16(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	-20(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 8(%eax)
	movl	-20(%ebp), %eax
L32:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE10:
	.globl	_imfree
	.def	_imfree;	.scl	2;	.type	32;	.endef
_imfree:
LFB11:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	$0, -16(%ebp)
	jmp	L39
L40:
	movl	-12(%ebp), %eax
	movl	%eax, -16(%ebp)
	movl	-12(%ebp), %eax
	movl	8(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_free
L39:
	cmpl	$0, -12(%ebp)
	jne	L40
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_free
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE11:
	.globl	_newiln
	.def	_newiln;	.scl	2;	.type	32;	.endef
_newiln:
LFB12:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$8, 4(%esp)
	movl	$1, (%esp)
	call	_calloc
	movl	%eax, -12(%ebp)
	movl	8(%ebp), %edx
	movl	-12(%ebp), %eax
	movl	%edx, (%eax)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE12:
	.globl	_newIndexMapping
	.def	_newIndexMapping;	.scl	2;	.type	32;	.endef
_newIndexMapping:
LFB13:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$12, 4(%esp)
	movl	$1, (%esp)
	call	_calloc
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	flds	8(%ebp)
	fstps	(%eax)
	movl	12(%ebp), %eax
	movl	%eax, (%esp)
	call	_newil
	movl	(%eax), %edx
	movl	-12(%ebp), %eax
	movl	%edx, 4(%eax)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE13:
	.globl	_newim
	.def	_newim;	.scl	2;	.type	32;	.endef
_newim:
LFB14:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$4, 4(%esp)
	movl	$1, (%esp)
	call	_calloc
	movl	%eax, -12(%ebp)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE14:
	.globl	_newpl
	.def	_newpl;	.scl	2;	.type	32;	.endef
_newpl:
LFB15:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$4, 4(%esp)
	movl	$1, (%esp)
	call	_calloc
	movl	%eax, -12(%ebp)
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE15:
	.globl	_newpln
	.def	_newpln;	.scl	2;	.type	32;	.endef
_newpln:
LFB16:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	$8, 4(%esp)
	movl	$1, (%esp)
	call	_calloc
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	flds	8(%ebp)
	fstps	(%eax)
	movl	-12(%ebp), %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE16:
	.globl	_pladd
	.def	_pladd;	.scl	2;	.type	32;	.endef
_pladd:
LFB17:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	flds	12(%ebp)
	fstps	(%esp)
	call	_newpln
	movl	%eax, -20(%ebp)
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	-12(%ebp), %eax
	movl	%eax, -16(%ebp)
	cmpl	$0, -12(%ebp)
	jne	L50
	movl	8(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	%edx, (%eax)
	movl	-20(%ebp), %eax
	jmp	L51
L50:
	movl	-12(%ebp), %eax
	flds	(%eax)
	flds	12(%ebp)
	fucomp	%st(1)
	fnstsw	%ax
	sahf
	jp	L66
	flds	12(%ebp)
	fucompp
	fnstsw	%ax
	sahf
	jne	L52
	movl	-12(%ebp), %eax
	jmp	L51
L66:
	fstp	%st(0)
L52:
	movl	-12(%ebp), %eax
	flds	(%eax)
	flds	12(%ebp)
	fxch	%st(1)
	fucompp
	fnstsw	%ax
	sahf
	jbe	L65
	movl	-20(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%eax)
	movl	8(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	%edx, (%eax)
	movl	-20(%ebp), %eax
	jmp	L51
L65:
	jmp	L56
L58:
	movl	-12(%ebp), %eax
	movl	%eax, -16(%ebp)
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -12(%ebp)
L56:
	cmpl	$0, -12(%ebp)
	je	L57
	movl	-12(%ebp), %eax
	flds	(%eax)
	flds	12(%ebp)
	fucompp
	fnstsw	%ax
	sahf
	ja	L58
L57:
	cmpl	$0, -12(%ebp)
	jne	L59
	movl	-16(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	%edx, 4(%eax)
	movl	-20(%ebp), %eax
	jmp	L51
L59:
	movl	-12(%ebp), %eax
	flds	(%eax)
	flds	12(%ebp)
	fucomp	%st(1)
	fnstsw	%ax
	sahf
	jp	L67
	flds	12(%ebp)
	fucompp
	fnstsw	%ax
	sahf
	jne	L60
	movl	-12(%ebp), %eax
	jmp	L51
L67:
	fstp	%st(0)
L60:
	movl	-16(%ebp), %eax
	movl	-20(%ebp), %edx
	movl	%edx, 4(%eax)
	movl	-20(%ebp), %eax
	movl	-12(%ebp), %edx
	movl	%edx, 4(%eax)
	movl	-20(%ebp), %eax
L51:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE17:
	.globl	_plfree
	.def	_plfree;	.scl	2;	.type	32;	.endef
_plfree:
LFB18:
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$40, %esp
	movl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	$0, -16(%ebp)
	jmp	L69
L70:
	movl	-12(%ebp), %eax
	movl	%eax, -16(%ebp)
	movl	-12(%ebp), %eax
	movl	4(%eax), %eax
	movl	%eax, -12(%ebp)
	movl	-16(%ebp), %eax
	movl	%eax, (%esp)
	call	_free
L69:
	cmpl	$0, -12(%ebp)
	jne	L70
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_free
	nop
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
LFE18:
	.ident	"GCC: (MinGW.org GCC-6.3.0-1) 6.3.0"
	.def	_calloc;	.scl	2;	.type	32;	.endef
	.def	_free;	.scl	2;	.type	32;	.endef
