#ifndef _LIBASM_H
#define _LIBASM_H

#include <stddef.h>
#include <unistd.h>

extern size_t my_strlen(const char *str);
extern char *my_index(const char *s, int c);
extern void *my_memcpy(void *dest, const void *src, size_t n);
extern void *my_memmove(void *dest, const void *src, size_t n);
extern void *my_memset(void *s, int c, size_t n);
extern ssize_t my_read(int fd, void *buf, size_t count);
extern int my_strcasecmp(const char *s1, const char *s2);
extern char *my_strchr(const char *str_1, int c);
extern char *my_strchr_c(const char *str_1, int c);
extern int my_strcmp(const char *str_1, const char *str_2);
extern int my_strncmp(const char *s1, const char *s2, size_t n);
extern ssize_t my_write(int fd, const void *buf, size_t count);

#endif  