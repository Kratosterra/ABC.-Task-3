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
# start of main
	.cfi_startproc
	endbr64	
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	add	rsp, -128
# Get argc from edi and put in -116 on the stack
	mov	DWORD PTR -116[rbp], edi	
# Get argv from rsi and put in -128 on the stack
	mov	QWORD PTR -128[rbp], rsi
# {
	mov	rax, QWORD PTR fs:40	
	mov	QWORD PTR -8[rbp], rax	
	xor	eax, eax
# Create place for num_of_rep on the -88 of stack
# long long num_of_rep = 0;
	mov	QWORD PTR -88[rbp], 0
# Prepairing data for transition to the function get_type_of_work()
# int choice = get_type_of_work(argc, argv);
# Put argv (-128 on stack) to the rdx for using in get_type_of_work()
	mov	rdx, QWORD PTR -128[rbp]	# tmp86, argv
# Put argc (-116 on stack) to the eax
	mov	eax, DWORD PTR -116[rbp]
	mov	rsi, rdx
	mov	edi, eax
# Call get_type_of_work function
	call	get_type_of_work@PLT
# Save the choice from eax on the -100 of stack.
	mov	DWORD PTR -100[rbp], eax
# if (choice == 0)
	cmp	DWORD PTR -100[rbp], 0
	jne	.L2
# Prepairing data for transition to the function get_number_or_repeats()
# num_of_rep = get_number_or_repeats(choice, argv);
# Put argv (-128 on stack) to the rdx
	mov	rdx, QWORD PTR -128[rbp]
# Put choice (-100 on stack) to the eax
	mov	eax, DWORD PTR -100[rbp]
	mov	rsi, rdx
	mov	edi, eax
# Call get number_or_repeats()
	call	get_number_or_repeats@PLT
# Put num_of_rep (rax) to the -88 on the stack
	mov	QWORD PTR -88[rbp], rax
# Prepairing data for transition to the function get_points()
# get_points(points);
	lea	rax, -80[rbp]
	mov	rdi, rax
	call	get_points@PLT
	jmp	.L3
.L2:
# else if (choice == 1)
	cmp	DWORD PTR -100[rbp], 1
	jne	.L4	
# Same thing, that already been in the .LFB6
# num_of_rep = get_number_or_repeats(choice, argv);
# rdx <- argv
	mov	rdx, QWORD PTR -128[rbp]
# eax <- choice
	mov	eax, DWORD PTR -100[rbp]
	mov	rsi, rdx
	mov	edi, eax
	call	get_number_or_repeats@PLT
# -88 on stack <- num_of_rep
	mov	QWORD PTR -88[rbp], rax	
# get_points_file(points, argv);
# rdx <- argv
	mov	rdx, QWORD PTR -128[rbp]
	lea	rax, -80[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	get_points_file@PLT	
	jmp	.L3	
.L4:
# else if (choice == 2)
	cmp	DWORD PTR -100[rbp], 2
	jne	.L5	
# generate_points(points);
	lea	rax, -80[rbp]
	mov	rdi, rax
	call	generate_points@PLT
# num_of_rep = strtol(argv[2], &e, 10);
# rax <- argv(-128 stack)
	mov	rax, QWORD PTR -128[rbp]
	add	rax, 16
# num_of_rep = strtol(argv[2], &e, 10);
	mov	rax, QWORD PTR [rax]
	lea	rcx, -96[rbp]
	mov	edx, 10	#,
	mov	rsi, rcx
	mov	rdi, rax
	call	strtol@PLT
# -88 on stack <- num_of_rep(rax)
	mov	QWORD PTR -88[rbp], rax
	jmp	.L3	#
.L5:
# puts("Произошла ошибка исполнения!\n");
	lea	rax, .LC0[rip]
	mov	rdi, rax
	call	puts@PLT
# return 0;
	mov	eax, 0
	jmp	.L6
.L3:
# print_input(points, num_of_rep);
# rdx <- num_of_rep(-88 on the stack)
	mov	rdx, QWORD PTR -88[rbp]
	lea	rax, -80[rbp]
	mov	rsi, rdx
	mov	rdi, rax
	call	print_input@PLT	
# check_points(points, choice, argv, num_of_rep);
# rcx <- num_of_rep (-88 on the stack)
	mov	rcx, QWORD PTR -88[rbp]
# rdx <- argv (-128 on the stack)
	mov	rdx, QWORD PTR -128[rbp]
# esi <- choice (-100 on the stack)
	mov	esi, DWORD PTR -100[rbp]
	lea	rax, -80[rbp]
	mov	rdi, rax
	call	check_points@PLT
# return 0;
	mov	eax, 0
.L6:
# }
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
