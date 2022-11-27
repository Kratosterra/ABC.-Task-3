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
# Start
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
# argv (r12)
	mov	r12, rsi
	push	rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	sub	rsp, 104
	.cfi_def_cfa_offset 144
# Main {
# Getting redy for calling get type of work
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 88[rsp], rax
	xor	eax, eax
# int choice = get_type_of_work(argc, argv);
# Call get type of work
	call	get_type_of_work@PL
# ebx <- choice (eax)
	mov	ebp, eax
# if (choice == 0)
	test	eax, eax
	je	.L10
# else if (choice == 1)
# choice (eax)
	cmp	eax, 1
	je	.L11
# else if (choice == 2)
# choice (eax)
	cmp	eax, 2
	je	.L12
# puts("Произошла ошибка исполнения!\n");
# rdi <- "Произошла ошибка исполнения!\n"
	lea	rdi, .LC0[rip]
# Call puts
	call	puts@PLT
.L6:
# }
# return 0;
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
# Getting ready for calling generate points
# generate_points(points);
# r14 <- points (16[rsp])
	lea	r14, 16[rsp]
# rdi <- points (r14)
	mov	rdi, r14
	call	generate_points@PLT
# Getting nummber of repits of code;
# num_of_rep = strtol(argv[2], &e, 10);
# rdi <- argv[2]
	mov	rdi, QWORD PTR 16[r12]
# rsi <- &e
	lea	rsi, 8[rsp]
# edx <- 10 
	mov	edx, 10	
	call	strtol@PLT
# r13 <- num_of_rep (rax)
	mov	r13, rax	# num_of_rep, tmp105
.L3:
# print_input(points, num_of_rep);
# rsi <- num_of_rep (r13)
	mov	rsi, r13
# rdi <- points (r14)
	mov	rdi, r14
	call	print_input@PLT	#
# check_points(points, choice, argv, num_of_rep);
# rcx <- num_of_rep(r13)
	mov	rcx, r13
# rdx <- argv(r12)
	mov	rdx, r12	#, argv
# esi <- choice(ebx)
	mov	esi, ebp	#, choice
# rdi <- points(r14)
	mov	rdi, r14	#, tmp99
	call	check_points@PLT
# return 0;
	jmp	.L6
.L10:
# num_of_rep = get_number_or_repeats(choice, argv);
	xor	edi, edi
# rsi <- argv(r12)
	mov	rsi, r12
# get_points(points);
# r14 <- points(16[rsp])
	lea	r14, 16[rsp]
# num_of_rep = get_number_or_repeats(choice, argv);
	call	get_number_or_repeats@PLT
# get_points(points);
# rdi <- points(r14)
	mov	rdi, r14
# num_of_rep = get_number_or_repeats(choice, argv);
# number_of_rep  = reasult
	mov	r13, rax
# get_points(points);
	call	get_points@PLT	
	jmp	.L3
.L11:
# num_of_rep = get_number_or_repeats(choice, argv)
# rsi <- argv(r12)
	mov	rsi, r12
	mov	edi, 1
# get_points_file(points, argv)
# r14 <- points (16[rsp])
	lea	r14, 16[rsp]
# num_of_rep = get_number_or_repeats(choice, argv)
	call	get_number_or_repeats@PLT
# get_points_file(points, argv)
# rsi <- argv
	mov	rsi, r12
# rdi <- points
	mov	rdi, r14
# num_of_rep = get_number_or_repeats(choice, argv);
# num_of_rep (r13)
	mov	r13, rax
# get_points_file(points, argv);
	call	get_points_file@PLT	
	jmp	.L3	
.L13:
# }
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
