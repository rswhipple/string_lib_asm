# string_lib_asm

Welcome to `string_lib_asm`, A collection of assembly language helper functions, offering functionality that closely parallels the string manipulation capabilities found in the C standard library's `string.h`.

## Description

The library implements the following functions:

- `strlen` replicated as `my_strlen`
- `strchr` replicated as `my_strchr`
- `memset` replicated as `my_memset`
- `memcpy` replicated as `my_memcpy`
- `strcmp` replicated as `my_strcmp`
- `memmove` replicated as `my_memmove`
- `strncmp` replicated as `my_strncmp`
- `strcasecmp` replicated as `my_strcasecmp`
- `index` replicated as `my_index`
- `read` replicated as `my_read`
- `write` replicated as `my_write`

Each function is contained within its own `.s` file, with parallel C functions in `my_libasm.c` for calling the assembly functions. The  managed via an included Makefile for automation.

## Installation

Designed for Linux systems with an X86-64 architecture, to compile the library and its components, run the Makefile from the project repository.

Compile:

```bash
make
```

Clean up compiled objects and libraries:

```bash
make fclean
```

## Usage Guidelines

The static and dynamic libraries can be used with any C program on Linuz systems with X86-64 architecture. 

Within the `my_libasm` program, each assembly function is callable from a corresponding C function, with a standardized naming convention, e.g., `asm_strlen()` in C calls `my_strlen()` in assembly.

To run the unit tests for each function through the `main()` in `my_libasm.c`:

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