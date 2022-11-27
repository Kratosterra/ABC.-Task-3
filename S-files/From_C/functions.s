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
# Function that get points from user resiving ref to the array points (rdi) and return that array in (rsi)
get_points:
.LFB6:
# Getting ready for start of func
	.cfi_startproc
	endbr64	
	push	rbp	
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32	
# Get points from rdi and put them in -24 on the stack
	mov	QWORD PTR -24[rbp], rdi
# n (-8 on stack)
# int n = 1;
	mov	DWORD PTR -8[rbp], 1	
# for (int i = 1; i < 9; ++i)
# i (-4 on stack) = 1
	mov	DWORD PTR -4[rbp], 1
	jmp	.L2
.L5:
# if (i % 2 != 0)
# eax <- i (-4 on stack)
	mov	eax, DWORD PTR -4[rbp]
	and	eax, 1
	test	eax, eax
	je	.L3	
# printf("--Точка %d----------------------------\n", n);
# eax <- n (-8 on the stack)
	mov	eax, DWORD PTR -8[rbp]
# esi <- n (eax)
	mov	esi, eax
# rax <- "--Точка %d----------------------------\n"
	lea	rax, .LC0[rip]
# rdi <- string (rax)
	mov	rdi, rax
# eax = 0
	mov	eax, 0
	call	printf@PLT
# printf("Введите координату x точки [%d]: ", n);
# eax <- n (-8 on stack)
	mov	eax, DWORD PTR -8[rbp]
# esi <- n (eax)
	mov	esi, eax
# rax <- "Введите координату x точки [%d]: "
	lea	rax, .LC1[rip]
# rdi <- string (rax)
	mov	rdi, rax
# eax = 0;
	mov	eax, 0
	call	printf@PLT
# scanf("%lf", &points[i - 1]);
# eax <- i (-4 on stack)
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	sal	rax, 3
	lea	rdx, -8[rax]
# fscanf("%lf", &points[i - 1]);
# rax <- points (ref on -24 on stack)
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	rsi, rax
# rax <- "%lf"
	lea	rax, .LC2[rip]
# rdi <- string (rax)
	mov	rdi, rax
# eax = 0;
	mov	eax, 0
	call	__isoc99_scanf@PLT
	jmp	.L4
# Further <name_of_var> (<p>), where <p> if num this is place on stack if name this is register
.L3:
# printf("Введите координату y точки [%d]: ", n++);
# eax <- n (-8);
	mov	eax, DWORD PTR -8[rbp]
	lea	edx, 1[rax]
# n = edx
	mov	DWORD PTR -8[rbp], edx
	mov	esi, eax
# rax <- "Введите координату y точки [%d]: "
	lea	rax, .LC3[rip]
# rdi <- string (rax)
	mov	rdi, rax
# eax = 0
	mov	eax, 0
	call	printf@PLT
# scanf("%lf", &points[i - 1]);
# eax <- i (-4)
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	sal	rax, 3
	lea	rdx, -8[rax]
# scanf("%lf", &points[i - 1]);
# rax <- points(ref -24)
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	rsi, rax	
# rax <- "%lf"
	lea	rax, .LC2[rip]
# rdi <- string (rax)
	mov	rdi, rax
# eax = 0
	mov	eax, 0	
	call	__isoc99_scanf@PLT
.L4:
# for (int i = 1; i < 9; ++i)
# i (-4) += 1
# i++ 
	add	DWORD PTR -4[rbp], 1	
.L2:
# for (int i = 1; i < 9; ++i)
# compare i (-4) and 8
	cmp	DWORD PTR -4[rbp], 8
	jle	.L5	#
# }
# return points in rsi
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
# Function that generate points resiving ref on points (rdi).
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
# -24 on stack <- points (rdi)
	mov	QWORD PTR -24[rbp], rdi
# srand(time(0));
	mov	edi, 0	
	call	time@PLT
# srand(time(0));
	mov	edi, eax	#, _2
	call	srand@PLT	#
