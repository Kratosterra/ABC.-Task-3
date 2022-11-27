	.file	"functions.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
	.align 8
.LC1:
	.string	"\320\222\321\200\320\265\320\274\321\217 \320\270\321\201\320\277\320\276\320\273\320\275\320\265\320\275\320\270\321\217 \320\277\321\200\320\276\320\263\321\200\320\260\320\274\320\274\321\213: %f\n"
	.align 8
.LC2:
	.string	"\320\236\321\202\320\262\320\265\321\202 \320\262 \321\204\320\260\320\271\320\273\320\265 \320\262\321\213\320\262\320\276\320\264\320\260!\n"
.LC3:
	.string	"w+"
	.align 8
.LC4:
	.string	"- \320\242\320\276\321\207\320\272\320\270 \320\277\321\200\320\270\320\275\320\260\320\264\320\273\320\265\320\266\320\260\321\202 \320\276\320\272\321\200\321\203\320\266\320\275\320\276\321\201\321\202\320\270\n"
	.align 8
.LC5:
	.string	"- \320\242\320\276\321\207\320\272\320\270 \320\275\320\265 \320\277\321\200\320\270\320\275\320\260\320\264\320\273\320\265\320\266\320\260\321\202 \320\276\320\272\321\200\321\203\320\266\320\275\320\276\321\201\321\202\320\270\n"
.LC6:
	.string	"--------------------\n"
	.text
	.p2align 4
	.globl	check_points
	.type	check_points, @function
# Function that checks points and print answer. Resiving points (rdi), choice (esi), argv (rdx), num_of_rep (rcx) and return nothing.
check_points:
.LFB45:
	.cfi_startproc
	endbr64	
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 208
	# (-184) <- points (rdi)
	mov	QWORD PTR -184[rbp], rdi
	# (-188) <- choice (esi)
	mov	DWORD PTR -188[rbp], esi
	# (-200) <- argv (rdx)
	mov	QWORD PTR -200[rbp], rdx
	# (-208) <- num_of_rep (rcx)
	mov	QWORD PTR -208[rbp], rcx
# int answer = 0;
# answer (-164) = 0
	mov	DWORD PTR -164[rbp], 0
# clock_t begin = clock();
	call	clock@PLT
# begin (-152) = clock() (rax)
	mov	QWORD PTR -152[rbp], rax
# for (long long i = 0; i < num_of_rep; i++)
# i = 0
	mov	QWORD PTR -160[rbp], 0	
	jmp	.L2
.L3:
# answer = is_in_circle(points);
# rax <- points (-184)
	mov	rax, QWORD PTR -184[rbp]	
	mov	rdi, rax	
	call	is_in_circle
# answer (-164) <- eax
	mov	DWORD PTR -164[rbp], eax
# i (-160) += 1
	add	QWORD PTR -160[rbp], 1	# i,
.L2:
# for (long long i = 0; i < num_of_rep; i++)
# rax <- i(-160)
	mov	rax, QWORD PTR -160[rbp]	
# compare i (rax) and num_of_rep (-208)
	cmp	rax, QWORD PTR -208[rbp]	
	jl	.L3
# clock_t end = clock();
	call	clock@PLT
# end (-144) <- rax
	mov	QWORD PTR -144[rbp], rax
# double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
# rax <- end (-144)
	mov	rax, QWORD PTR -144[rbp]
# rax -= begin (-152)
	sub	rax, QWORD PTR -152[rbp]
# double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
# double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
	movsd	xmm1, QWORD PTR .LC0[rip]
	divsd	xmm0, xmm1
# time_spent (-136)
	movsd	QWORD PTR -136[rbp], xmm0
	lea	rax, .LC1[rip]
	mov	QWORD PTR -112[rbp], rax
# rdx <- time_spent (-136)
	mov	rdx, QWORD PTR -136[rbp]
# rax <- (-112)
	mov	rax, QWORD PTR -112[rbp]
	movq	xmm0, rdx
	mov	rsi, rax
	mov	edi, 1
	mov	eax, 1
	call	__printf_chk@PLT
