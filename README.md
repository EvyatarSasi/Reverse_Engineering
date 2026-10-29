# Introduction to Reverse Engineering

Coursework covering 32-bit x86 assembly, Windows APIs, executable analysis, and binary patching. The repository contains assembly exercises, a C reconstruction, analysis reports, IDA evidence, and a final project on Windows Minesweeper.

The original reports are in Hebrew; this page provides an English guide to the work.

## Technical Write-ups

### Minesweeper - Binary Patching
- [Full Technical Report (PDF)](minesweeper-binary-patching/minesweeper-technical-report.pdf)

### Wonderland - Executable Analysis
- [Complete Analysis with IDA Screenshots](executable-analysis/reversing_workspace/final/wonderland-analysis.md)
- [Complete Report (PDF)](executable-analysis/reversing_workspace/final/wonderland.pdf)

#### Individual Stage Reports
- [Stage 2 - XOR Decoding](executable-analysis/reversing_workspace/final/wonderland_stage2_writeup.md)
- [Stage 3 - Signed Comparisons](executable-analysis/reversing_workspace/final/wonderland_stage3_writeup.md)
- [Stage 4 - Pointer Analysis](executable-analysis/reversing_workspace/final/wonderland_stage4_writeup.md)
- [Stage 5 - Maze Reconstruction](executable-analysis/reversing_workspace/final/wonderland_stage5_writeup.md)

## Start here

- **[Minesweeper final project](minesweeper-binary-patching/minesweeper-technical-report.pdf)** — a 22-page report documenting runtime investigation, board memory layout, hardware breakpoints, and patches, with four corresponding executable versions in [Final-Assignment](minesweeper-binary-patching/).
- **[Wonderland analysis](executable-analysis/reversing_workspace/final/wonderland-analysis.md)** — illustrated walkthrough of stages 2–5, covering XOR decoding, signed comparisons, pointers, and a maze encoded in memory. Also available as a [PDF](executable-analysis/reversing_workspace/final/wonderland.pdf).
- **[C reconstruction of rect.exe](executable-analysis/reversing_workspace/final/rect.c)** — reconstruction of a rectangle-drawing program, including its calling convention, loops, and buffer layout. See the [IDA disassembly](executable-analysis/reversing_workspace/ida_exports/rect/) for supporting evidence.

## Assignments

| Assignment | Focus | Files |
| --- | --- | --- |
| 1 — Assembly and Windows APIs | Control flow, calling conventions, console input, byte order, file and registry access | [Assignment guide](assembly-fundamentals/README.md) |
| 2 — Executable analysis | C reconstruction and analysis of Wonderland stages 2–5 | [Assignment guide](executable-analysis/README.md) |
| Final — Minesweeper | Dynamic analysis, memory inspection, and binary patching | [Project guide](minesweeper-binary-patching/README.md) |

### Assignment 1

- [Exercise 1](assembly-fundamentals/exercises/ex1/): iterative Collatz sequence processing.
- [Exercise 2](assembly-fundamentals/exercises/ex2/): multiplication routines using different calling conventions and parameter-passing methods. Both development and submission variants are retained.
- [Exercise 3](assembly-fundamentals/exercises/ex3/): console input and string length using Windows APIs and the C runtime.
- [Exercise 4](assembly-fundamentals/exercises/ex4/): byte-order conversion with input from the console, a file, and the Windows registry.

### Assignment 2

The deliverables include `rect.c`, individual Wonderland write-ups, a combined report, screenshots, and disassembly exports. The Wonderland reports describe static analysis for all four stages, with Python used for calculations derived from the disassembly.

### Additional practice

[Practice](assembly-practice/README.md) contains smaller exercises in memory addressing, comparisons, loops, register operations, XOR decoding, and byte-order conversion. These files are kept separately from the assignment submissions.

## Tools and environment

- **x86 assembly / FASM syntax** for the assembly exercises.
- **C** for the reconstruction of `rect.exe`.
- **IDA** for disassembly, graph views, cross-references, and the final project's Windows debugging workflow.
- **Windows API** calls for console, file, and registry access.

The assembly sources target 32-bit Windows PE executables and reference FASM's `win32a.inc`; exercises that use `training.inc` include a local copy. Building them requires a configured FASM Windows include environment. The C reconstruction uses `__stdcall` and is intended for an x86 Windows C toolchain. This repository does not include an automated build or test pipeline.

## Repository contents

```text
assembly-fundamentals/       Assembly exercises, supporting files, and executables
executable-analysis/       Analysis deliverables, disassembly, and supporting material
minesweeper-binary-patching/    Minesweeper report and four patched executables
assembly-practice/            Additional assembly exercises
```

Course-provided reference materials are excluded from this portfolio. Original analysis, reports, and supporting evidence are available above.
