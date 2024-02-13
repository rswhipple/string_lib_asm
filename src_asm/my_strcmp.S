section .text
    global my_strcmp

my_strcmp:
    ; Input Arguments: 
    ;   rdi = first string address, 
    ;   rsi = second string address
    ; Output: Integer less than, equal to, or greater than zero

.loop:
    movzx rax, byte [rdi]   ; Load byte from first string
    movzx rcx, byte [rsi]   ; Load byte from second string
    cmp rax, rcx            ; Compare bytes
    jne .not_equal          ; If not equal, go to not_equal
    test rax, rax           ; Check if rax (byte from first string) is zero (end of string)
    je .equal               ; If zero, strings are equal
    inc rdi                 ; Increment pointers 
    inc rsi
    jmp .loop               ; Continue loop

.equal:
    xor rax, rax            ; Equal: Set result to zero
    jmp .done

.not_equal:
    sub rax, rcx            ; Set rax to difference of the characters
    
.done:
    ret