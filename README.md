# string_lib_asm
A collection of assembly language helper functions, offering functionality that closely parallels the string manipulation capabilities found in the C standard library's `string.h`.

## Description
List of functions included in the library:
- strlen      -> my_strlen
- strchr      -> my_strchr
- memset      -> my_memset
- memcpy      -> my_memcpy
- strcmp      -> my_strcmp
- memmove     -> my_memmove

- strncmp     -> my_strncmp
- strcasecmp  -> my_strcasecmp
- index       -> my_index

- read        -> my_read
- write       -> my_write 

Each assembly function is contained in its own function_name.S file, compiled together with, and called by parallel functions in my_libasm.c using the included Makefile.

## Installation
The Makefile and assembly language functions are written for a Linux, X86-40  environment. T
Make sure you have all required directories as well as the Makefile available:
/build
/inc
/src_asm
/src_c

Compile the program:
```
-> make
```
Clean up:
```
-> make fclean
```

## Usage
Each .S function has a parallel .c function. The .c calls the .S and passes arguments.

Naming convention example:

.c func = asm_strlen()

.S func = my_strlen()

There are a series of tests in the main() located in my_libasm.c, one test per function.

Run the program:
```
./my_libasm
```

### The Core Team

Rebecca Whipple Silverstein and Mathius Johnson


<span><i>Made at <a href='https://qwasar.io'>Qwasar SV -- Software Engineering School</a></i></span>
<span><img alt='Qwasar SV -- Software Engineering School's Logo' src='https://storage.googleapis.com/qwasar-public/qwasar-logo_50x50.png' width='20px' /></span>