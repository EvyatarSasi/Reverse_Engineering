# Reverse Engineering & x86 Assembly

A collection of hands-on projects exploring **32-bit x86 assembly, Windows executable analysis, reverse engineering, and binary patching**.

The work includes reconstructing program logic from disassembly, investigating memory structures, working with Windows APIs, and modifying executable behavior.

These projects were developed as part of academic coursework. Technical reports, source code, and supporting evidence are included.

## Featured Projects

### 1. Windows Minesweeper — Reverse Engineering & Binary Patching

Analyzed and modified a 32-bit Windows Minesweeper executable using **IDA and the Local Windows Debugger**.

The project involved investigating the game's internal memory representation, identifying relevant instructions, and implementing binary modifications.

**Key techniques:**

* Memory analysis and hardware breakpoints.
* Disassembly, cross-references, and control-flow investigation.
* Mapping virtual addresses to executable file offsets.
* Patching machine instructions and redirecting the PE entry point.
* Dynamically resolving Windows API functions.

**Four executable variants were developed:**

1. Automatically flagging mines.
2. Modifying the game to enable a quick victory.
3. Displaying a startup message through a binary modification.
4. Performing a local HTTP request using dynamically resolved WinINet functions.

**Documentation:**

* [Technical Report — 22 pages (PDF)](minesweeper-binary-patching/minesweeper-technical-report.pdf)
* [Project Details and Executable Versions](minesweeper-binary-patching/README.md)

---

### 2. Wonderland — Static Reverse Engineering

Performed static analysis of a multi-stage Windows executable using **IDA**.

The objective was to understand the program's behavior by examining its disassembly and reconstructing the logic behind individual stages.

**Analyzed stages:**

* **Stage 2:** XOR decoding.
* **Stage 3:** Signed comparisons and index ordering.
* **Stage 4:** Pointer interpretation and memory access.
* **Stage 5:** File input and maze validation.

The analysis was performed without executing or patching the Wonderland binary. Python was used for calculations derived from the recovered logic.

**Documentation:**

* [Complete Analysis with IDA Screenshots](executable-analysis/reversing_workspace/final/wonderland-analysis.md)
* [Complete Technical Report (PDF)](executable-analysis/reversing_workspace/final/wonderland.pdf)

**Individual Write-ups:**

* [Stage 2 — XOR Decoding](executable-analysis/reversing_workspace/final/wonderland_stage2_writeup.md)
* [Stage 3 — Signed Comparisons](executable-analysis/reversing_workspace/final/wonderland_stage3_writeup.md)
* [Stage 4 — Pointer Analysis](executable-analysis/reversing_workspace/final/wonderland_stage4_writeup.md)
* [Stage 5 — Maze Reconstruction](executable-analysis/reversing_workspace/final/wonderland_stage5_writeup.md)

---

### 3. Executable Reconstruction — Assembly to C

Analyzed `rect.exe`, a Windows program that draws rectangles, and reconstructed its behavior in C.

The reconstruction focuses on understanding the original executable's:

* Control flow and loops.
* Function calling conventions.
* Memory and buffer layout.
* Program behavior inferred from disassembly.

**Source and Evidence:**

* [Reconstructed C Source Code](executable-analysis/reversing_workspace/final/rect.c)
* [IDA Disassembly Exports](executable-analysis/reversing_workspace/ida_exports/rect/)

---

### 4. x86 Assembly & Windows API Programming

Implemented assembly-language exercises using **FASM**, targeting 32-bit Windows.

Topics include:

* Control flow, loops, and conditional branches.
* Stack operations and calling conventions.
* Register-based and stack-based parameter passing.
* Console input and output.
* File access and Windows Registry operations.
* Byte-order conversion and memory manipulation.

**Source Code:**

* [Assembly Exercises](assembly-fundamentals/README.md)
* [Additional Assembly Practice](assembly-practice/README.md)

## Technical Skills Demonstrated

| Area                  | Technologies & Techniques                                  |
| --------------------- | ---------------------------------------------------------- |
| Low-Level Programming | x86 Assembly, FASM, C                                      |
| Reverse Engineering   | IDA, Disassembly, Static Analysis                          |
| Debugging             | Windows Debugging, Hardware Breakpoints, Memory Inspection |
| Binary Modification   | Machine-Code Patching, PE Entry-Point Redirection          |
| Windows Development   | Windows API, WinINet, DLL Function Resolution              |
| Program Analysis      | Control Flow, Calling Conventions, Memory Layout           |

## Repository Structure

| Directory                                                   | Contents                                                                           |
| ----------------------------------------------------------- | ---------------------------------------------------------------------------------- |
| [minesweeper-binary-patching](minesweeper-binary-patching/) | Minesweeper reverse engineering project, patched executables, and technical report |
| [executable-analysis](executable-analysis/)                 | Wonderland analysis, C reconstruction, IDA evidence, and write-ups                 |
| [assembly-fundamentals](assembly-fundamentals/)             | x86 assembly exercises and Windows API programming                                 |
| [assembly-practice](assembly-practice/)                     | Additional low-level programming exercises                                         |

## Notes

* The original technical reports are primarily written in **Hebrew**. This README provides an English overview.
* The projects target **32-bit Windows executables**.
* Assembly exercises require FASM and the appropriate Windows include files.
* Existing executables were preserved and were not rebuilt or retested during repository organization.
* The repository does not currently include an automated build or test pipeline.
* Course-provided reference materials are excluded from the current repository structure.
