%define STR "test"

section .rodata
 nasm_path: db "/usr/bin/nasm", 0
 gcc_path: db "/usr/bin/gcc", 0
 nasm_arg_1: db "-f", 0
 nasm_arg_2: db "elf64", 0
 gcc_arg_1: db "-no-pie", 0
 gcc_arg_2: db "-o", 0
 sully_5: db "Sully_5.s", 0
 sully_s: db "./Sully_%d.s", 0
 sully_o: db "./Sully_%d.o", 0
 sully_e: db "./Sully_%d", 0
 sully_a: db "Sully_%d", 0
 msg: db STR, 0

section .data
 i: dd 5
 t: dd 0
 fd: dd -1
 argv_nasm: dd nasm_path, nasm_arg_1, nasm_arg_2, s_s, 0
 argv_gcc: dd gcc_path, gcc_arg_1, s_o, gcc_arg_2, s_a, 0
 argv_sully: dd sully_a, 0

section .bss
 s_s: resb 100
 s_o: resb 100
 s_e: resb 100
 s_a: resb 100

section .text
 global main
 extern dprintf
 extern sprintf

main:
 mov rax, 21 ; sys_access
 lea rdi, [rel sully_5]
 mov rsi, 4 ; R_OK
 syscall
 cmp rax, 0
 je .i_sub

.start:
 push rax ; aline stack for sprintf

 mov		rax, 1
 lea		rdi, [rel s_s]
 lea		rsi, [rel sully_s]
 mov		rdx, [rel i]
 call	[rel sprintf WRT ..got]

	mov		rax, 1
	lea		rdi, [rel s_o]
	lea		rsi, [rel sully_o]
	mov		rdx, [rel i]
	call	[rel sprintf WRT ..got]

	mov		rax, 1
	lea		rdi, [rel s_e]
	lea		rsi, [rel sully_e]
	mov		rdx, [rel i]
	call	[rel sprintf WRT ..got]

	mov		rax, 1
	lea		rdi, [rel s_a]
	lea		rsi, [rel sully_a]
	mov		rdx, [rel i]
	call	[rel sprintf WRT ..got]

	mov		rax, 0
	lea		rdi, [rel s_a]
	call	[rel strlen WRT ..got]

	mov		rax, 2		; open
	lea		rdi, [rel s_s]
	mov		rsi, 578	; O_RDWR | O_CREAT | O_TRUNC
	mov		rdx, 384	; S_IRUSR | S_IWUSR
	syscall

	pop		rdi
	cmp		rax, 0
	jl		.fail

;dprintf(fd,STR,10,34,STR,9,i);
	push	rax			; aline stack
	mov		rdi, rax	; fd
	mov		rax, 3
	lea		rsi, [rel msg]
	mov		rdx, 10
	mov		rcx, 34
	lea		r8, [rel msg]
	mov		r9, i
	call	[rel dprintf WRT ..got]

	mov		rax, 3		; sys-call close
	pop		rdi
	syscall

	mov		rax, 57		; sys-call fork()
	syscall
	cmp		rax, 0
	jl		.fail
	je		.child_nasm

	mov		rdi, rax
	mov		rax, 61		; sys-call waitpid()
	mov		rsi, t
	mov		rdx, 0
	syscall
	cmp		rax, 1
	jl		.fail

	mov		rax, 57		; sys-call fork()
	syscall
	cmp		rax, 0
	jl		.fail
	je		.child_gcc

	mov		rdi, rax
	mov		rax, 61		; sys-call waitpid()
	mov		rsi, t
	mov		rdx, 0
	syscall
	cmp		rax, 1
	jl		.fail

	mov		rax, 59		; execv
	lea		rdi, [rel s_e]
	mov		rsi, argv_sully
	syscall

.i_sub:
	mov		rax, [rel i]
	sub		rax, 1
	mov		[rel i], rax
	jmp		.start

.fail:
	mov		rax, 60		; sys_exit
	mov		rdi, 1
	syscall

.child_nasm:
	mov		rax, 59		; execv
	lea		rdi, [rel nasm_path]
	mov		rsi, argv_nasm
	syscall

.child_gcc:
	mov		rax, 59
	lea		rdi, [rel gcc_path]
	mov		rsi, argv_gcc
	syscall
