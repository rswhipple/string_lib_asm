section .text
    global my_strlen

my_strlen:
    ; Input: rdi - Address of the string
    ; Output: rax - Length of the string
    xor     rax, rax        ; Clear rax to store the length

.loop:
    cmp     byte [rdi], 0   ; Check if the current byte is null terminator
    je      .done           ; If yes, exit the loop
    inc     rax             ; Increment the length
    inc     rdi             ; Move to the next byte
    jmp     .loop           ; Repeat the loop

.done:
    ret
    