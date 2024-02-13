#include "../inc/libasm.h"
#include "stdio.h"
#include <fcntl.h>

size_t asm_strlen(const char *str) 
{
    size_t result = my_strlen(str);

    return result;
}

char *asm_index(const char *s, int c) 
{
    char *result = my_index(s, c);

    return result;
}


char *asm_strchr(const char *str_1, int c) 
{
    char *result = my_strchr(str_1, c); 

    return result;
}

int asm_strcmp(const char *str_1, const char *str_2) 
{
    int result = my_strcmp(str_1, str_2);

    return result;
}

int asm_strncmp(const char *s1, const char *s2, size_t n) 
{
    int result = my_strncmp(s1, s2, n);

    return result;
}

int asm_strcasecmp(const char *s1, const char *s2) 
{
    int result = my_strcasecmp(s1, s2);

    return result;
}


void *asm_memcpy(void *dest, const void *src, size_t n) 
{
    void *result = my_memcpy(dest, src, n);

    return result;
}


void *asm_memmove(void *dest, const void *src, size_t n) 
{
    void *result = my_memmove(dest, src, n);

    return result;
}

void *asm_memset(void *s, int c, size_t n)
{
    void *result = my_memset(s, c, n);

    return result;
}

ssize_t asm_write(int fd, const void *buf, size_t count)
{
    ssize_t result = my_write(fd, buf, count);

    return result;
}

ssize_t asm_read(int fd, void *buf, size_t count) 
{
    ssize_t result = my_read(fd, buf, count);

    return result;
}

int main() {
    // /* testing asm_strlen */
    char *s1 = "hello world!";
    size_t res_strlen = asm_strlen(s1);
    printf("res_strlen = %lu\n", res_strlen);

    // /* testing asm_index */
    char *s2 = "hello world!";
    char c = 'w';
    char *res_index = asm_index(s2, c);
    if (res_index) {
        printf("res_index = %s\n", res_index);
    }

    // /* testing asm_strcmp */
    char *s3 = "hello world!";
    char *s4 = "hello world";
    int res_strcmp = asm_strcmp(s3, s4);
    printf("res_strcmp = %i\n", res_strcmp);

    // /* testing asm_strncmp */
    size_t n = 5;
    char *s5 = "hello world";
    char *s6 = "hello world";
    int res_strncmp = asm_strncmp(s5, s6, n);
    printf("res_strncmp = %i\n", res_strncmp);

    /* testing asm_strchr */
    char *s7 = "hello world!";
    char b = 'l';
    char *res_strchr = asm_strchr(s7, b);
    if (res_strchr) {
        printf("res_strchr = %s\n", res_strchr);
    }

    /* testing asm_strcasecmp */
    char *s8 = "HELLo WorLd";
    char *s9 = "heLlo woRld";
    int res_strcasecmp = asm_strcasecmp(s8, s9);
    printf("res_strcasecmp = %i\n", res_strcasecmp);

    /* testing asm_memcpy */
    char *s10 = "hello world!";
    size_t m = 5;
    char ptr1[50] = "And Now for Something Completely DIFFerent!";
    printf("memcopy string = %s\n", ptr1);
    void *res_memcpy = asm_memcpy(ptr1, s10, m);
    printf("res_memcpy = %p\n", res_memcpy);
    printf("new memcopy string = %s\n", ptr1);

    /* testing asm_memmove */
    char ptr2[50] = "hello world! this is a test.";
    asm_memmove(ptr2 + 5, ptr2, m);
    printf("res_memmove = %s\n", ptr2);

    /* testing asm_memset */
    char d = '*';
    char ptr3[50] = "hello world! This is a different test.";
    asm_memset(ptr3, d, m);
    printf("res_memset = %s\n", ptr3);

    /* testing asm_read */
    char buf[100];
    char file[] = "myfile.txt";
    int fd = open(file, O_RDWR);
    size_t bytes_read = asm_read(fd, buf, 100);
    printf("bytes read: %lu\n", bytes_read);
    printf("read buf = %s\n", buf);

    /* testing asm_write */
    char buff_to_write[13] = "hello world";
    size_t bytes_written = asm_write(fd, buff_to_write, 13);
    printf("bytes written: %lu", bytes_written);

    return 0;    
}
