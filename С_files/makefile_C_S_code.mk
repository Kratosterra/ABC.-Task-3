
CC      = gcc
CFLAGS  = -O0
RM      = rm -f


main: united_main.s
	$(CC) $(CFLAGS) -o ../S-files/Compilled/main_sep_only_s ../O_files/S-code/main.o ../O_files/S-code/functions.o

main.o: ../S_files/From_C/main.s
	as --gstabs -o ../O_files/S-code/main.o ../S-files/From_C/main.s

functions.o: ../O_files/S-code/functions.s
	as --gstabs -o ../O_files/C-code/functions.o ../S_files/From_C/functions.s