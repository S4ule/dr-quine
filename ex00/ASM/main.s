; section

section .rodata
	msg:	db "; section%1$c%1$csection .rodata%1$c%2$cmsg:%2$cdb %3$c%4$s%3$c, 10%1$c%1$csection .text%1$c%2$cglobal%2$cmain%1$c%2$cextern%2$cprintf%1$c%1$cmain:%1$c%2$cpush%2$crbp%1$c%2$cmov%2$c%2$crbp, rsp%1$c%2$cmov%2$c%2$crax, 4%1$c%2$clea%2$c%2$crdi, [rel msg]%1$c%2$cmov%2$c%2$crsi, 10%1$c%2$cmov%2$c%2$crdx, 9%1$c%2$cmov%2$c%2$crcx, 34%1$c%2$clea%2$c%2$cr8, [rel msg]%1$c%2$ccall%2$c[rel printf WRT ..got]%1$c%2$cmov%2$c%2$crsp, rbp%1$c%2$cpop%2$c%2$crbp%1$c%2$cmov%2$c%2$crax, 0%1$c%2$cjmp%2$c%2$cf%1$c%2$cret%1$c%1$cf:%1$c%2$cret", 10

section .text
	global	main
	extern	printf

main:
	push	rbp
	mov		rbp, rsp
	mov		rax, 4
	lea		rdi, [rel msg]
	mov		rsi, 10
	mov		rdx, 9
	mov		rcx, 34
	lea		r8, [rel msg]
	call	[rel printf WRT ..got]
	mov		rsp, rbp
	pop		rbp
	mov		rax, 0
	jmp		f
	ret

f:
	ret
