extern printf
extern scanf
extern exit

global main

section .text

getFibonaccis:
  ;rdi - destination array, rsi - n
  mov r14, 0 ;count
  mov rax, 0 ; last fib
  mov rcx, 1 ;current fib

  loopStart:
    cmp r14, 0
    je add0fib

    cmp r14, 1
    je addNextFib

    cmp r14, rsi
    je endLoop
    jne createNextFib

    add0fib:
      mov [rdi], rax
      add rdi, 8
      add r14, 1
      jmp loopStart

    createNextFib:
      mov r15, rcx ;store last fib
      add rcx, rax ; make current new fib
      mov rax, r15 ; store last fib in rax
      jmp addNextFib
    
    addNextFib:
      mov [rdi], rcx
      add rdi, 8
      add r14, 1
      jmp loopStart

    endLoop:
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
  mov rsi, number
  mov rax, 0
  push rbx
  call scanf
  pop rbx

  mov rdi, array
  mov rsi, [number]
  push rbx
  call getFibonaccis
  pop rbx

  mov r14, [number]
  mov r15, 0 ;counter
  printArray:
    cmp r15, r14
    je stringProgram

    mov rdi, ResultFormat
    mov rsi, [array + 8*r15]
    push rbx
    call printf
    pop rbx

    add r15, 1

    jmp printArray

  ; string
  stringProgram:
   ; printf
    mov rdi, OutputFormat
    mov rsi, getStringPrompt
    mov rax, 0
    push rbx
    call printf
    pop rbx

    ; scanf
    mov rdi, getStringFormat
    mov rsi, a
    mov rax, 0
    push rbx
    call scanf
    pop rbx

    ; printf
    mov rdi, OutputFormat
    mov rsi, getAnotherStringPrompt
    mov rax, 0
    push rbx
    call printf
    pop rbx

    ; scanf
    mov rdi, getStringFormat
    mov rsi, b
    mov rax, 0
    push rbx
    call scanf
    pop rbx

    mov rdi, a
    mov rsi, b

    mov r15, 0 ;length
    
    lengthOfString:
      mov al, [rdi]

      cmp al, 0
      je checkReverse

      add rdi, 1
      add r15, 1
      jmp lengthOfString
    
    checkReverse:
      
      mov rcx, r15 ;length
      sub r15, 1 ;corrected length
      

      mov rdi, a
      mov rsi, b
      mov r14, 0 ;count

      checkReverseLoopStart:
        cmp r14, rcx
        je printReverseMessage

        mov rax, 0
        mov rbx, 0

        mov al, [rdi + r14]
        mov bl, [rsi + r15]

        cmp al, bl
        je continueReverseLoop
        jne printNotReverseMessage

        continueReverseLoop:
          add r14, 1
          sub r15, 1
          jmp checkReverseLoopStart

  printReverseMessage:
    mov rdi, OutputFormat
    mov rsi, reverseMessage
    mov rax, 0
    push rbx
    call printf
    pop rbx
    jmp end

  printNotReverseMessage:
    mov rdi, OutputFormat
    mov rsi, notReverseMessage
    mov rax, 0
    push rbx
    call printf
    pop rbx
    jmp end





 
  end:
    mov rax, 0
    call exit

section .data
  OutputFormat db "%s", 0
  getNumPrompt db "enter n: ", 0

  getNumFormat db "%d", 0
  number dq 0

  array times 100 dq 0

  ResultFormat db "%d ", 0

  getStringFormat db "%s", 0
  getStringPrompt db "Enter string: ", 0
  getAnotherStringPrompt db "Enter another string: ", 0
  a times 50 db 0
  b times 50 db 0

  reverseMessage db "Strings are reverse.", 0ah, 0dh, 0
  notReverseMessage db "Strings are not reverse.", 0ah, 0dh, 0



  

