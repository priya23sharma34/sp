.data

.text

.global _start

_start:
        mov $9, %rdi
        call intToA

        mov $60, %rax
        mov 0, %rdi
        syscall


intToA:
        mov %rdi, %rax
        add $'0', %rax
        ret
