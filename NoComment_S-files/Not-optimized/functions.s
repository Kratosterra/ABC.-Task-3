	.file	"functions.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"--\320\242\320\276\321\207\320\272\320\260 %d----------------------------\n"
	.align 8
.LC1:
	.string	"\320\222\320\262\320\265\320\264\320\270\321\202\320\265 \320\272\320\276\320\276\321\200\320\264\320\270\320\275\320\260\321\202\321\203 x \321\202\320\276\321\207\320\272\320\270 [%d]: "
.LC2:
	.string	"%lf"
	.align 8
.LC3:
	.string	"\320\222\320\262\320\265\320\264\320\270\321\202\320\265 \320\272\320\276\320\276\321\200\320\264\320\270\320\275\320\260\321\202\321\203 y \321\202\320\276\321\207\320\272\320\270 [%d]: "
	.text
	.globl	get_points
	.type	get_points, @function
get_points:
.LFB6:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	DWORD PTR -8[rbp], 1
	mov	DWORD PTR -4[rbp], 1
	jmp	.L2
.L5:
	mov	eax, DWORD PTR -4[rbp]
	and	eax, 1
	test	eax, eax
	je	.L3
	mov	eax, DWORD PTR -8[rbp]
	mov	esi, eax
	lea	rax, .LC0[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, DWORD PTR -8[rbp]
	mov	esi, eax
	lea	rax, .LC1[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	sal	rax, 3
	lea	rdx, -8[rax]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	rsi, rax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
	jmp	.L4
.L3:
	mov	eax, DWORD PTR -8[rbp]
	lea	edx, 1[rax]
	mov	DWORD PTR -8[rbp], edx
	mov	esi, eax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	sal	rax, 3
	lea	rdx, -8[rax]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	rsi, rax
	lea	rax, .LC2[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
.L4:
	add	DWORD PTR -4[rbp], 1
.L2:
	cmp	DWORD PTR -4[rbp], 8
	jle	.L5
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	get_points, .-get_points
	.globl	generate_points
	.type	generate_points, @function
generate_points:
.LFB7:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	mov	QWORD PTR -8[rbp], 0
	jmp	.L7
.L8:
	call	rand@PLT
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, eax
	movsd	xmm0, QWORD PTR .LC4[rip]
	mulsd	xmm0, xmm1
	movsd	xmm2, QWORD PTR .LC5[rip]
	movapd	xmm1, xmm0
	divsd	xmm1, xmm2
	mov	rax, QWORD PTR -8[rbp]
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movsd	xmm0, QWORD PTR .LC6[rip]
	addsd	xmm0, xmm1
	movsd	QWORD PTR [rax], xmm0
	add	QWORD PTR -8[rbp], 1
.L7:
	cmp	QWORD PTR -8[rbp], 7
	jbe	.L8
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	generate_points, .-generate_points
	.section	.rodata
.LC7:
	.string	"r"
.LC9:
	.string	"%lf "
	.text
	.globl	get_points_file
	.type	get_points_file, @function
get_points_file:
.LFB8:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48
	mov	QWORD PTR -40[rbp], rdi
	mov	QWORD PTR -48[rbp], rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	rax, QWORD PTR -48[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC7[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -16[rbp], rax
	mov	DWORD PTR -28[rbp], 0
	pxor	xmm0, xmm0
	movsd	QWORD PTR -24[rbp], xmm0
	jmp	.L10
.L12:
	mov	eax, DWORD PTR -28[rbp]
	lea	edx, 1[rax]
	mov	DWORD PTR -28[rbp], edx
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rdx
	movsd	xmm0, QWORD PTR -24[rbp]
	movsd	QWORD PTR [rax], xmm0
.L10:
	lea	rdx, -24[rbp]
	mov	rax, QWORD PTR -16[rbp]
	lea	rcx, .LC9[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	test	eax, eax
	jle	.L11
	cmp	DWORD PTR -28[rbp], 7
	jle	.L12
.L11:
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	fclose@PLT
	nop
	mov	rax, QWORD PTR -8[rbp]
	sub	rax, QWORD PTR fs:40
	je	.L13
	call	__stack_chk_fail@PLT
.L13:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	get_points_file, .-get_points_file
	.section	.rodata
	.align 8
.LC10:
	.string	"\320\237\321\200\320\276\320\270\320\267\320\262\320\276\320\264\320\270\320\274 \320\263\320\265\320\275\320\265\321\200\320\260\321\206\320\270\321\216!"
.LC11:
	.string	"rb+"
	.align 8
.LC12:
	.string	"\320\222\320\275\320\270\320\274\320\260\320\275\320\270\320\265: \320\244\320\260\320\271\320\273 \320\262\321\213\320\262\320\276\320\264\320\260 \320\275\320\265 \320\276\320\261\320\275\320\260\321\200\321\203\320\266\320\265\320\275 \320\270\320\273\320\270 \320\275\320\265\320\264\320\276\321\201\321\202\321\203\320\277\320\265\320\275! \320\236\320\275 \320\261\321\203\320\264\320\265\321\202 \321\201\320\276\320\267\320\264\320\260\320\275."
	.align 8
.LC13:
	.string	"\320\237\321\200\320\276\320\270\320\267\320\262\320\276\320\264\320\270\320\274 c\321\207\320\270\321\202\321\213\320\262\320\260\320\275\320\270\320\265 \320\270\320\267 \321\204\320\260\320\271\320\273\320\276\320\262!"
	.align 8
.LC14:
	.string	"\320\244\320\260\320\271\320\273 \320\262\320\262\320\276\320\264\320\260 \320\275\320\265 \320\276\320\261\320\275\320\260\321\200\321\203\320\266\320\265\320\275 \320\270\320\273\320\270 \320\275\320\265\320\264\320\276\321\201\321\202\321\203\320\277\320\265\320\275!"
	.align 8
.LC15:
	.string	"\320\235\320\260\321\207\320\270\320\275\320\260\320\265\320\274 \321\200\320\260\320\261\320\276\321\202\321\203 \320\262 \320\272\320\276\320\275\321\201\320\276\320\273\321\214\320\275\320\276\320\274 \321\200\320\265\320\266\320\270\320\274\320\265!"
	.align 8
.LC16:
	.string	"\320\235\320\265\320\262\320\265\321\200\320\275\320\276\320\265 \320\272\320\276\320\273\320\270\321\207\320\265\321\201\321\202\320\262\320\276 \320\277\320\260\321\200\320\260\320\274\320\265\321\202\321\200\320\276\320\262, \320\270\321\205 \320\262\321\201\320\265\320\263\320\264\320\260 4 - \320\270 \321\204\320\260\320\271\320\273\321\213 [-g] (\320\263\320\265\320\275\320\265\321\200\320\260\321\206\320\270\321\217) \320\270\320\273\320\270 2 - \320\262\321\205\320\276\320\264\320\275\320\276\320\271 \320\270 \320\262\321\213\321\205\320\276\320\264\320\275\320\276\320\271 \321\204\320\260\320\271\320\273"
	.text
	.globl	get_type_of_work
	.type	get_type_of_work, @function
get_type_of_work:
.LFB9:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 48
	mov	DWORD PTR -36[rbp], edi
	mov	QWORD PTR -48[rbp], rsi
	cmp	DWORD PTR -36[rbp], 4
	jne	.L15
	lea	rax, .LC10[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	rax, QWORD PTR -48[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC11[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -8[rbp], rax
	cmp	QWORD PTR -8[rbp], 0
	jne	.L16
	lea	rax, .LC12[rip]
	mov	rdi, rax
	call	puts@PLT
	jmp	.L17
.L16:
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	fclose@PLT
.L17:
	mov	eax, 2
	jmp	.L18
.L15:
	cmp	DWORD PTR -36[rbp], 3
	jne	.L19
	lea	rax, .LC13[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	rax, QWORD PTR -48[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC11[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -24[rbp], rax
	cmp	QWORD PTR -24[rbp], 0
	jne	.L20
	lea	rax, .LC14[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, -1
	jmp	.L18
.L20:
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax
	call	fclose@PLT
	mov	rax, QWORD PTR -48[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC11[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -16[rbp], rax
	cmp	QWORD PTR -16[rbp], 0
	jne	.L21
	lea	rax, .LC12[rip]
	mov	rdi, rax
	call	puts@PLT
	jmp	.L22
.L21:
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	fclose@PLT
.L22:
	mov	eax, 1
	jmp	.L18
.L19:
	cmp	DWORD PTR -36[rbp], 1
	jne	.L23
	lea	rax, .LC15[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 0
	jmp	.L18
.L23:
	lea	rax, .LC16[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, -1
.L18:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	get_type_of_work, .-get_type_of_work
	.section	.rodata
	.align 8
.LC17:
	.string	"\n---------------------\n\320\222\320\262\320\265\320\264\320\265\320\275\320\275\321\213\320\265 \320\264\320\260\320\275\320\275\321\213\320\265: "
	.align 8
.LC18:
	.string	"\320\242\320\276\321\207\320\272\320\260 %d:( x = %lf, y = %lf )\n"
	.align 8
.LC19:
	.string	"\320\247\320\270\321\201\320\273\320\276 \320\277\320\276\320\262\321\202\320\276\321\200\320\265\320\275\320\270\320\271 \320\272\320\276\320\264\320\260: %lld\n"
.LC20:
	.string	"--------------------"
	.text
	.globl	print_input
	.type	print_input, @function
print_input:
.LFB10:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi
	mov	QWORD PTR -32[rbp], rsi
	lea	rax, .LC17[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	DWORD PTR -8[rbp], 1
	mov	DWORD PTR -4[rbp], 0
	jmp	.L25
.L26:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	add	rax, 1
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	movsd	xmm0, QWORD PTR [rax]
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	rdx, QWORD PTR [rax]
	mov	eax, DWORD PTR -8[rbp]
	movapd	xmm1, xmm0
	movq	xmm0, rdx
	mov	esi, eax
	lea	rax, .LC18[rip]
	mov	rdi, rax
	mov	eax, 2
	call	printf@PLT
	add	DWORD PTR -8[rbp], 1
	add	DWORD PTR -4[rbp], 2
.L25:
	cmp	DWORD PTR -4[rbp], 7
	jle	.L26
	mov	rax, QWORD PTR -32[rbp]
	mov	rsi, rax
	lea	rax, .LC19[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	lea	rax, .LC20[rip]
	mov	rdi, rax
	call	puts@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	print_input, .-print_input
	.globl	is_in_circle
	.type	is_in_circle, @function
is_in_circle:
.LFB11:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	QWORD PTR -88[rbp], rdi
	mov	rax, QWORD PTR -88[rbp]
	movsd	xmm0, QWORD PTR [rax]
	movsd	QWORD PTR -72[rbp], xmm0
	mov	rax, QWORD PTR -88[rbp]
	movsd	xmm0, QWORD PTR 16[rax]
	movsd	QWORD PTR -64[rbp], xmm0
	mov	rax, QWORD PTR -88[rbp]
	movsd	xmm0, QWORD PTR 32[rax]
	movsd	QWORD PTR -56[rbp], xmm0
	mov	rax, QWORD PTR -88[rbp]
	movsd	xmm0, QWORD PTR 48[rax]
	movsd	QWORD PTR -48[rbp], xmm0
	mov	rax, QWORD PTR -88[rbp]
	movsd	xmm0, QWORD PTR 8[rax]
	movsd	QWORD PTR -40[rbp], xmm0
	mov	rax, QWORD PTR -88[rbp]
	movsd	xmm0, QWORD PTR 24[rax]
	movsd	QWORD PTR -32[rbp], xmm0
	mov	rax, QWORD PTR -88[rbp]
	movsd	xmm0, QWORD PTR 40[rax]
	movsd	QWORD PTR -24[rbp], xmm0
	mov	rax, QWORD PTR -88[rbp]
	movsd	xmm0, QWORD PTR 56[rax]
	movsd	QWORD PTR -16[rbp], xmm0
	movsd	xmm0, QWORD PTR -64[rbp]
	movapd	xmm1, xmm0
	mulsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR -24[rbp]
	subsd	xmm0, QWORD PTR -40[rbp]
	movapd	xmm2, xmm0
	mulsd	xmm2, QWORD PTR -48[rbp]
	movsd	xmm0, QWORD PTR -40[rbp]
	subsd	xmm0, QWORD PTR -16[rbp]
	mulsd	xmm0, QWORD PTR -56[rbp]
	addsd	xmm2, xmm0
	movsd	xmm0, QWORD PTR -16[rbp]
	subsd	xmm0, QWORD PTR -24[rbp]
	mulsd	xmm0, QWORD PTR -72[rbp]
	addsd	xmm0, xmm2
	mulsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR -56[rbp]
	movapd	xmm2, xmm0
	mulsd	xmm2, xmm0
	movsd	xmm0, QWORD PTR -16[rbp]
	subsd	xmm0, QWORD PTR -40[rbp]
	mulsd	xmm2, xmm0
	movsd	xmm0, QWORD PTR -48[rbp]
	movapd	xmm3, xmm0
	mulsd	xmm3, xmm0
	movsd	xmm0, QWORD PTR -40[rbp]
	subsd	xmm0, QWORD PTR -24[rbp]
	mulsd	xmm0, xmm3
	addsd	xmm2, xmm0
	movsd	xmm0, QWORD PTR -24[rbp]
	movapd	xmm3, xmm0
	subsd	xmm3, QWORD PTR -16[rbp]
	movsd	xmm0, QWORD PTR -72[rbp]
	movapd	xmm4, xmm0
	mulsd	xmm4, xmm0
	movsd	xmm0, QWORD PTR -40[rbp]
	movapd	xmm5, xmm0
	subsd	xmm5, QWORD PTR -24[rbp]
	movsd	xmm0, QWORD PTR -40[rbp]
	subsd	xmm0, QWORD PTR -16[rbp]
	mulsd	xmm0, xmm5
	addsd	xmm0, xmm4
	mulsd	xmm0, xmm3
	addsd	xmm0, xmm2
	mulsd	xmm0, QWORD PTR -64[rbp]
	addsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR -32[rbp]
	movapd	xmm2, xmm0
	subsd	xmm2, QWORD PTR -24[rbp]
	movsd	xmm0, QWORD PTR -72[rbp]
	movq	xmm3, QWORD PTR .LC21[rip]
	xorpd	xmm3, xmm0
	movsd	xmm0, QWORD PTR -48[rbp]
	movapd	xmm4, xmm0
	mulsd	xmm4, xmm0
	movsd	xmm0, QWORD PTR -32[rbp]
	movapd	xmm5, xmm0
	subsd	xmm5, QWORD PTR -16[rbp]
	movsd	xmm0, QWORD PTR -24[rbp]
	subsd	xmm0, QWORD PTR -16[rbp]
	mulsd	xmm0, xmm5
	addsd	xmm0, xmm4
	mulsd	xmm3, xmm0
	movsd	xmm0, QWORD PTR -40[rbp]
	subsd	xmm0, QWORD PTR -32[rbp]
	movapd	xmm4, xmm0
	mulsd	xmm4, QWORD PTR -48[rbp]
	movsd	xmm0, QWORD PTR -40[rbp]
	subsd	xmm0, QWORD PTR -24[rbp]
	mulsd	xmm0, xmm4
	addsd	xmm3, xmm0
	movsd	xmm0, QWORD PTR -48[rbp]
	mulsd	xmm0, QWORD PTR -72[rbp]
	mulsd	xmm0, QWORD PTR -72[rbp]
	addsd	xmm0, xmm3
	mulsd	xmm0, xmm2
	addsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR -56[rbp]
	movapd	xmm2, xmm0
	mulsd	xmm2, xmm0
	movsd	xmm0, QWORD PTR -40[rbp]
	subsd	xmm0, QWORD PTR -32[rbp]
	movapd	xmm3, xmm0
	mulsd	xmm3, QWORD PTR -48[rbp]
	movsd	xmm0, QWORD PTR -32[rbp]
	subsd	xmm0, QWORD PTR -16[rbp]
	mulsd	xmm0, QWORD PTR -72[rbp]
	addsd	xmm0, xmm3
	mulsd	xmm0, xmm2
	addsd	xmm1, xmm0
	movapd	xmm2, xmm1
	movsd	xmm0, QWORD PTR -48[rbp]
	movapd	xmm1, xmm0
	mulsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR -32[rbp]
	subsd	xmm0, QWORD PTR -40[rbp]
	mulsd	xmm1, xmm0
	movsd	xmm0, QWORD PTR -32[rbp]
	movapd	xmm3, xmm0
	subsd	xmm3, QWORD PTR -16[rbp]
	movsd	xmm0, QWORD PTR -72[rbp]
	movapd	xmm4, xmm0
	mulsd	xmm4, xmm0
	movsd	xmm0, QWORD PTR -40[rbp]
	movapd	xmm5, xmm0
	subsd	xmm5, QWORD PTR -32[rbp]
	movsd	xmm0, QWORD PTR -40[rbp]
	subsd	xmm0, QWORD PTR -16[rbp]
	mulsd	xmm0, xmm5
	addsd	xmm0, xmm4
	mulsd	xmm3, xmm0
	subsd	xmm1, xmm3
	movapd	xmm0, xmm1
	mulsd	xmm0, QWORD PTR -56[rbp]
	addsd	xmm0, xmm2
	movsd	QWORD PTR -8[rbp], xmm0
	pxor	xmm0, xmm0
	ucomisd	xmm0, QWORD PTR -8[rbp]
	jp	.L28
	pxor	xmm0, xmm0
	ucomisd	xmm0, QWORD PTR -8[rbp]
	jne	.L28
	mov	eax, 1
	jmp	.L30
.L28:
	mov	eax, 0
.L30:
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	is_in_circle, .-is_in_circle
	.section	.rodata
	.align 8
.LC23:
	.string	"\320\222\321\200\320\265\320\274\321\217 \320\270\321\201\320\277\320\276\320\273\320\275\320\265\320\275\320\270\321\217 \320\277\321\200\320\276\320\263\321\200\320\260\320\274\320\274\321\213: %f\n"
	.align 8
.LC24:
	.string	"\320\236\321\202\320\262\320\265\321\202 \320\262 \321\204\320\260\320\271\320\273\320\265 \320\262\321\213\320\262\320\276\320\264\320\260!"
.LC25:
	.string	"w+"
	.align 8
.LC26:
	.string	"- \320\242\320\276\321\207\320\272\320\270 \320\277\321\200\320\270\320\275\320\260\320\264\320\273\320\265\320\266\320\260\321\202 \320\276\320\272\321\200\321\203\320\266\320\275\320\276\321\201\321\202\320\270\n"
	.align 8
.LC27:
	.string	"- \320\242\320\276\321\207\320\272\320\270 \320\275\320\265 \320\277\321\200\320\270\320\275\320\260\320\264\320\273\320\265\320\266\320\260\321\202 \320\276\320\272\321\200\321\203\320\266\320\275\320\276\321\201\321\202\320\270\n"
	.align 8
.LC28:
	.string	"- \320\242\320\276\321\207\320\272\320\270 \320\277\321\200\320\270\320\275\320\260\320\264\320\273\320\265\320\266\320\260\321\202 \320\276\320\272\321\200\321\203\320\266\320\275\320\276\321\201\321\202\320\270"
	.align 8
.LC29:
	.string	"- \320\242\320\276\321\207\320\272\320\270 \320\275\320\265 \320\277\321\200\320\270\320\275\320\260\320\264\320\273\320\265\320\266\320\260\321\202 \320\276\320\272\321\200\321\203\320\266\320\275\320\276\321\201\321\202\320\270"
	.text
	.globl	check_points
	.type	check_points, @function
check_points:
.LFB12:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 96
	mov	QWORD PTR -72[rbp], rdi
	mov	DWORD PTR -76[rbp], esi
	mov	QWORD PTR -88[rbp], rdx
	mov	QWORD PTR -96[rbp], rcx
	mov	DWORD PTR -52[rbp], 0
	call	clock@PLT
	mov	QWORD PTR -40[rbp], rax
	mov	QWORD PTR -48[rbp], 0
	jmp	.L33
.L34:
	mov	rax, QWORD PTR -72[rbp]
	mov	rdi, rax
	call	is_in_circle
	mov	DWORD PTR -52[rbp], eax
	add	QWORD PTR -48[rbp], 1
.L33:
	mov	rax, QWORD PTR -48[rbp]
	cmp	rax, QWORD PTR -96[rbp]
	jl	.L34
	call	clock@PLT
	mov	QWORD PTR -32[rbp], rax
	mov	rax, QWORD PTR -32[rbp]
	sub	rax, QWORD PTR -40[rbp]
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
	movsd	xmm1, QWORD PTR .LC22[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -24[rbp], xmm0
	mov	rax, QWORD PTR -24[rbp]
	movq	xmm0, rax
	lea	rax, .LC23[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	cmp	DWORD PTR -76[rbp], 1
	jne	.L35
	lea	rax, .LC24[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	rax, QWORD PTR -88[rbp]
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC25[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -8[rbp], rax
	cmp	DWORD PTR -52[rbp], 0
	je	.L36
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	mov	edx, 57
	mov	esi, 1
	lea	rax, .LC26[rip]
	mov	rdi, rax
	call	fwrite@PLT
	jmp	.L37
.L36:
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	mov	edx, 62
	mov	esi, 1
	lea	rax, .LC27[rip]
	mov	rdi, rax
	call	fwrite@PLT
.L37:
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	fclose@PLT
	jmp	.L38
.L35:
	cmp	DWORD PTR -76[rbp], 2
	jne	.L39
	lea	rax, .LC24[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	rax, QWORD PTR -88[rbp]
	add	rax, 24
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC25[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -16[rbp], rax
	cmp	DWORD PTR -52[rbp], 0
	je	.L40
	mov	rax, QWORD PTR -16[rbp]
	mov	rcx, rax
	mov	edx, 57
	mov	esi, 1
	lea	rax, .LC26[rip]
	mov	rdi, rax
	call	fwrite@PLT
	jmp	.L41
.L40:
	mov	rax, QWORD PTR -16[rbp]
	mov	rcx, rax
	mov	edx, 62
	mov	esi, 1
	lea	rax, .LC27[rip]
	mov	rdi, rax
	call	fwrite@PLT
.L41:
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	fclose@PLT
	jmp	.L38
.L39:
	cmp	DWORD PTR -52[rbp], 0
	je	.L42
	lea	rax, .LC28[rip]
	mov	rdi, rax
	call	puts@PLT
	jmp	.L38
.L42:
	lea	rax, .LC29[rip]
	mov	rdi, rax
	call	puts@PLT
.L38:
	lea	rax, .LC20[rip]
	mov	rdi, rax
	call	puts@PLT
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	check_points, .-check_points
	.section	.rodata
.LC30:
	.string	":%lld"
	.align 8
.LC31:
	.string	"\320\222\320\262\320\265\320\264\320\270\321\202\320\265 \321\207\320\270\321\201\320\273\320\276 \320\277\320\276\320\262\321\202\320\276\321\200\320\265\320\275\320\270\320\271 \320\277\321\200\320\276\320\263\321\200\320\260\320\274\320\274\321\213 (\320\276\321\202 1 \320\264\320\276 9223372036854775000): "
.LC32:
	.string	"%lld"
	.text
	.globl	get_number_or_repeats
	.type	get_number_or_repeats, @function
get_number_or_repeats:
.LFB13:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 64
	mov	DWORD PTR -52[rbp], edi
	mov	QWORD PTR -64[rbp], rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	mov	QWORD PTR -32[rbp], 0
	cmp	DWORD PTR -52[rbp], 1
	jne	.L48
	mov	rax, QWORD PTR -64[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC7[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -16[rbp], rax
	mov	DWORD PTR -36[rbp], 0
	pxor	xmm0, xmm0
	movsd	QWORD PTR -24[rbp], xmm0
	nop
.L46:
	lea	rdx, -24[rbp]
	mov	rax, QWORD PTR -16[rbp]
	lea	rcx, .LC9[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	test	eax, eax
	jle	.L45
	cmp	DWORD PTR -36[rbp], 7
	jle	.L46
.L45:
	lea	rdx, -32[rbp]
	mov	rax, QWORD PTR -16[rbp]
	lea	rcx, .LC30[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	mov	rax, QWORD PTR -16[rbp]
	mov	rdi, rax
	call	fclose@PLT
	jmp	.L47
.L49:
	lea	rax, .LC31[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	lea	rax, -32[rbp]
	mov	rsi, rax
	lea	rax, .LC32[rip]
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_scanf@PLT
.L48:
	mov	rax, QWORD PTR -32[rbp]
	test	rax, rax
	jle	.L49
	mov	rax, QWORD PTR -32[rbp]
	movabs	rdx, 9223372036854774999
	cmp	rax, rdx
	jg	.L49
.L47:
	mov	rax, QWORD PTR -32[rbp]
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L51
	call	__stack_chk_fail@PLT
.L51:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	get_number_or_repeats, .-get_number_or_repeats
	.section	.rodata
	.align 8
.LC4:
	.long	-549755814
	.long	1087324159
	.align 8
.LC5:
	.long	-4194304
	.long	1105199103
	.align 8
.LC6:
	.long	-755914244
	.long	1062232653
	.align 16
.LC21:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.align 8
.LC22:
	.long	0
	.long	1093567616
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
