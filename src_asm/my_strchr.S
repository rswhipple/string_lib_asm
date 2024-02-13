section .text
    global my_strchr

my_strchr:
    ; Input Arguments: 
    ;   rdi = string address, 
    ;   rsi = character to compare
    ; Output:
    ;   rax = if successful, address pointer for character location in string
    ;       else, null pointer
    mov al, sil             ; Load comparison char into al
    mov r9, rdi

.loop:
    mov dl, [r9]            ; Load a byte from string into bl
    cmp dl, 0               ; test end of string
    je .fail_end            ; go to end
    cmp dl, al              ; check if current character is equal to character given in parameter
    je .strchr_end          ; go to end
    inc r9                  ; move to next character of the string
    jmp .loop               ; loop
    
.strchr_end:
    mov rax, r9            ; set function return
    ret

.fail_end:
    xor rax, rax            ; Return NULL (0) in case of failure
    ret
    