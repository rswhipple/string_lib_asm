section .text
    global my_memmove

 my_memmove:
    ; Input Arguments: 
    ;   rdi = destination address
    ;   rsi = source address
    ;   rdx = n (number of bytes to be copied into dest from source)
    ; Output: 
    ;   rax = memory address for destination

    cmp rdx, 0          ; check if n is zero 
    je .done

    ; check the relative locations of dest and source
    ; if destination is at a higher address, copy memory backwards to avoid writing over data
    cmp rdi, rsi            
    jae .backwards_copy     ; jump if above or equal
    
 .forwards_copy:
    mov rcx, rdx        ; move number of bytes to copy into rcx to set up next instruction
    rep movsb           ; this command will move rcx bytes from rsi into rdi
    jmp .done

 .backwards_copy: 
    add rdi, rdx    ; add 'n' bytes to both the dest and source
    add rsi, rdx
    dec rdi         ; decrement each by 1 to move into correct location
    dec rsi
    mov rcx, rdx    ; move number of bytes to copy into rcx to set up next instruction
    std             ; change the flag direction so that rep movsb will work backwords
    rep movsb       ; this command will move rcx bytes from rsi into rdi from end backwards
    cld             ; restore direction flag
    jmp .done

 .done:
    ret