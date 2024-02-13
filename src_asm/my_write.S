section .text
    global my_write

my_write:
    ; Input Arguments:
    ;   rdi = file descriptor (int fd)
    ;   rsi = pointer to the buffer (void *buf)
    ;   rdx = count of bytes to read (size_t count)
    ; Output: 
    ;   rax = number of bytes read

    ; write to file
    mov eax, 1           ; syscall number for sys_write
    mov rdi, rdi         ; file descriptor
    mov rsi, rsi         ; pointer to the buffer
    mov rdx, rdx         ; count of bytes to write
    syscall             ; invoke the system call
    
    ; rax now contains the number of bytes written
    ret