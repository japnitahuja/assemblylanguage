extern printf
extern scanf
extern exit

global main

section .text

copyDivisible:
  ;rdi, rsi, rdx - size of the array, rcx - divisor

  mov r8, 0 ;count
  mov r9, 0 ; value at the index
  mov r10, rdx ; array size
  mov r11, 0 ; count divisible

  loopStart:

    cmp r8, r10
    je loopEnd

    mov r9, [rsi]

    mov rdx, 0
    mov rax, [rsi]
    idiv rcx
    cmp rdx, 0
    je isDivisible 
    jne loopContinue

  isDivisible:
    mov [rdi], r9
    add rdi, 8
    inc r11
    jmp loopContinue
    
  loopContinue:
    add rsi, 8
    add r8, 1
    jmp loopStart

  loopEnd:
    ret

main:

  ; printf
  mov rdi, OutputFormat
  mov rsi, getNumPrompt
  mov rax, 0
  push rbx
  call printf
  pop rbx

  ; scanf
  mov rdi, getNumFormat
  mov rsi, divisor
  mov rax, 0
  push rbx
  call scanf
  pop rbx

  mov rdi, endArray
  mov rsi, startArray
  mov rdx, [arraySize]
  mov rcx, [divisor]
  push rbx
  call copyDivisible
  pop rbx
 
  mov rsi, endArray
  mov rbx, r11 ; size ; preserved
  mov rcx, 0 ; count

  loopEndArray:

    cmp rcx, rbx
    je end

    mov rdi, ResultMessage
    mov rsi, [endArray + 8*rcx]
    mov rdx, [divisor]
    push rcx
    call printf
    pop rcx

    add rcx, 1
    jmp loopEndArray

  end:
    mov rax, 0
    call exit

section .data
  OutputFormat db "%s", 0
  getNumPrompt db "enter a divisor: ", 0

  getNumFormat db "%d", 0
  divisor dq 0

  startArray dq -28,-6, -72, 0, 33, 1, 2, 3, 4, 5
  arraySize dq 10
  endArray times 20 dq 0

  ResultMessage db "%d is divisible by %d", 0ah, 0dh, 0

  

