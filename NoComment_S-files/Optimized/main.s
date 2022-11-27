	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"\320\237\321\200\320\276\320\270\320\267\320\276\321\210\320\273\320\260 \320\276\321\210\320\270\320\261\320\272\320\260 \320\270\321\201\320\277\320\276\320\273\320\275\320\265\320\275\320\270\321\217!\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB39:
	.cfi_startproc
	endbr64
	push	r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	push	r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	push	r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	mov	r12, rsi
	push	rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	sub	rsp, 104
	.cfi_def_cfa_offset 144
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 88[rsp], rax
	xor	eax, eax
	call	get_type_of_work@PLT
	mov	ebp, eax
	test	eax, eax
	je	.L10
	cmp	eax, 1
	je	.L11
	cmp	eax, 2
	je	.L12
	lea	rdi, .LC0[rip]
	call	puts@PLT
.L6:
	mov	rax, QWORD PTR 88[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L13
	add	rsp, 104
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	xor	eax, eax
	pop	rbp
	.cfi_def_cfa_offset 32
	pop	r12
	.cfi_def_cfa_offset 24
	pop	r13
	.cfi_def_cfa_offset 16
	pop	r14
	.cfi_def_cfa_offset 8
	ret
.L12:
	.cfi_restore_state
	lea	r14, 16[rsp]
	mov	rdi, r14
	call	generate_points@PLT
	mov	rdi, QWORD PTR 16[r12]
	lea	rsi, 8[rsp]
	mov	edx, 10
	call	strtol@PLT
	mov	r13, rax
.L3:
	mov	rsi, r13
	mov	rdi, r14
	call	print_input@PLT
	mov	rcx, r13
	mov	rdx, r12
	mov	esi, ebp
	mov	rdi, r14
	call	check_points@PLT
	jmp	.L6
.L10:
	xor	edi, edi
	mov	rsi, r12
	lea	r14, 16[rsp]
	call	get_number_or_repeats@PLT
	mov	rdi, r14
	mov	r13, rax
	call	get_points@PLT
	jmp	.L3
.L11:
	mov	rsi, r12
	mov	edi, 1
	lea	r14, 16[rsp]
	call	get_number_or_repeats@PLT
	mov	rsi, r12
	mov	rdi, r14
	mov	r13, rax
	call	get_points_file@PLT
	jmp	.L3
.L13:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE39:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
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
