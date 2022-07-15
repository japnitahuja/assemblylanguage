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
  mov rsi, message
  mov rax, 0
  push rbx
  call scanf
  pop rbx

  mov rdi, message 
  push rax
  call uppercase
  pop rax
  jmp end

end:
  mov rdi, ResultMessage
  mov rsi, message
  push rbx
  call printf
  pop rbx

  mov rax, 0
  call exit

uppercase:

  mov bl, 'a'
  mov bh, 'z'

  loopstart:
    mov al, [rdi] 

    cmp al, 0
    je loopend

    cmp al, bl ; less than 'a'
    jb skip

    cmp al, bh ; greater than 'z'
    ja skip

    sub al, 32
    mov [rdi], al
  
  skip:
    inc rdi
    jmp loopstart
  
  loopend:
    ret



section .data
  OutputFormat db "%s", 0
  OutputMessage db "enter your text: ", 0

  InputFormat db "%s", 0

  ResultMessage db "Result is %s ", 0ah, 0dh, 0

section .bss
  message resb 100


  

