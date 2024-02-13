section .text
    global my_memcpy

my_memcpy:
    ; Input Arguments: 
    ;   rdi = destination address
    ;   rsi = source address
    ;   rdx = n (number of bytes to be copied into dest from source)
    ; Output: 
    ;   rax = memory address for destination

    cmp rdx, 0          ; Check if n is zero 
    je .done
    push rdi            ; Save original destination in stack 

.loop:
    mov al, [rsi]       ; Load byte from source address
    mov [rdi], al       ; Store the byte in destination address
    inc rdi             ; Increment pointers 
    inc rsi
    dec rdx             ; Decrement n
    jnz .loop           ; Loop if n is not zero

.done:
    pop rax             ; Retrieve original destination address into rax
    ret

