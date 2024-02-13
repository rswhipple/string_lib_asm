section .text
    global my_memset

my_memset:
    ; Input Arguments:
    ;   rdi = pointer to the block of memory to fill
    ;   rsi = value to be set
    ;   rdx = n (number of chars to be set with new value)
    ; Output: 
    ;   rax = memory address for destination

    cmp rdx, 0          ; Check if n is zero
    je .done
    push rdi            ; Save original destination in stack

.loop:
    mov [rdi], sil      ; Store the byte in destination address
    inc rdi             ; Increment pointers 
    dec rdx             ; Decrement n
    jnz .loop           ; Loop if n is not zero

.done:
    pop rax             ; Retrieve original destination address into rax
    ret
    