# for (size_t i = 0; i < 8; i++)
# i(-8) = 0
	mov	QWORD PTR -8[rbp], 0
	jmp	.L7
.L8:
# points[i] = ((double)rand() * (16000.00 - 0.001)) / (double)RAND_MAX + 0.001; X 8
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
	# i(-8) += 1
	add	QWORD PTR -8[rbp], 1
.L7:
# for (size_t i = 0; i < 8; i++)
# compare i (-8) and 7
	cmp	QWORD PTR -8[rbp], 7
	jbe	.L8
# }
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
# Function that gets points from file resiving ref on array points (rdi) and argv (rsi)
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
# -40 (on stack) <- points (rdi) 
	mov	QWORD PTR -40[rbp], rdi
# -48 on stack <- argv (rsi)
	mov	QWORD PTR -48[rbp], rsi	
# {
	mov	rax, QWORD PTR fs:40	
	mov	QWORD PTR -8[rbp], rax	
# eax = 0
	xor	eax, eax
# FILE *f = fopen(argv[1], "r");
# rax <- argv (-48)
	mov	rax, QWORD PTR -48[rbp]	
# rax += 8
	add	rax, 8	
# FILE *f = fopen(argv[1], "r");
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC7[rip]	
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
# f (-16) <- rax
	mov	QWORD PTR -16[rbp], rax
# int i = 0;
# i(-28) = 0
	mov	DWORD PTR -28[rbp], 0
# double num = 0;
	pxor	xmm0, xmm0	
# num (-24) <- xmm0
	movsd	QWORD PTR -24[rbp], xmm0
# while (fscanf(f, "%lf ", &num) > 0 && i < 8)
	jmp	.L10
.L12:
# points[i++] = num;
	mov	eax, DWORD PTR -28[rbp]
	lea	edx, 1[rax]	
	mov	DWORD PTR -28[rbp], edx
	cdqe
# points[i++] = num;
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rdx	
# points[i++] = num;
	movsd	xmm0, QWORD PTR -24[rbp]
	movsd	QWORD PTR [rax], xmm0
.L10:
# while (fscanf(f, "%lf ", &num) > 0 && i < 8)
	lea	rdx, -24[rbp]
	mov	rax, QWORD PTR -16[rbp]
# rcx <- "%lf" 
	lea	rcx, .LC9[rip]
# rsi <- rcx
	mov	rsi, rcx	
	mov	rdi, rax	
	mov	eax, 0
	call	__isoc99_fscanf@PLT
# while (fscanf(f, "%lf ", &num) > 0 && i < 8)
	test	eax, eax
	jle	.L11
# while (fscanf(f, "%lf ", &num) > 0 && i < 8)
# compare i (-28) and 7;
	cmp	DWORD PTR -28[rbp], 7
	jle	.L12
.L11:
# fclose(f);
# rax <- f (-16)
	mov	rax, QWORD PTR -16[rbp]	
# rdi <- f (rax)
	mov	rdi, rax
	call	fclose@PLT
# }
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
# Function that get type of work resiving argc (edi) and argv (rsi) and returning int num in eax
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
# (-36) <- argc(edi)
	mov	DWORD PTR -36[rbp], edi
# (-48) <- rsi
	mov	QWORD PTR -48[rbp], rsi	
# if (argc == 4)
# compare argc (-36) and 4
	cmp	DWORD PTR -36[rbp], 4
	jne	.L15
# puts("Производим генерацию!");
# rax <- "Производим генерацию!"
	lea	rax, .LC10[rip]	
# rdi <- string (rax)
	mov	rdi, rax	
	call	puts@PLT
# FILE *fo = fopen(argv[3], "rb+");
# rax <- argv (-48)
	mov	rax, QWORD PTR -48[rbp]
# rax += 24
	add	rax, 24
# FILE *fo = fopen(argv[3], "rb+");
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC11[rip]	
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
# fo <- rax
	mov	QWORD PTR -8[rbp], rax
# if (!fo)
# comare fo(-8) and 0 
	cmp	QWORD PTR -8[rbp], 0
	jne	.L16
