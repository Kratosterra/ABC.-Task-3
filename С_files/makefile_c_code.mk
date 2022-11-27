
CC      = gcc
CFLAGS  = -O0 
RM      = rm -f


default: Compile_Main

Functions:
	$(CC) $(CFLAGS) -c functions.c -o ../O_files/C-code/functions.o


Main:
	$(CC) $(CFLAGS) -c main.c -o ../O_files/C-code/main.o

Compile_Main:
	$(CC) $(CFLAGS) ../O_files/C-code/functions.o ../O_files/C-code/main.o -o ./Compiled/main_only_c