# if (choice == 1)
# compare choice (-188) and i
	cmp	DWORD PTR -188[rbp], 1
	jne	.L4
	lea	rax, .LC2[rip]
	mov	QWORD PTR -104[rbp], rax
	mov	rax, QWORD PTR -104[rbp]
	mov	rsi, rax
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
# FILE *f = fopen(argv[2], "w+");
# rax <- argv (-200)
	mov	rax, QWORD PTR -200[rbp]	
	add	rax, 16
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC3[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
# f (-120) <- rax
	mov	QWORD PTR -120[rbp], rax
# if (answer)
# compare answer (-164) and 0 
	cmp	DWORD PTR -164[rbp], 0
	je	.L5
# rax <- f (-120)
	mov	rax, QWORD PTR -120[rbp]
	mov	QWORD PTR -96[rbp], rax	
	lea	rax, .LC4[rip]
	mov	QWORD PTR -88[rbp], rax
	mov	rdx, QWORD PTR -88[rbp]
	mov	rax, QWORD PTR -96[rbp]
	mov	esi, 1
	mov	rdi, rax
	mov	eax, 0
	call	__fprintf_chk@PLT
	jmp	.L6
.L5:
# rax <- f (-120)
	mov	rax, QWORD PTR -120[rbp]
# (-80) <- f (rax)
	mov	QWORD PTR -80[rbp], rax
# rax <- str
	lea	rax, .LC5[rip]	
# (-72) <- str (rax)
	mov	QWORD PTR -72[rbp], rax	
# rdx <- str (-72)
	mov	rdx, QWORD PTR -72[rbp]
# rax <- (-80)
	mov	rax, QWORD PTR -80[rbp]	
	mov	esi, 1
	mov	rdi, rax
	mov	eax, 0
	call	__fprintf_chk@PLT
.L6:
# fclose(f);
# rax <- f (-120)
	mov	rax, QWORD PTR -120[rbp]
# rdi <- f (rax)	
	mov	rdi, rax
	call	fclose@PLT
	jmp	.L7
.L4:
# else if (choice == 2)
# compare choice (-188) and 2
	cmp	DWORD PTR -188[rbp], 2
	jne	.L8
# rax <- str
	lea	rax, .LC2[rip]
# (-64) <- str (rax)
	mov	QWORD PTR -64[rbp], rax	
# rax <- str (-64)
	mov	rax, QWORD PTR -64[rbp]
# rsi <- str (rax)
	mov	rsi, rax
	mov	edi, 1	
	mov	eax, 0
	call	__printf_chk@PLT
# FILE *f = fopen(argv[3], "w+");
# rax <- argv (-200)
	mov	rax, QWORD PTR -200[rbp]
	add	rax, 24	
# FILE *f = fopen(argv[3], "w+");
	mov	rax, QWORD PTR [rax]
# rdx <- str
	lea	rdx, .LC3[rip]
# rsi <- str (rdx)
	mov	rsi, rdx
# rdi <- rax
	mov	rdi, rax
	call	fopen@PLT
# f (-128) <- rax
	mov	QWORD PTR -128[rbp], rax	
# if (answer)
# compare answer (-164) and 0
	cmp	DWORD PTR -164[rbp], 0	
	je	.L9	
# rax <- f (-128)
	mov	rax, QWORD PTR -128[rbp]
	mov	QWORD PTR -56[rbp], rax	
	lea	rax, .LC4[rip]	
	mov	QWORD PTR -48[rbp], rax	
	mov	rdx, QWORD PTR -48[rbp]	
	mov	rax, QWORD PTR -56[rbp]	
	mov	esi, 1	
	mov	rdi, rax
	mov	eax, 0
	call	__fprintf_chk@PLT
	jmp	.L10
.L9:
# rax <- f(-128)
	mov	rax, QWORD PTR -128[rbp]
# stream (-40) <- f (rax)
	mov	QWORD PTR -40[rbp], rax
# rax <- str
	lea	rax, .LC5[rip]
# (-32) <- str (rax)
	mov	QWORD PTR -32[rbp], rax	
# rdx <- str (-32)
	mov	rdx, QWORD PTR -32[rbp]
# rax <- stream (-40)
	mov	rax, QWORD PTR -40[rbp]
	mov	esi, 1
	mov	rdi, rax
	mov	eax, 0
	call	__fprintf_chk@PLT
.L10:
# fclose(f);
# rax <- f (-128)
	mov	rax, QWORD PTR -128[rbp]
# rdi <- f (rax)
	mov	rdi, rax
	call	fclose@PLT
	jmp	.L7
.L8:
# if (answer)
# compare answer (-164) and 0 
	cmp	DWORD PTR -164[rbp], 0
	je	.L11
# rax <- str
	lea	rax, .LC4[rip]
# (-24) <- str(rax)
	mov	QWORD PTR -24[rbp], rax	
# rax <- str (-24)
	mov	rax, QWORD PTR -24[rbp]
# rsi <- str (rax)
	mov	rsi, rax
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
	jmp	.L7
.L11:
# rax <- str 
	lea	rax, .LC5[rip]
# (-16) <- str (rax)
	mov	QWORD PTR -16[rbp], rax	
# rax <- str (-16)
	mov	rax, QWORD PTR -16[rbp]
	mov	rsi, rax
	mov	edi, 1
	mov	eax, 0
	call	__printf_chk@PLT
.L7:
# rax <- str
	lea	rax, .LC6[rip]
# (-8) <- rax (rax)
	mov	QWORD PTR -8[rbp], rax
# rax <- str (-8)
	mov	rax, QWORD PTR -8[rbp]
# rsi <- str (rax)
	mov	rsi, rax
	mov	edi, 1	
	mov	eax, 0
	call	__printf_chk@PLT
# }
# END
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE45:
	.size	check_points, .-check_points
	.section	.rodata
	.align 8
.LC7:
	.string	"--\320\242\320\276\321\207\320\272\320\260 %d----------------------------\n"
	.align 8
.LC8:
	.string	"\320\222\320\262\320\265\320\264\320\270\321\202\320\265 \320\272\320\276\320\276\321\200\320\264\320\270\320\275\320\260\321\202\321\203 x \321\202\320\276\321\207\320\272\320\270 [%d]: "
.LC9:
	.string	"%lf"
	.align 8
.LC10:
	.string	"\320\222\320\262\320\265\320\264\320\270\321\202\320\265 \320\272\320\276\320\276\321\200\320\264\320\270\320\275\320\260\321\202\321\203 y \321\202\320\276\321\207\320\272\320\270 [%d]: "
	.text
	.p2align 4
	.globl	get_points
	.type	get_points, @function
# Function that gets points from user. Resiving ref to points.
get_points:
.LFB39:
	.cfi_startproc
	endbr64	
	push	r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
# r15 <- str
	lea	r15, .LC10[rip]
# {
	push	r14	
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
# for (int i = 1; i < 9; ++i)
# i (r14d) = 1
	mov	r14d, 1
	push	r13	
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
# int n = 1;
# n (r13d) = 1;
	mov	r13d, 1
	push	r12	
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
# r12 <- str
	lea	r12, .LC9[rip]
	push	rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	mov	rbx, rdi
	sub	rsp, 16
	.cfi_def_cfa_offset 64
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L20:
# edx <- n (r13d)
	mov	edx, r13d
# rsi <- str
	lea	rsi, .LC7[rip]
# eax = 0
	xor	eax, eax
# for (int i = 1; i < 9; ++i)
# i (r14d) += 1
	add	r14d, 1
	mov	edi, 1
	call	__printf_chk@PLT
# edx <- n (r13d)
	mov	edx, r13d
# edi = 1
	mov	edi, 1
# eax = 0
	xor	eax, eax
# rsi <- str
	lea	rsi, .LC8[rip]
	call	__printf_chk@PLT
# scanf("%lf", &points[i - 1]);
	mov	rsi, rbx
	mov	rdi, r12	
	xor	eax, eax	
	call	__isoc99_scanf@PLT	
# for (int i = 1; i < 9; ++i)
	add	rbx, 8
# compare i (r14d) and 9
	cmp	r14d, 9	
	je	.L19
.L15:
# if (i % 2 != 0)
# test i (r14b) and 1
	test	r14b, 1	
	jne	.L20
# printf("Введите координату y точки [%d]: ", n++);
# eax <- n (1[r13])
	lea	eax, 1[r13]	
# edx <- n (r13d)
	mov	edx, r13d
# rsi <- r15
	mov	rsi, r15
# edi = 1;
	mov	edi, 1
# printf("Введите координату y точки [%d]: ", n++);
# (12) <- n (eax)
	mov	DWORD PTR 12[rsp], eax
	xor	eax, eax
# for (int i = 1; i < 9; ++i)
# i (r14d) += 1
	add	r14d, 1
	call	__printf_chk@PLT	
# scanf("%lf", &points[i - 1]);
	mov	rsi, rbx
	mov	rdi, r12
	xor	eax, eax
	call	__isoc99_scanf@PLT
# for (int i = 1; i < 9; ++i)
	add	rbx, 8
# printf("Введите координату y точки [%d]: ", n++);
# n (r13d) <- (12)
	mov	r13d, DWORD PTR 12[rsp]
# for (int i = 1; i < 9; ++i)
# compare i (r14d) and 9
	cmp	r14d, 9	
	jne	.L15
.L19:
# }
	add	rsp, 16	
	.cfi_def_cfa_offset 48
	pop	rbx	
	.cfi_def_cfa_offset 40
	pop	r12	
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14	
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE39:
	.size	get_points, .-get_points
	.p2align 4
	.globl	generate_points
	.type	generate_points, @function
# Function that generate points. Resiving ref to points (rdi) and return nothing;
generate_points:
.LFB40:
	.cfi_startproc
	endbr64	
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
# r12 <- points (rdi)
	mov	r12, rdi
# srand(time(0));
# edi = 0
	xor	edi, edi
# {
	push	rbx	
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	lea	rbx, 64[r12]
	sub	rsp, 8
	.cfi_def_cfa_offset 32
	call	time@PLT
# fsrand(time(0));
	mov	edi, eax
	call	srand@PLT
	.p2align 4,,10
	.p2align 3
.L22:
# points[i] = ((double)rand() * (16000.00 - 0.001)) / (double)RAND_MAX + 0.001;
	call	rand@PLT
# points[i] = ((double)rand() * (16000.00 - 0.001)) / (double)RAND_MAX + 0.001;
	pxor	xmm0, xmm0
# for (size_t i = 0; i < 8; i++)
	add	r12, 8
# points[i] = ((double)rand() * (16000.00 - 0.001)) / (double)RAND_MAX + 0.001;
	cvtsi2sd	xmm0, eax	
# points[i] = ((double)rand() * (16000.00 - 0.001)) / (double)RAND_MAX + 0.001;
	mulsd	xmm0, QWORD PTR .LC11[rip]	
# points[i] = ((double)rand() * (16000.00 - 0.001)) / (double)RAND_MAX + 0.001;
	divsd	xmm0, QWORD PTR .LC12[rip]	
# points[i] = ((double)rand() * (16000.00 - 0.001)) / (double)RAND_MAX + 0.001;
	addsd	xmm0, QWORD PTR .LC13[rip]	
# points[i] = ((double)rand() * (16000.00 - 0.001)) / (double)RAND_MAX + 0.001;
	movsd	QWORD PTR -8[r12], xmm0	
# for (size_t i = 0; i < 8; i++)
	cmp	r12, rbx	
	jne	.L22	
# }
	add	rsp, 8
	.cfi_def_cfa_offset 24
	pop	rbx
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	ret	
	.cfi_endproc
.LFE40:
	.size	generate_points, .-generate_points
	.section	.rodata
.LC14:
	.string	"r"
.LC16:
	.string	"%lf "
	.text
	.p2align 4
	.globl	get_points_file
	.type	get_points_file, @function
# Function that get points from file. Resiving ref to points.
get_points_file:
.LFB41:
	.cfi_startproc
	endbr64	
	push	r15	
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	push	r14	
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
# while (fscanf(f, "%lf ", &num) > 0 && i < 8)
	xor	r14d, r14d	
# {
	push	r13	
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	push	r12	
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
# r12 <- str
	lea	r12, .LC16[rip]	
	push	rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
# rbx <- points (rdi)
	mov	rbx, rdi	
	sub	rsp, 16	
	.cfi_def_cfa_offset 64
# FILE *f = fopen(argv[1], "r");
	mov	rdi, QWORD PTR 8[rsi]	
	lea	rsi, .LC14[rip]
# {
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 8[rsp], rax
	xor	eax, eax
	mov	r13, rsp
# FILE *f = fopen(argv[1], "r");
	call	fopen@PLT
# double num = 0;
	mov	QWORD PTR [rsp], 0x000000000
# FILE *f = fopen(argv[1], "r");
# r15 <- f (rax)
	mov	r15, rax	
# while (fscanf(f, "%lf ", &num) > 0 && i < 8)
	jmp	.L26
	.p2align 4,,10
	.p2align 3
.L27:
# points[i++] = num;
# xmmo <- num (0)
	movsd	xmm0, QWORD PTR [rsp]	
	movsd	QWORD PTR [rbx+r14*8], xmm0	
	add	r14, 1
.L26:
# while (fscanf(f, "%lf ", &num) > 0 && i < 8)
	xor	eax, eax
	mov	rdx, r13
	mov	rsi, r12
	mov	rdi, r15
	call	__isoc99_fscanf@PLT
# while (fscanf(f, "%lf ", &num) > 0 && i < 8)
	cmp	r14d, 8	
	je	.L30
	test	eax, eax	
	jg	.L27
.L30:
# fclose(f);
	mov	rdi, r15
	call	fclose@PLT
# }
	mov	rax, QWORD PTR 8[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L35
	add	rsp, 16	
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	pop	rbx
	.cfi_def_cfa_offset 40
	pop	r12
	.cfi_def_cfa_offset 32
	pop	r13
	.cfi_def_cfa_offset 24
	pop	r14
	.cfi_def_cfa_offset 16
	pop	r15
	.cfi_def_cfa_offset 8
	ret	
.L35:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE41:
	.size	get_points_file, .-get_points_file
	.section	.rodata
	.align 8
.LC17:
	.string	"\320\237\321\200\320\276\320\270\320\267\320\262\320\276\320\264\320\270\320\274 \320\263\320\265\320\275\320\265\321\200\320\260\321\206\320\270\321\216!"
.LC18:
	.string	"rb+"
	.align 8
.LC19:
	.string	"\320\222\320\275\320\270\320\274\320\260\320\275\320\270\320\265: \320\244\320\260\320\271\320\273 \320\262\321\213\320\262\320\276\320\264\320\260 \320\275\320\265 \320\276\320\261\320\275\320\260\321\200\321\203\320\266\320\265\320\275 \320\270\320\273\320\270 \320\275\320\265\320\264\320\276\321\201\321\202\321\203\320\277\320\265\320\275! \320\236\320\275 \320\261\321\203\320\264\320\265\321\202 \321\201\320\276\320\267\320\264\320\260\320\275."
	.align 8
.LC20:
	.string	"\320\237\321\200\320\276\320\270\320\267\320\262\320\276\320\264\320\270\320\274 c\321\207\320\270\321\202\321\213\320\262\320\260\320\275\320\270\320\265 \320\270\320\267 \321\204\320\260\320\271\320\273\320\276\320\262!"
	.align 8
.LC21:
	.string	"\320\244\320\260\320\271\320\273 \320\262\320\262\320\276\320\264\320\260 \320\275\320\265 \320\276\320\261\320\275\320\260\321\200\321\203\320\266\320\265\320\275 \320\270\320\273\320\270 \320\275\320\265\320\264\320\276\321\201\321\202\321\203\320\277\320\265\320\275!"
	.align 8
.LC22:
	.string	"\320\235\320\260\321\207\320\270\320\275\320\260\320\265\320\274 \321\200\320\260\320\261\320\276\321\202\321\203 \320\262 \320\272\320\276\320\275\321\201\320\276\320\273\321\214\320\275\320\276\320\274 \321\200\320\265\320\266\320\270\320\274\320\265!"
	.align 8
.LC23:
	.string	"\320\235\320\265\320\262\320\265\321\200\320\275\320\276\320\265 \320\272\320\276\320\273\320\270\321\207\320\265\321\201\321\202\320\262\320\276 \320\277\320\260\321\200\320\260\320\274\320\265\321\202\321\200\320\276\320\262, \320\270\321\205 \320\262\321\201\320\265\320\263\320\264\320\260 4 - \320\270 \321\204\320\260\320\271\320\273\321\213 [-g] (\320\263\320\265\320\275\320\265\321\200\320\260\321\206\320\270\321\217) \320\270\320\273\320\270 2 - \320\262\321\205\320\276\320\264\320\275\320\276\320\271 \320\270 \320\262\321\213\321\205\320\276\320\264\320\275\320\276\320\271 \321\204\320\260\320\271\320\273"
	.text
	.p2align 4
	.globl	get_type_of_work
	.type	get_type_of_work, @function
# Function that returns type of work in eax. Resiving argv (rsi) argc (edi).
get_type_of_work:
.LFB42:
	.cfi_startproc
	endbr64	
	push	r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	push	rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
# rbx <- argv (rsi)
	mov	rbx, rsi
	sub	rsp, 8
	.cfi_def_cfa_offset 32
# if (argc == 4)
# compare argc(edi) and 4
	cmp	edi, 4
	je	.L45
# else if (argc == 3)
# compare argc(edi) and 3
	cmp	edi, 3	
	je	.L46	
# felse if (argc == 1)
# compare argc(edi) and 1
	cmp	edi, 1	
	jne	.L43
# puts("Начинаем работу в консольном режиме!");
# rdi <- str
	lea	rdi, .LC22[rip]	
	call	puts@PLT	
# return 0;
# eax = 0
	xor	eax, eax	
.L36:
# }
	add	rsp, 8	
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	pop	rbx	
	.cfi_def_cfa_offset 16
	pop	r12
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L46:
	.cfi_restore_state
# puts("Производим cчитывание из файлов!");
	lea	rdi, .LC20[rip]	
# FILE *f = fopen(argv[1], "rb+");
	lea	r12, .LC18[rip]	
	call	puts@PLT	#
# FILE *f = fopen(argv[1], "rb+");
	mov	rdi, QWORD PTR 8[rbx]	
	mov	rsi, r12
	call	fopen@PLT
	mov	rdi, rax	
# if (!f)
	test	rax, rax
	je	.L47
# fclose(f);
	call	fclose@PLT	
# FILE *fo = fopen(argv[2], "rb+");
	mov	rdi, QWORD PTR 16[rbx]
	mov	rsi, r12	
	call	fopen@PLT
	mov	rdi, rax
# if (!fo)
	test	rax, rax
	je	.L48
# fclose(fo);
	call	fclose@PLT
# }
	add	rsp, 8
	.cfi_remember_state
	.cfi_def_cfa_offset 24
# return 1;
# eax = 1
	mov	eax, 1	
# }
	pop	rbx	
	.cfi_def_cfa_offset 16
	pop	r12	
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L45:
	.cfi_restore_state
# puts("Производим генерацию!");
	lea	rdi, .LC17[rip]	
	call	puts@PLT	
# FILE *fo = fopen(argv[3], "rb+");
	mov	rdi, QWORD PTR 24[rbx]	
	lea	rsi, .LC18[rip]
	call	fopen@PLT
	mov	rdi, rax
# if (!fo)
	test	rax, rax
	je	.L49
# fclose(fo);
	call	fclose@PLT	
# return 2;
# eax = 2;
	mov	eax, 2	
	jmp	.L36
	.p2align 4,,10
	.p2align 3
.L43:
# puts("Неверное количество параметров, их всегда 4 - и файлы [-g] (генерация) или 2 - входной и выходной файл");
	lea	rdi, .LC23[rip]	
	call	puts@PLT
# return -1;
# eax = -1
	mov	eax, -1	
	jmp	.L36
.L48:
# puts("Внимание: Файл вывода не обнаружен или недоступен! Он будет создан.");
	lea	rdi, .LC19[rip]	
	call	puts@PLT
# return 1;
# eax = 1
	mov	eax, 1
	jmp	.L36
.L47:
# puts("Файл ввода не обнаружен или недоступен!");
	lea	rdi, .LC21[rip]
	call	puts@PLT
# return -1;
# eax = 1;
	or	eax, -1	
	jmp	.L36
.L49:
# puts("Внимание: Файл вывода не обнаружен или недоступен! Он будет создан.");
	lea	rdi, .LC19[rip]	
	call	puts@PLT
# return 2;
# eax = 2
	mov	eax, 2
	jmp	.L36
	.cfi_endproc
.LFE42:
	.size	get_type_of_work, .-get_type_of_work
	.section	.rodata
	.align 8
.LC24:
	.string	"\n---------------------\n\320\222\320\262\320\265\320\264\320\265\320\275\320\275\321\213\320\265 \320\264\320\260\320\275\320\275\321\213\320\265: "
	.align 8
.LC25:
	.string	"\320\242\320\276\321\207\320\272\320\260 %d:( x = %lf, y = %lf )\n"
	.align 8
.LC26:
	.string	"\320\247\320\270\321\201\320\273\320\276 \320\277\320\276\320\262\321\202\320\276\321\200\320\265\320\275\320\270\320\271 \320\272\320\276\320\264\320\260: %lld\n"
.LC27:
	.string	"--------------------"
	.text
	.p2align 4
	.globl	print_input
	.type	print_input, @function
# Function that print input of user. Resiving num_of_rep (rsi) nad ref to points (rdi). Return nothing.
print_input:
.LFB43:
	.cfi_startproc
	endbr64	
	push	r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
# r14 <- num_of_rep (rsi)
	mov	r14, rsi
	push	r13	
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	lea	r13, .LC25[rip]	
	push	r12	
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
# int n = 1;
# n (r12d) = 1
	mov	r12d, 1	
# {
	push	rbx	
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
# rbx <- points (rdi)
	mov	rbx, rdi
	lea	rdi, .LC24[rip]
	sub	rsp, 8	#,
	.cfi_def_cfa_offset 48
	call	puts@PLT
.L51:
	movsd	xmm1, QWORD PTR 8[rbx]	
	movsd	xmm0, QWORD PTR [rbx]
# edx <- n (r12d)
	mov	edx, r12d
	mov	rsi, r13
	mov	edi, 1	
	mov	eax, 2
# n++;
# n (r12d) += 1;
	add	r12d, 1	
# for (int i = 0; i < 8; i += 2)
	add	rbx, 16	
	call	__printf_chk@PLT
# for (int i = 0; i < 8; i += 2)
# compare n (r12d) and 5
	cmp	r12d, 5	
	jne	.L51
# rdx <- num_of_rep(r14)
	mov	rdx, r14	
	mov	edi, 1
	lea	rsi, .LC26[rip]
	xor	eax, eax
	call	__printf_chk@PLT
# }
	add	rsp, 8	#,
	.cfi_def_cfa_offset 40
	lea	rdi, .LC27[rip]
	pop	rbx	
	.cfi_def_cfa_offset 32
	pop	r12	
	.cfi_def_cfa_offset 24
	pop	r13	
	.cfi_def_cfa_offset 16
	pop	r14	
	.cfi_def_cfa_offset 8
	jmp	puts@PLT
	.cfi_endproc
.LFE43:
	.size	print_input, .-print_input
	.p2align 4
	.globl	is_in_circle
	.type	is_in_circle, @function
# Functtin that checks that four points on circle. Resiving ref to points. Return 1 or 0.
is_in_circle:
.LFB44:
	.cfi_startproc
	endbr64	
# double y_4 = points[7];
	movsd	xmm0, QWORD PTR 56[rdi]	
# double x_1 = points[0];
	movsd	xmm1, QWORD PTR [rdi]	
# if ((check) == 0)
	xor	eax, eax	
	mov	edx, 0	
# double x_3 = points[4];
	movsd	xmm10, QWORD PTR 32[rdi]	
# double y_3 = points[5];
	movsd	xmm9, QWORD PTR 40[rdi]	
# double y_1 = points[1];
	movsd	xmm8, QWORD PTR 8[rdi]	
# double y_2 = points[3];
	movsd	xmm2, QWORD PTR 24[rdi]	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movapd	xmm6, xmm10	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movapd	xmm7, xmm9	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movapd	xmm15, xmm9	
# double x_4 = points[6];
	movsd	xmm5, QWORD PTR 48[rdi]	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	mulsd	xmm6, xmm10	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	subsd	xmm7, xmm0	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movapd	xmm4, xmm8
# double x_2 = points[2];
	movsd	xmm13, QWORD PTR 16[rdi]	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	subsd	xmm4, xmm0	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	subsd	xmm15, xmm8	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movapd	xmm12, xmm5
	mulsd	xmm12, xmm5	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movapd	xmm11, xmm2	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movapd	xmm3, xmm8	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	subsd	xmm11, xmm0	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	subsd	xmm3, xmm9
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movsd	QWORD PTR -24[rsp], xmm6
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movapd	xmm6, xmm7	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movapd	xmm7, xmm1	
	mulsd	xmm7, xmm1	
	movsd	QWORD PTR -16[rsp], xmm7	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movapd	xmm7, xmm8	
	subsd	xmm7, xmm2	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movsd	QWORD PTR -8[rsp], xmm7
	movapd	xmm14, xmm7	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movapd	xmm7, xmm15	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movapd	xmm15, xmm4	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	mulsd	xmm7, xmm5
# ouble check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	mulsd	xmm15, xmm10
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	mulsd	xmm14, xmm5	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	mulsd	xmm5, xmm1	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	addsd	xmm15, xmm7
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movapd	xmm7, xmm0	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	subsd	xmm0, xmm8
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	subsd	xmm7, xmm9
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	mulsd	xmm5, xmm1
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	mulsd	xmm7, xmm1
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	addsd	xmm7, xmm15	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movapd	xmm15, xmm13	
	mulsd	xmm15, xmm13	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	mulsd	xmm7, xmm15	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movsd	xmm15, QWORD PTR -24[rsp]
	mulsd	xmm15, xmm0	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movapd	xmm0, xmm12	
	mulsd	xmm0, xmm3	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	addsd	xmm0, xmm15	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movapd	xmm15, xmm4	
	mulsd	xmm15, xmm3	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	addsd	xmm15, QWORD PTR -16[rsp]
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	mulsd	xmm3, xmm14	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	mulsd	xmm4, QWORD PTR -8[rsp]	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	addsd	xmm4, QWORD PTR -16[rsp]
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	mulsd	xmm15, xmm6	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	mulsd	xmm6, xmm11	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	mulsd	xmm4, xmm11	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	addsd	xmm0, xmm15	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	addsd	xmm6, xmm12	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	mulsd	xmm0, xmm13
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	mulsd	xmm6, xmm1
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	mulsd	xmm1, xmm11	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	addsd	xmm0, xmm7
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	subsd	xmm3, xmm6	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	addsd	xmm1, xmm14	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	mulsd	xmm1, QWORD PTR -24[rsp]
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	addsd	xmm3, xmm5	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movapd	xmm5, xmm2	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	subsd	xmm2, xmm8	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	subsd	xmm5, xmm9
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	mulsd	xmm2, xmm12	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	mulsd	xmm3, xmm5	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	subsd	xmm2, xmm4	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	addsd	xmm0, xmm3	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	mulsd	xmm2, xmm10	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	addsd	xmm0, xmm1	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	addsd	xmm0, xmm2
# if ((check) == 0)
	ucomisd	xmm0, QWORD PTR .LC15[rip]	
	setnp	al	#, tmp193
	cmovne	eax, edx
# }
	ret	
	.cfi_endproc
.LFE44:
	.size	is_in_circle, .-is_in_circle
	.section	.rodata
.LC29:
	.string	":%lld"
	.align 8
.LC30:
	.string	"\320\222\320\262\320\265\320\264\320\270\321\202\320\265 \321\207\320\270\321\201\320\273\320\276 \320\277\320\276\320\262\321\202\320\276\321\200\320\265\320\275\320\270\320\271 \320\277\321\200\320\276\320\263\321\200\320\260\320\274\320\274\321\213 (\320\276\321\202 1 \320\264\320\276 9223372036854775000): "
.LC31:
	.string	"%lld"
	.text
	.p2align 4
	.globl	get_number_or_repeats
	.type	get_number_or_repeats, @function
# Functions that get number of repeats from user.
get_number_or_repeats:
.LFB46:
	.cfi_startproc
	endbr64	
	push	r14	
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	push	r13	
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
# r13 <- str
	lea	r13, .LC30[rip]	
	push	r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	lea	r12, .LC31[rip]	
	push	rbx	
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movabs	rbx, 9223372036854774998
	sub	rsp, 40	#,
	.cfi_def_cfa_offset 80
# {
	mov	rax, QWORD PTR fs:40	
	mov	QWORD PTR 24[rsp], rax	
	xor	eax, eax
	lea	r14, 8[rsp]	
# long long num = 0;
# num (8) = 0
	mov	QWORD PTR 8[rsp], 0	
# if (choice == 1)
	cmp	edi, 1	
	je	.L66
	.p2align 4,,10
	.p2align 3
.L56:
	mov	rsi, r13
	mov	edi, 1
	xor	eax, eax
	call	__printf_chk@PLT
# scanf("%lld", &num);
	mov	rsi, r14
	mov	rdi, r12	
	xor	eax, eax	
	call	__isoc99_scanf@PLT	
# while (num <= 0 || num >= 9223372036854775000)
	mov	rax, QWORD PTR 8[rsp]
	lea	rdx, -1[rax]	
	cmp	rdx, rbx	
	ja	.L56
.L55:
# }
	mov	rdx, QWORD PTR 24[rsp]	
	sub	rdx, QWORD PTR fs:40	
	jne	.L67	
	add	rsp, 40	
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	pop	rbx	
	.cfi_def_cfa_offset 32
	pop	r12	
	.cfi_def_cfa_offset 24
	pop	r13	
	.cfi_def_cfa_offset 16
	pop	r14	
	.cfi_def_cfa_offset 8
	ret	
	.p2align 4,,10
	.p2align 3
.L66:
	.cfi_restore_state
# FILE *f = fopen(argv[1], "r");
	mov	rdi, QWORD PTR 8[rsi]	
	lea	rsi, .LC14[rip]
	lea	r13, 16[rsp]
	lea	rbx, .LC16[rip]	
	call	fopen@PLT	
# double n = 0;
	mov	QWORD PTR 16[rsp], 0x000000000
# FILE *f = fopen(argv[1], "r");
	mov	r12, rax
	.p2align 4,,10
	.p2align 3
.L57:
# while (fscanf(f, "%lf ", &n) > 0 && i < 8)
	xor	eax, eax
	mov	rdx, r13	
	mov	rsi, rbx	
	mov	rdi, r12	
	call	__isoc99_fscanf@PLT	
# while (fscanf(f, "%lf ", &n) > 0 && i < 8)
	test	eax, eax
	jg	.L57	
# fscanf(f, ":%lld", &num);
	lea	rdx, 8[rsp]	
	lea	rsi, .LC29[rip]	
	mov	rdi, r12	
	xor	eax, eax
	call	__isoc99_fscanf@PLT
# fclose(f);
	mov	rdi, r12
	call	fclose@PLT	
# return num;
	mov	rax, QWORD PTR 8[rsp]
	jmp	.L55	
.L67:
# }
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE46:
	.size	get_number_or_repeats, .-get_number_or_repeats
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1093567616
	.align 8
.LC11:
	.long	-549755814
	.long	1087324159
	.align 8
.LC12:
	.long	-4194304
	.long	1105199103
	.align 8
.LC13:
	.long	-755914244
	.long	1062232653
	.align 8
.LC15:
	.long	0
	.long	0
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
