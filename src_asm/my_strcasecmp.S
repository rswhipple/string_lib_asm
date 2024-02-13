section .text
    global my_strcasecmp

my_strcasecmp:
    ; Input Arguments: 
    ;   rdi = first string address, 
    ;   rsi = second string address
    ; Output: Integer less than, equal to, or greater than zero
    
.loop:
    movzx rax, byte [rdi]   ; Load byte from first string
    movzx rcx, byte [rsi]   ; Load byte from second string
    ; Convert characters to lowercase (assuming ASCII characters)
    cmp rax, 'A'
    jl .not_uppercase_rax
    cmp rax, 'Z'
    jg .not_uppercase_rax
    add rax, 32             ; Convert uppercase to lowercase

.not_uppercase_rax:
    cmp rcx, 'A'
    jl .not_uppercase_rcx
    cmp rcx, 'Z'
    jg .not_uppercase_rcx
    add rcx, 32             ; Convert uppercase to lowercase

.not_uppercase_rcx:
    cmp rax, rcx            ; Compare bytes
    jne .not_equal          ; If not equal, go to not_equal
    test rax, rax           ; Check if rax (byte from first string) is zero (end of string)
    je .equal               ; If zero, strings are equal up to n bytes
    inc rdi                 ; Increment pointers 
    inc rsi
    jmp .loop              

.equal:
    xor rax, rax            ; Equal: Set result to zero
    jmp .done

.not_equal:
    sub rax, rcx            ; Set rax to difference of the characters
.done:
    ret