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

  ; divide and check remainder
  mov rdx, 0
  mov rax, [number]
  mov rcx, 2
  div rcx

  cmp rdx, 0
  je evenNumber
  jne oddNumber

evenNumber:
  ; printf
  mov rdi, EvenMessage
  mov rsi, [number]
  push rbx
  call printf
  pop rbx
  jmp end

oddNumber:
  mov rdi, OddMessage
  mov rsi, [number]
  push rbx
  call printf
  pop rbx
  jmp end

end:
  mov rax, 0
  call exit

section .data
  OutputFormat db "%s", 0
  OutputMessage db "enter your age: ", 0

  InputFormat db "%d", 0
  number dq 0

  EvenMessage db "%d is even.", 0ah, 0dh, 0
  OddMessage db "%d is odd.",  0ah, 0dh, 0

  

