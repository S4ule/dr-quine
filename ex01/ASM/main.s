; define

%define STR "; define%1$c%1$c%4$cdefine STR %2$c%3$s%2$c%1$c%4$cdefine FT main:%1$c%1$csection .rodata%1$cmsg: db STR, 0%1$cfile: db %2$cGrace_kid.s%2$c, 0%1$c%1$csection .text%1$cglobal main%1$cextern dprintf%1$c%1$cFT%1$cmov rax, 2%1$clea rdi, [rel file]%1$cmov rsi, 64 | 512 | 2%1$cmov rdx, 256 | 128%1$csyscall%1$ccmp rax, 0%1$cjl .fail%1$c%1$cpush rax%1$cmov rdi, rax%1$cmov rax, 3%1$clea rsi, [rel msg]%1$cmov rdx, 10%1$cmov rcx, 34%1$clea r8, [rel msg]%1$cmov r9, 37%1$ccall [rel dprintf WRT ..got]%1$c%1$cpop rsi%1$cmov rax, 3%1$csyscall%1$c%1$cxor rax, rax%1$cret%1$c%1$c.fail:%1$cret%1$c"
%define FT main:

section .rodata
msg: db STR, 0
file: db "Grace_kid.s", 0

section .text
global main
extern dprintf

FT
mov rax, 2
lea rdi, [rel file]
mov rsi, 64 | 512 | 2
mov rdx, 256 | 128
syscall
cmp rax, 0
jl .fail

push rax
mov rdi, rax
mov rax, 3
lea rsi, [rel msg]
mov rdx, 10
mov rcx, 34
lea r8, [rel msg]
mov r9, 37
call [rel dprintf WRT ..got]

pop rsi
mov rax, 3
syscall

xor rax, rax
ret

.fail:
ret
