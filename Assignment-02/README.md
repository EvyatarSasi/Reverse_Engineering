# Assignment 2 — Executable Analysis

This assignment combines reconstruction of a Windows executable in C with analysis of Wonderland stages 2–5. Reports and research notes are primarily in Hebrew.

## Deliverables

| Work | Read online | PDF |
| --- | --- | --- |
| Rectangle program reconstruction | [rect.c](reversing_workspace/final/rect.c) | — |
| Wonderland, combined report | [Report with IDA screenshots](reversing_workspace/final/final.md) | [Combined PDF](reversing_workspace/final/wonderland.pdf) |
| Stage 2 — XOR decoding | [Write-up](reversing_workspace/final/wonderland_stage2_writeup.md) | [PDF](reversing_workspace/final/pdf/wonderland_stage2_writeup.pdf) |
| Stage 3 — Signed values and index ordering | [Write-up](reversing_workspace/final/wonderland_stage3_writeup.md) | [PDF](reversing_workspace/final/pdf/wonderland_stage3_writeup.pdf) |
| Stage 4 — Integer input interpreted as a pointer | [Write-up](reversing_workspace/final/wonderland_stage4_writeup.md) | [PDF](reversing_workspace/final/pdf/wonderland_stage4_writeup.pdf) |
| Stage 5 — File input and maze validation | [Write-up](reversing_workspace/final/wonderland_stage5_writeup.md) | [PDF](reversing_workspace/final/pdf/wonderland_stage5_writeup.pdf) |

The Wonderland write-ups document static analysis for stages 2–5. Python was used for external calculations based on the recovered logic; the reports do not claim runtime verification of Wonderland.

## Supporting evidence

- [IDA disassembly exports](reversing_workspace/ida_exports/)
- [IDA screenshots](reversing_workspace/evidence/screenshots/)
- [Research notes](reversing_workspace/notes/)
- [Analyzed binaries](reversing_workspace/binaries/)
- [Assignment brief](reversing_workspace/docs/00_ASSIGNMENT_BRIEF.md)
- [Course reference materials](reversing_workspace/materials/)
- [Additional Word and PDF documents](writeups/)

The existing workspace layout is retained so that the reports' image references and evidence paths continue to resolve.

[Back to repository overview](../README.md)
