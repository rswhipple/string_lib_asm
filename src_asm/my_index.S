section .text
    global my_index

my_index:
    ; Input Arguments: 
    ;   rdi = string address, 
    ;   rsi = character to compare
    ; Output:
    ;   rax = if successful, address pointer for character location in string
    ;       else, null pointer

    mov al, sil             ; Load comparison char into al

.loop:
    mov cl, [rdi]           ; Load a byte from string into bl
    cmp cl, 0               ; test end of string
    je .fail_end            ; go to end

    cmp cl, al              ; check if current character is equal to character given in parameter
    je .strchr_end          ; go to end

    inc rdi                 ; move to next character of the string
    jmp .loop               ; loop

.strchr_end:
    mov rax, rdi            ; set function return
    ret

.fail_end:
    xor rax, rax            ; Return NULL (0) in case of failure
    ret

