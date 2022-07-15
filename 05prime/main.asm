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


  ; increasing divisor
  mov rcx, 2
  ; user entered number
  mov r11, [number]
  
  primeLoopStart:
  ; divide and check remainder
    cmp rcx, r11
    je primeNumber 

    mov rdx, 0
    mov rax, r11
    div rcx
    cmp rdx, 0
    je compositeNumber
    jne continueLoop
  
  continueLoop:
    inc rcx
    jmp primeLoopStart


primeNumber:
  ; printf
  mov rdi, PrimeMessage
  mov rsi, [number]
  push rbx
  call printf
  pop rbx
  jmp end

compositeNumber:
  mov rdi, CompositeMessage
  mov rsi, [number]
  mov rdx, rcx
  push rbx
  call printf
  pop rbx
  jmp end

end:
  mov rax, 0
  call exit

section .data
  OutputFormat db "%s", 0
  OutputMessage db "enter a number: ", 0

  InputFormat db "%d", 0
  number dq 0

  PrimeMessage db "%d is prime. ", 0ah, 0dh, 0
  CompositeMessage db "%d is not prime. %d is the first divisor.",  0ah, 0dh, 0

  

