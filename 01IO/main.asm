extern printf
extern scanf
extern exit

global main

section .text

main:

  ; printf
  mov rdi, OutputFormat
  mov rsi, OutputMessage
  mov rax, 0
  push rbx
  call printf
  pop rbx

  ; scanf
  mov rdi, InputFormat
  mov rsi, number 
  mov rax, 0
  push rbx
  call scanf
  pop rbx

  ; square number
  mov rax, [number] 
  mul rax

  ; printf
  mov rdi, InputFormat
  mov rsi, rax
  push rbx
  call printf
  pop rbx

  mov rax, 0
  call exit

section .data
  OutputFormat db "%s", 0
  OutputMessage db "enter your age: ", 0

  InputFormat db "%d", 0
  number dq 0

  

