# Final Project — Reverse Engineering Windows Minesweeper

Analysis and modification of the 32-bit Windows Minesweeper executable using IDA and its Local Windows Debugger. The project investigates the board's memory representation, traces initialization code, and adds behavior through binary patches.

**[Read the complete report](minesweeper-technical-report.pdf)** — 22 pages in Hebrew, including disassembly, memory addresses, patch bytes, and screenshots.

## Executable versions

| Stage | Executable | Behavior documented in the report |
| --- | --- | --- |
| A — Reveal the mines | [WINMINE-stage-a.exe](WINMINE-stage-a.exe) | Flags mines during board initialization |
| B — Quick victory | [WINMINE-stage-b.exe](WINMINE-stage-b.exe) | Starts with one flagged mine, without changing the timer |
| C — Startup message | [WINMINE-stage-c.exe](WINMINE-stage-c.exe) | Adds a message box before returning to the original entry point; retains the stage A patch |
| D — Local HTTP request | [WINMINE-stage-d.exe](WINMINE-stage-d.exe) | Loads WinINet functions dynamically, sends a request to a local server, displays the message box, and returns to the original entry point |

These are separate stage artifacts; the table describes each version rather than implying that every stage includes all earlier changes.

## Techniques covered

- Locating the board in the data section and interpreting cell flags.
- Using hardware write breakpoints and cross-references to locate relevant instructions.
- Mapping virtual addresses and RVAs to file offsets.
- Modifying instructions and redirecting the PE entry point into unused executable space.
- Reusing imported functions and resolving additional APIs with `LoadLibraryA` and `GetProcAddress`.

## Runtime context

The executables target Windows. Stage D contacts `http://127.0.0.1/pwned_by_Evyatar` on port 80; the report's demonstration uses a local HTTP server to record that request. The server implementation is not included in this repository. Stages C and D display the text `Hacked by Evyatar` as part of the assignment.

The report documents the original runtime checks. The executable files were preserved without modification and were not rerun during repository organization.

[Back to repository overview](../README.md)
