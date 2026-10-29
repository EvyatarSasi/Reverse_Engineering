# Assignment 1 — Assembly and Windows APIs

Four exercises in 32-bit x86 assembly, using FASM syntax and Windows PE executables.

| Exercise | Main source | Focus |
| --- | --- | --- |
| 1 | [ex1_while.asm](exercises/ex1/ex1_while.asm) | Iterative Collatz sequence processing and conditional branches |
| 2 | [ex2_a.asm](exercises/ex2/ex2_a.asm), [ex2_b.asm](exercises/ex2/ex2_b.asm), [ex2_c.asm](exercises/ex2/ex2_c.asm), [ex2_d.asm](exercises/ex2/ex2_d.asm) | Calling conventions, stack cleanup, register arguments, and returning a result through a pointer |
| 3 | [winAPI.asm](exercises/ex3/winAPI.asm) | Console input with `GetStdHandle` and `ReadFile`, string length, and formatted output |
| 4 | [Endien_with_WinAPI.asm](exercises/ex4/Endien_with_WinAPI.asm) | Byte-order conversion using console, file, and registry input |

## Supporting files and versions

- Exercise 2 includes the earlier `my_mul*.asm` variants and their executables alongside the submitted `ex2_*.asm` sources. They are retained as separate versions.
- Exercise 4 also contains a legacy `aaa.asm` / `aaa.exe` pair. Its source matches `Endien_with_WinAPI.asm`, but the executable differs; the pair is retained rather than assuming the binaries are interchangeable.
- `training.inc` is a shared course helper included locally by exercises that reference it.
- [input.txt](exercises/ex4/input.txt) is the file input for exercise 4. Its registry input is read from `HKEY_CURRENT_USER\Software\Assembly1`, value `input`.

## Environment

The sources require FASM with its Windows include files, including `win32a.inc`. Keep each exercise's supporting files together, and use the exercise directory as the working directory when running a program that reads relative file paths.

The sources and executables are preserved coursework artifacts. The existing executables were not rebuilt or tested as part of repository organization.

[Back to repository overview](../README.md)