# puts("Внимание: Файл вывода не обнаружен или недоступен! Он будет создан.");
# rax <- "Внимание: Файл вывода не обнаружен или недоступен! Он будет создан."
	lea	rax, .LC12[rip]
# rdi <- string (rax)
	mov	rdi, rax
	call	puts@PLT
	jmp	.L17
.L16:
# fclose(fo);
	mov	rax, QWORD PTR -8[rbp]
	mov	rdi, rax
	call	fclose@PLT
.L17:
# return 2;
	mov	eax, 2	
	jmp	.L18
.L15:
# else if (argc == 3)
# compare argc(-36) and 3
	cmp	DWORD PTR -36[rbp], 3
	jne	.L19
# puts("Производим cчитывание из файлов!");
	lea	rax, .LC13[rip]	
	mov	rdi, rax
	call	puts@PLT
# FILE *f = fopen(argv[1], "rb+");
	mov	rax, QWORD PTR -48[rbp]
	add	rax, 8
# FILE *f = fopen(argv[1], "rb+");
	mov	rax, QWORD PTR [rax]	
	lea	rdx, .LC11[rip]	
	mov	rsi, rdx	
	mov	rdi, rax	
	call	fopen@PLT
	mov	QWORD PTR -24[rbp], rax	
# if (!f)
	cmp	QWORD PTR -24[rbp], 0
	jne	.L20
# puts("Файл ввода не обнаружен или недоступен!");
	lea	rax, .LC14[rip]	
	mov	rdi, rax	
	call	puts@PLT	
# return -1;
	mov	eax, -1	
	jmp	.L18
.L20:
# fclose(f);
	mov	rax, QWORD PTR -24[rbp]
	mov	rdi, rax	
	call	fclose@PLT
# FILE *fo = fopen(argv[2], "rb+");
	mov	rax, QWORD PTR -48[rbp]	
	add	rax, 16
