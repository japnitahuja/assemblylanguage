extern printf
extern scanf
extern exit

global main

section .text

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
  mov rsi, string
  mov rax, 0
  push rbx
  call scanf
  pop rbx

  mov rsi, string
  mov rax, 0 ; count

  loopStart:

    mov bl, [rsi]

    cmp bl, 0
    je palindromeCheck
    
    add rax, 1
    add rsi, 1

    jmp loopStart
  

  
  palindromeCheck:

    ; rax - count
    mov r14, 0 ;beg
    mov r15, rax ;end
    sub r15, 1

    palindromeLoop:
      cmp r14, r15
      jge palindrome

      mov al, [string + r14]
      mov bl, [string + r15]

      cmp al, bl
      jne notPalindrome

      add r14, 1
      sub r15, 1

      jmp palindromeLoop

  notPalindrome:
    mov rdi, notPalindromeMessage
    push rax 
    call printf
    pop rax
    jmp end
  
  palindrome:
    mov rdi, PalindromeMessage
    push rax 
    call printf
    pop rax
    jmp end
 
  end:
    mov rax, 0
    call exit

section .data
  OutputFormat db "%s", 0
  getNumPrompt db "enter a word: ", 0

  getNumFormat db "%s", 0
  string times 50 db 0

  notPalindromeMessage db "string is not palindrome.", 0ah, 0dh, 0
  PalindromeMessage db "string is palindrome.", 0ah, 0dh, 0

  

