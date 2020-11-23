section .bss
    num: resb 8

section .text
global _start

_start:
    mov rdi, 65
    mov rsi, num
    call intToString
    mov rax, 1
    mov rdi, 1
    mov rdx, 2
    syscall
    mov rax,60
    xor rdi, rdi
    syscall
    
;Takes in a number and a variable to store the string(int) in
intToString:
    mov rax, rdi ; The number
    mov r11, rsi ;The variable
    mov rbx, 10
    push rbx
putValuesInTheStack:
    mov rdx, 0
    div rbx
    add rdx, 48
    push rdx
    cmp rax, 0
    jne putValuesInTheStack
puttingTheNumbersInTheVariable:
    pop rcx
    mov [r11], rcx
    inc r11
    cmp rcx, 10
    jne puttingTheNumbersInTheVariable
    ret