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

  ; rdx -- number
  ; rbx -- count
  ; rcx -- last fib 
  ; rax -- last to last fib
  mov rdx, [number]
  mov rbx, 1
  mov rcx, 1
  mov rax, 0

loopStart:
  ;loop statement
  cmp rbx, rdx
  je end

  add rbx, 1
  mov r11, rcx
  add rcx, rax
  mov rax, r11

  jmp loopStart

end:
  mov rdi, ResultMessage
  mov rsi, rcx
  mov rdx, [number]
  push rbx
  call printf
  pop rbx

  mov rax, 0
  call exit

section .data
  OutputFormat db "%s", 0
  OutputMessage db "enter your number: ", 0

  InputFormat db "%d", 0
  number dq 0

  ResultMessage db "%d is the %d fib number.", 0ah, 0dh, 0


  

