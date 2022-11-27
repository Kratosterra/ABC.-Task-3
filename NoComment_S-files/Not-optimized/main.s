	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"\320\237\321\200\320\276\320\270\320\267\320\276\321\210\320\273\320\260 \320\276\321\210\320\270\320\261\320\272\320\260 \320\270\321\201\320\277\320\276\320\273\320\275\320\265\320\275\320\270\321\217!\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	add	rsp, -128
	mov	DWORD PTR -116[rbp], edi
	mov	QWORD PTR -128[rbp], rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	QWORD PTR -88[rbp], 0
	mov	rdx, QWORD PTR -128[rbp]
	mov	eax, DWORD PTR -116[rbp]
	mov	rsi, rdx
	mov	edi, eax
	call	get_type_of_work@PLT
	mov	DWORD PTR -100[rbp], eax
	cmp	DWORD PTR -100[rbp], 0
	jne	.L2
	mov	rdx, QWORD PTR -128[rbp]
	mov	eax, DWORD PTR -100[rbp]
	mov	rsi, rdx
	mov	edi, eax
	call	get_number_or_repeats@PLT
	mov	QWORD PTR -88[rbp], rax
	lea	rax, -80[rbp]
	mov	rdi, rax
	call	get_points@PLT
	jmp	.L3
.L2:
	cmp	DWORD PTR -100[rbp], 1
	jne	.L4
	mov	rdx, QWORD PTR -128[rbp]
	mov	eax, DWORD PTR -100[rbp]
	mov	rsi, rdx
	mov	edi, eax
	call	get_number_or_repeats@PLT
	mov	QWORD PTR -88[rbp], rax
	mov	rdx, QWORD PTR -128[rbp]
	lea	rax, -80[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	get_points_file@PLT
	jmp	.L3
.L4:
	cmp	DWORD PTR -100[rbp], 2
	jne	.L5
	lea	rax, -80[rbp]
	mov	rdi, rax
	call	generate_points@PLT
	mov	rax, QWORD PTR -128[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rcx, -96[rbp]
	mov	edx, 10
	mov	rsi, rcx
	mov	rdi, rax
	call	strtol@PLT
	mov	QWORD PTR -88[rbp], rax
	jmp	.L3
.L5:
	lea	rax, .LC0[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 0
	jmp	.L6
.L3:
	mov	rdx, QWORD PTR -88[rbp]
	lea	rax, -80[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	print_input@PLT
	mov	rcx, QWORD PTR -88[rbp]
	mov	rdx, QWORD PTR -128[rbp]
	mov	esi, DWORD PTR -100[rbp]
	lea	rax, -80[rbp]
	mov	rdi, rax
	call	check_points@PLT
	mov	eax, 0
.L6:
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L7
	call	__stack_chk_fail@PLT
.L7:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
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