# FILE *fo = fopen(argv[2], "rb+");
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC11[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -16[rbp], rax	
# if (!fo)
	cmp	QWORD PTR -16[rbp], 0
	jne	.L21
# puts("Внимание: Файл вывода не обнаружен или недоступен! Он будет создан.");
	lea	rax, .LC12[rip]	
	mov	rdi, rax
	call	puts@PLT
	jmp	.L22
.L21:
# fclose(fo);
	mov	rax, QWORD PTR -16[rbp]	
	mov	rdi, rax	
	call	fclose@PLT	
.L22:
# return 1;
	mov	eax, 1	
	jmp	.L18
.L19:
# else if (argc == 1)
	cmp	DWORD PTR -36[rbp], 1
	jne	.L23
# puts("Начинаем работу в консольном режиме!");
	lea	rax, .LC15[rip]	
	mov	rdi, rax
	call	puts@PLT
# return 0;
	mov	eax, 0	
	jmp	.L18
.L23:
# puts("Неверное количество параметров, их всегда 4 - и файлы [-g] (генерация) или 2 - входной и выходной файл");
	lea	rax, .LC16[rip]
	mov	rdi, rax
	call	puts@PLT	
# return -1;
	mov	eax, -1	# _7,
.L18:
#  }
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
# Function that print input of user resiving ref to points (rdi), num_of_rep (rsi) and return nothing
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
# (-24) <- points (rdi)
	mov	QWORD PTR -24[rbp], rdi
# (-32) <- num_of_rep (rsi)
	mov	QWORD PTR -32[rbp], rsi	
# printf("\n---------------------\nВведенные данные: \n");
# rax <- "\n---------------------\nВведенные данные: \n"
	lea	rax, .LC17[rip]
# rdi <- string(rax)
	mov	rdi, rax
	call	puts@PLT
# int n = 1;
# n (-8) = 1;
	mov	DWORD PTR -8[rbp], 1	
# for (int i = 0; i < 8; i += 2)
	mov	DWORD PTR -4[rbp], 0
	jmp	.L25
.L26:
# printf("Точка %d:( x = %lf, y = %lf )\n", n, points[i], points[i + 1]);
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	add	rax, 1
	lea	rdx, 0[0+rax*8]
# rax <- points (-24)
	mov	rax, QWORD PTR -24[rbp]	
	add	rax, rdx
# printf("Точка %d:( x = %lf, y = %lf )\n", n, points[i], points[i + 1]);
	movsd	xmm0, QWORD PTR [rax]	
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
# printf("Точка %d:( x = %lf, y = %lf )\n", n, points[i], points[i + 1]);
	mov	rdx, QWORD PTR [rax]
# eax <- n (-8)
	mov	eax, DWORD PTR -8[rbp]
	movapd	xmm1, xmm0	
	movq	xmm0, rdx
	mov	esi, eax
	lea	rax, .LC18[rip]
	mov	rdi, rax
	mov	eax, 2
	call	printf@PLT
# n (-8) += 1
# n++;
	add	DWORD PTR -8[rbp], 1
# for (int i = 0; i < 8; i += 2)
# i (-4) += 2
	add	DWORD PTR -4[rbp], 2	
.L25:
# for (int i = 0; i < 8; i += 2)
# compare i(-4) and 7
	cmp	DWORD PTR -4[rbp], 7
	jle	.L26
# printf("Число повторений кода: %lld\n", num_of_rep);
# rax <- num_of_rep(-32)
	mov	rax, QWORD PTR -32[rbp]	
	mov	rsi, rax
	lea	rax, .LC19[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
# printf("--------------------\n");
# rax <- "--------------------\n"
	lea	rax, .LC20[rip]	
# rdi <- string (rax)
	mov	rdi, rax
	call	puts@PLT
# }
	nop	
	leave	
	.cfi_def_cfa 7, 8
	ret	
	.cfi_endproc
.LFE10:
	.size	print_input, .-print_input
	.globl	is_in_circle
	.type	is_in_circle, @function
# Function that checks four points and returning 1 or 0 reseving points (rdi)
is_in_circle:
.LFB11:
	.cfi_startproc
	endbr64	
	push	rbp	#
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp	#,
	.cfi_def_cfa_register 6
# -88 <- points (rdi)
	mov	QWORD PTR -88[rbp], rdi	
# double x_1 = points[0];
	mov	rax, QWORD PTR -88[rbp]	
	movsd	xmm0, QWORD PTR [rax]
	movsd	QWORD PTR -72[rbp], xmm0
# double x_2 = points[2];
	mov	rax, QWORD PTR -88[rbp]	
	movsd	xmm0, QWORD PTR 16[rax]
	movsd	QWORD PTR -64[rbp], xmm0
# double x_3 = points[4];
	mov	rax, QWORD PTR -88[rbp]	
	movsd	xmm0, QWORD PTR 32[rax]	
	movsd	QWORD PTR -56[rbp], xmm0
# double x_4 = points[6];
	mov	rax, QWORD PTR -88[rbp]
	movsd	xmm0, QWORD PTR 48[rax]	
	movsd	QWORD PTR -48[rbp], xmm0
# double y_1 = points[1];
	mov	rax, QWORD PTR -88[rbp]	
	movsd	xmm0, QWORD PTR 8[rax]	
	movsd	QWORD PTR -40[rbp], xmm0
# double y_2 = points[3];
	mov	rax, QWORD PTR -88[rbp]	
	movsd	xmm0, QWORD PTR 24[rax]	
	movsd	QWORD PTR -32[rbp], xmm0	
# double y_3 = points[5];
	mov	rax, QWORD PTR -88[rbp]	
	movsd	xmm0, QWORD PTR 40[rax]	
	movsd	QWORD PTR -24[rbp], xmm0
# double y_4 = points[7];
	mov	rax, QWORD PTR -88[rbp]	
	movsd	xmm0, QWORD PTR 56[rax]
	movsd	QWORD PTR -16[rbp], xmm0	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movsd	xmm0, QWORD PTR -64[rbp]
	movapd	xmm1, xmm0
	mulsd	xmm1, xmm0
# fdouble check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movsd	xmm0, QWORD PTR -24[rbp]
	subsd	xmm0, QWORD PTR -40[rbp]
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movapd	xmm2, xmm0	
	mulsd	xmm2, QWORD PTR -48[rbp]	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movsd	xmm0, QWORD PTR -40[rbp]
	subsd	xmm0, QWORD PTR -16[rbp]	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	mulsd	xmm0, QWORD PTR -56[rbp]	# _5, x_3
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	addsd	xmm2, xmm0	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movsd	xmm0, QWORD PTR -16[rbp]	
	subsd	xmm0, QWORD PTR -24[rbp]
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	mulsd	xmm0, QWORD PTR -72[rbp]
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	addsd	xmm0, xmm2	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	mulsd	xmm1, xmm0	# _10, _9
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movsd	xmm0, QWORD PTR -56[rbp]
	movapd	xmm2, xmm0
	mulsd	xmm2, xmm0
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movsd	xmm0, QWORD PTR -16[rbp]	
	subsd	xmm0, QWORD PTR -40[rbp]
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	mulsd	xmm2, xmm0
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movsd	xmm0, QWORD PTR -48[rbp]
	movapd	xmm3, xmm0	
	mulsd	xmm3, xmm0	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movsd	xmm0, QWORD PTR -40[rbp]
	subsd	xmm0, QWORD PTR -24[rbp]
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	mulsd	xmm0, xmm3
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	addsd	xmm2, xmm0	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movsd	xmm0, QWORD PTR -24[rbp]	
	movapd	xmm3, xmm0	
	subsd	xmm3, QWORD PTR -16[rbp]
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movsd	xmm0, QWORD PTR -72[rbp]	
	movapd	xmm4, xmm0	
	mulsd	xmm4, xmm0	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movsd	xmm0, QWORD PTR -40[rbp]
	movapd	xmm5, xmm0
	subsd	xmm5, QWORD PTR -24[rbp]
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movsd	xmm0, QWORD PTR -40[rbp]
	subsd	xmm0, QWORD PTR -16[rbp]
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	mulsd	xmm0, xmm5	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	addsd	xmm0, xmm4
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	mulsd	xmm0, xmm3	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	addsd	xmm0, xmm2
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	mulsd	xmm0, QWORD PTR -64[rbp]	# _26, x_2
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	addsd	xmm1, xmm0
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movsd	xmm0, QWORD PTR -32[rbp]
	movapd	xmm2, xmm0
	subsd	xmm2, QWORD PTR -24[rbp]
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movsd	xmm0, QWORD PTR -72[rbp]
	movq	xmm3, QWORD PTR .LC21[rip]
	xorpd	xmm3, xmm0
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movsd	xmm0, QWORD PTR -48[rbp]
	movapd	xmm4, xmm0
	mulsd	xmm4, xmm0
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movsd	xmm0, QWORD PTR -32[rbp]
	movapd	xmm5, xmm0
	subsd	xmm5, QWORD PTR -16[rbp]
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movsd	xmm0, QWORD PTR -24[rbp]
	subsd	xmm0, QWORD PTR -16[rbp]
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	mulsd	xmm0, xmm5
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	addsd	xmm0, xmm4
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	mulsd	xmm3, xmm0	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movsd	xmm0, QWORD PTR -40[rbp]
	subsd	xmm0, QWORD PTR -32[rbp]	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movapd	xmm4, xmm0
	mulsd	xmm4, QWORD PTR -48[rbp]
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movsd	xmm0, QWORD PTR -40[rbp]
	subsd	xmm0, QWORD PTR -24[rbp]
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	mulsd	xmm0, xmm4
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	addsd	xmm3, xmm0
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movsd	xmm0, QWORD PTR -48[rbp]
	mulsd	xmm0, QWORD PTR -72[rbp]
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	mulsd	xmm0, QWORD PTR -72[rbp]
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	addsd	xmm0, xmm3	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	mulsd	xmm0, xmm2	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	addsd	xmm1, xmm0
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movsd	xmm0, QWORD PTR -56[rbp]
	movapd	xmm2, xmm0
	mulsd	xmm2, xmm0
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movsd	xmm0, QWORD PTR -40[rbp]	
	subsd	xmm0, QWORD PTR -32[rbp]	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movapd	xmm3, xmm0	
	mulsd	xmm3, QWORD PTR -48[rbp]
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movsd	xmm0, QWORD PTR -32[rbp]
	subsd	xmm0, QWORD PTR -16[rbp]	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	mulsd	xmm0, QWORD PTR -72[rbp]
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	addsd	xmm0, xmm3
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	mulsd	xmm0, xmm2	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	addsd	xmm1, xmm0
	movapd	xmm2, xmm1
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movsd	xmm0, QWORD PTR -48[rbp]	
	movapd	xmm1, xmm0	
	mulsd	xmm1, xmm0	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movsd	xmm0, QWORD PTR -32[rbp]
	subsd	xmm0, QWORD PTR -40[rbp]
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	mulsd	xmm1, xmm0	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movsd	xmm0, QWORD PTR -32[rbp]	
	movapd	xmm3, xmm0	
	subsd	xmm3, QWORD PTR -16[rbp]	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movsd	xmm0, QWORD PTR -72[rbp]	
	movapd	xmm4, xmm0	
	mulsd	xmm4, xmm0	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movsd	xmm0, QWORD PTR -40[rbp]	
	movapd	xmm5, xmm0	
	subsd	xmm5, QWORD PTR -32[rbp]	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	movsd	xmm0, QWORD PTR -40[rbp]	
	subsd	xmm0, QWORD PTR -16[rbp]	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	mulsd	xmm0, xmm5	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	addsd	xmm0, xmm4	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	mulsd	xmm3, xmm0
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	subsd	xmm1, xmm3
	movapd	xmm0, xmm1
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	mulsd	xmm0, QWORD PTR -56[rbp]	
# double check = x_2 * x_2 * (x_4 * (y_3 - y_1) + x_3 * (y_1 - y_4) + x_1 * (y_4 - y_3)) + x_2 * (x_3 * x_3 * (y_4 - y_1) + x_4 * x_4 * (y_1 - y_3) + (y_3 - y_4) * (x_1 * x_1 + (y_1 - y_3) * (y_1 - y_4))) + (y_2 - y_3) * (-1 * x_1 * (x_4 * x_4 + (y_2 - y_4) * (y_3 - y_4)) + x_4 * (y_1 - y_2) * (y_1 - y_3) + x_4 * x_1 * x_1) + x_3 * x_3 * (x_4 * (y_1 - y_2) + x_1 * (y_2 - y_4)) + x_3 * (x_4 * x_4 * (y_2 - y_1) - (y_2 - y_4) * (x_1 * x_1 + (y_1 - y_2) * (y_1 - y_4)));
	addsd	xmm0, xmm2	
	movsd	QWORD PTR -8[rbp], xmm0	
# if ((check) == 0)
	pxor	xmm0, xmm0
	ucomisd	xmm0, QWORD PTR -8[rbp]	
	jp	.L28
	pxor	xmm0, xmm0	
	ucomisd	xmm0, QWORD PTR -8[rbp]
	jne	.L28
# return 1;
	mov	eax, 1
	jmp	.L30	
.L28:
# return 0;
	mov	eax, 0
.L30:
# }
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
# Function that check points and print answer resiving points (rdi), choice (esi), argv (rdx), num_of_rep (rcx)
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
# (-72) <- points (rdi)
	mov	QWORD PTR -72[rbp], rdi
# (-76) <- choice (esi)
	mov	DWORD PTR -76[rbp], esi
# (-88) <- argv (rdx)
	mov	QWORD PTR -88[rbp], rdx
# (-96) <- num_of_rep (rcx)
	mov	QWORD PTR -96[rbp], rcx
# int answer = 0;
# answer (-52) = 0
	mov	DWORD PTR -52[rbp], 0
# clock_t begin = clock();
	call	clock@PLT
	mov	QWORD PTR -40[rbp], rax
# for (long long i = 0; i < num_of_rep; i++)
# i (-48) = 0
	mov	QWORD PTR -48[rbp], 0	
	jmp	.L33
.L34:
# answer = is_in_circle(points);
# rax <- points (-72)
	mov	rax, QWORD PTR -72[rbp]
	mov	rdi, rax
	call	is_in_circle
# answer = is_in_circle(points) (eax)
	mov	DWORD PTR -52[rbp], eax	
# for (long long i = 0; i < num_of_rep; i++)
# i (-48) += 1
	add	QWORD PTR -48[rbp], 1
.L33:
# for (long long i = 0; i < num_of_rep; i++)
# rax <- i (-48)
	mov	rax, QWORD PTR -48[rbp]
# compare i (rax) and num_of_rep (-96)
	cmp	rax, QWORD PTR -96[rbp]
	jl	.L34	#,
# clock_t end = clock();
	call	clock@PLT
	mov	QWORD PTR -32[rbp], rax	
# double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
	mov	rax, QWORD PTR -32[rbp]	
	sub	rax, QWORD PTR -40[rbp]	
# double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
	pxor	xmm0, xmm0	
	cvtsi2sd	xmm0, rax	
# double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
	movsd	xmm1, QWORD PTR .LC22[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -24[rbp], xmm0
# printf("Время исполнения программы: %f\n", time_spent);
	mov	rax, QWORD PTR -24[rbp]	
	movq	xmm0, rax	
	lea	rax, .LC23[rip]	
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
# if (choice == 1)
# compare choice(-76) and 1
	cmp	DWORD PTR -76[rbp], 1
	jne	.L35
# printf("Ответ в файле вывода!\n");
	lea	rax, .LC24[rip]	
	mov	rdi, rax	
	call	puts@PLT
# FILE *f = fopen(argv[2], "w+");
	mov	rax, QWORD PTR -88[rbp]
	add	rax, 16
# FILE *f = fopen(argv[2], "w+");
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC25[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -8[rbp], rax
# if (answer)
	cmp	DWORD PTR -52[rbp], 0
	je	.L36
# fprintf(f, "- Точки принадлежат окружности\n");
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rax
	mov	edx, 57
	mov	esi, 1	
	lea	rax, .LC26[rip]	
	mov	rdi, rax
	call	fwrite@PLT
	jmp	.L37
.L36:
# fprintf(f, "- Точки не принадлежат окружности\n");
	mov	rax, QWORD PTR -8[rbp]	
	mov	rcx, rax
	mov	edx, 62	
	mov	esi, 1
	lea	rax, .LC27[rip]
	mov	rdi, rax
	call	fwrite@PLT
.L37:
# fclose(f);
	mov	rax, QWORD PTR -8[rbp]	
	mov	rdi, rax
	call	fclose@PLT
	jmp	.L38
.L35:
# else if (choice == 2)
	cmp	DWORD PTR -76[rbp], 2
	jne	.L39	#,
# printf("Ответ в файле вывода!\n");
	lea	rax, .LC24[rip]	
	mov	rdi, rax
	call	puts@PLT
# FILE *f = fopen(argv[3], "w+");
	mov	rax, QWORD PTR -88[rbp]
	add	rax, 24
# FILE *f = fopen(argv[3], "w+");
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC25[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -16[rbp], rax
# if (answer)
	cmp	DWORD PTR -52[rbp], 0
	je	.L40
# fprintf(f, "- Точки принадлежат окружности\n");
	mov	rax, QWORD PTR -16[rbp]
	mov	rcx, rax
	mov	edx, 57
	mov	esi, 1
	lea	rax, .LC26[rip]	
	mov	rdi, rax
	call	fwrite@PLT
	jmp	.L41
.L40:
# fprintf(f, "- Точки не принадлежат окружности\n");
	mov	rax, QWORD PTR -16[rbp]	
	mov	rcx, rax
	mov	edx, 62
	mov	esi, 1
	lea	rax, .LC27[rip]	
	mov	rdi, rax
	call	fwrite@PLT
.L41:
# fclose(f);
	mov	rax, QWORD PTR -16[rbp]	
	mov	rdi, rax	
	call	fclose@PLT	
	jmp	.L38
.L39:
# if (answer)
	cmp	DWORD PTR -52[rbp], 0
	je	.L42
# printf("- Точки принадлежат окружности\n");
	lea	rax, .LC28[rip]	
	mov	rdi, rax	
	call	puts@PLT	
	jmp	.L38
.L42:
# printf("- Точки не принадлежат окружности\n");
	lea	rax, .LC29[rip]	
	mov	rdi, rax
	call	puts@PLT
.L38:
# printf("--------------------\n");
	lea	rax, .LC20[rip]	
	mov	rdi, rax	
	call	puts@PLT
# }
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
# Function that gets number of repeats from user and returning num in rax
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
# (-52) <- choice (edi)
	mov	DWORD PTR -52[rbp], edi
# (-64) <- argv (rsi)
	mov	QWORD PTR -64[rbp], rsi
# {
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax	
# eax = 0
	xor	eax, eax
# long long num = 0;
# num(-32) = 0;
	mov	QWORD PTR -32[rbp], 0
# if (choice == 1)
# choice (-52) compare with 1
	cmp	DWORD PTR -52[rbp], 1
	jne	.L48
# FILE *f = fopen(argv[1], "r");
	mov	rax, QWORD PTR -64[rbp]
	add	rax, 8
# FILE *f = fopen(argv[1], "r");
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC7[rip]	
	mov	rsi, rdx	
	mov	rdi, rax	
	call	fopen@PLT
# f (-16) <- rax
	mov	QWORD PTR -16[rbp], rax
# int i = 0;
# i(-36) = 0;
	mov	DWORD PTR -36[rbp], 0	
# double n = 0;
	pxor	xmm0, xmm0
	movsd	QWORD PTR -24[rbp], xmm0
# while (fscanf(f, "%lf ", &n) > 0 && i < 8)
	nop	
.L46:
# while (fscanf(f, "%lf ", &n) > 0 && i < 8)
	lea	rdx, -24[rbp]	
	mov	rax, QWORD PTR -16[rbp]	
	lea	rcx, .LC9[rip]	
	mov	rsi, rcx	
	mov	rdi, rax	
	mov	eax, 0
	call	__isoc99_fscanf@PLT
# while (fscanf(f, "%lf ", &n) > 0 && i < 8)
	test	eax, eax
	jle	.L45
# while (fscanf(f, "%lf ", &n) > 0 && i < 8)
	cmp	DWORD PTR -36[rbp], 7
	jle	.L46
.L45:
# fscanf(f, ":%lld", &num);
	lea	rdx, -32[rbp]	
	mov	rax, QWORD PTR -16[rbp]	
	lea	rcx, .LC30[rip]	
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT	
# fclose(f);
	mov	rax, QWORD PTR -16[rbp]	
	mov	rdi, rax	
	call	fclose@PLT
	jmp	.L47
.L49:
# printf("Введите число повторений программы (от 1 до 9223372036854775000): ");
	lea	rax, .LC31[rip]	
	mov	rdi, rax	
	mov	eax, 0
	call	printf@PLT
# scanf("%lld", &num);
	lea	rax, -32[rbp]
	mov	rsi, rax
	lea	rax, .LC32[rip]	
	mov	rdi, rax	
	mov	eax, 0
	call	__isoc99_scanf@PLT	
.L48:
# while (num <= 0 || num >= 9223372036854775000)
	mov	rax, QWORD PTR -32[rbp]
# while (num <= 0 || num >= 9223372036854775000)
	test	rax, rax
	jle	.L49
# while (num <= 0 || num >= 9223372036854775000)
	mov	rax, QWORD PTR -32[rbp]	
# while (num <= 0 || num >= 9223372036854775000)
	movabs	rdx, 9223372036854774999
	cmp	rax, rdx
	jg	.L49
.L47:
# return num;
	mov	rax, QWORD PTR -32[rbp]	
# }
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
