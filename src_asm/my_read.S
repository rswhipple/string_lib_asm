section .text
    global my_read

my_read:
    ; Input Arguments:
    ;   rdi = file descriptor (int fd)
    ;   rsi = pointer to the buffer (void *buf)
    ;   rdx = count of bytes to read (size_t count)
    ; Output: 
    ;   rax = number of bytes read

    ; read from file
    mov eax, 3           ; syscall number for sys_read
    mov ebx, edi         ; file descriptor
    mov ecx, esi         ; pointer to the buffer
    mov edx, edx         ; count of bytes to read
    int 0x80

    ; rax now contains the number of bytes read
    ret
