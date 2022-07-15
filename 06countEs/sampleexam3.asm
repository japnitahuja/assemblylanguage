extern printf
extern scanf
extern exit

global main

section .text

sumOfDivisibleByThree:
    mov rbx, 0 ;counter
    mov rcx, 0 ; sum
    mov r9, 3
    mov r10, 0 ; value at the index

    loopStart:
        cmp rbx, rsi
        je loopEnd
        
        mov r10, [rdi]

        mov rdx, 0
        mov rax, r10 ; moved first value to rax
        div r9 ; divide by 3
        cmp rdx, 0 ; check if divisble by 3
        je addToSum
        jne loopContinue

        addToSum:
            add rcx, r10
            jmp loopContinue
        
        loopContinue:
            add rdi, 8
            add rbx, 1
            jmp loopStart
        
        loopEnd:
            ret


countEs:
    ; rdi has string, rsi has estring
    mov r10, 0 ;e counter

    countingEsLoop:
        mov al, [rdi]

        cmp al, 0
        je countingEsLoopEnd

        cmp al, 'e'
        je addE
        jne countingEsLoopContinue

        addE:
            mov [rsi], al
            inc rsi
            inc r10
            jmp countingEsLoopContinue
        
        countingEsLoopContinue:
            inc rdi
            jmp countingEsLoop

        countingEsLoopEnd:
            ret
main:
  mov rsi, [arraySize]
  mov rdi, array
  push rbx
  call sumOfDivisibleByThree
  pop rbx

  mov rdi, OutputFormat
  mov rsi, rcx
  push rbx
  call printf
  pop rbx

  ; count e's
  mov rdi, InputMessage
  push rbx
  call printf
  pop rbx 

  mov rdi, InputFormat
  mov rsi, string
  push rbx
  call scanf
  pop rbx

  mov rdi, string
  mov rsi, eString
  push rbx
  call countEs
  pop rbx

  
  mov rdi, ResultFormat
  mov rsi, r10
  mov rdx, string
  mov rcx, eString
  push rbx
  call printf
  pop rbx

  jmp end


end:
  mov rax, 0
  call exit

section .data

  OutputFormat db "The sum of numbers divisible by three is %d." , 0ah, 0dh, 0

  InputFormat db "%s"
  InputMessage db "Enter your string: ", 0

  array dq 1,2,3,4,5,6,7,8,9,10,11,12
  arraySize dq 12

  string times 51 db 0
  eString times 51 db 0

  ResultFormat db "There are %d e's in the string %s : %s", 0ah, 0dh, 0


  

