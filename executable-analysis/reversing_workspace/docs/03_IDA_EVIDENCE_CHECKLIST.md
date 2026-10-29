# IDA evidence checklist

For each target, collect as much as possible.

## Global evidence

- Function list.
- Imports list.
- Strings list.
- Interesting strings and xrefs.
- Main or likely main.
- Control-flow screenshots of key functions.

## For `rect.exe`

Save under:
- `ida_exports/rect/`
- `evidence/screenshots/rect/`

Collect:
- main disassembly.
- every function called from main.
- stack frame view for each important function.
- evidence of calling convention:
  - `ret N`
  - caller-side `add esp, N`
  - argument pushes
  - local variable layout

## For Wonderland stage 2

Save under:
- `ida_exports/wonderland/stage2/`
- `evidence/screenshots/wonderland/stage2/`

Collect:
- stage 2 strings.
- xrefs to stage 2 strings.
- stage 2 function graph.
- key comparisons and branches.
- pseudocode notes.

## For Wonderland stage 3

Same as stage 2, under `stage3`.

## For Wonderland stage 4 and 5

Static evidence:
- same as stages 2 and 3.

Dynamic evidence:
- breakpoints used.
- register values observed.
- stack observations.
- run logs.
- screenshots of debugger state.

Forbidden evidence:
- any screenshot showing edited registers, patched bytes, patched jumps, or changed memory.
