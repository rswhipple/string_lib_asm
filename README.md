# string_lib_asm

Welcome to `string_lib_asm`, a collection of assembly language helper functions, offering functionality that closely parallels the string manipulation capabilities found in the C standard library `string.h`.

## Description

The library implements the following functions:

- `strlen` as `my_strlen`
- `strchr` as `my_strchr`
- `memset` as `my_memset`
- `memcpy` as `my_memcpy`
- `strcmp` as `my_strcmp`
- `memmove` as `my_memmove`
- `strncmp` as `my_strncmp`
- `strcasecmp` as `my_strcasecmp`
- `index` as `my_index`
- `read` as `my_read`
- `write` as `my_write`

Each function is contained within its own `.S` file. The automated build process creates an executable program as well as static and dynamic libraries.

## Installation

This program will only compile on Linux systems with an X86-64 architecture. To compile the library and its components, run the Makefile from the project repository.

Compile:

```bash
make
```

Clean up:

```bash
make fclean
```

## Usage Guidelines

The static and dynamic libraries can be used with any C program on Linux systems with X86-64 architecture. 

Within the `my_libasm` program, each assembly function is callable from a corresponding C function, with a standardized naming convention, e.g., `asm_strlen()` in C calls `my_strlen()` in assembly.

Run the unit tests for each function via the `main()` in `my_libasm.c`:

```bash
./my_libasm
```

## Demonstrated Skills

- **Advanced Assembly Programming**: Developed assembly language functions for string manipulation, showcasing knowledge of low-level programming.
  
- **Library Development**: Proficient in creating both static and dynamic libraries, enabling distribution and reusability of code across projects.

- **Build Automation**: Implemented an automated build process using Makefile, showing the ability to streamline the compilation and linking of complex projects.

- **Cross-Language Integration**: Integrated assembly routines with C, highlighting an understanding of language interoperability.


### The Core Team
Group project created by:
Rebecca Whipple Silverstein and Mathius Johnson


<span><i>Made at <a href='https://qwasar.io'>Qwasar SV -- Software Engineering School</a></i></span>