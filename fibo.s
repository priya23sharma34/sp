.data
fib:
.byte 9

.text

.global _start

_start:
mov fib, %ecx
xor %rbx,%rbx
xor %rax,%rax
inc %rbx

.fib_loop:
mov %rax, %rdx
add %rbx, %rax
mov %rdx, %rbx
dec %ecx
JNZ .fib_loop

mov $9, %rcx
mov %rsp,%rdi

Exit:
mov %rax,60
syscall

