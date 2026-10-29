# Notes — Wonderland Stage 5 (static + dynamic observation allowed; no patching)

## Evidence
- Handler = `sub_401650` (case 5 of dispatcher sub_401E00, XREF sub_401E00:loc_401E3D).
- Validator = `sub_401770`.
- Sources: ida_exports/wonderland/stage5/sub_401650.txt , sub_401770.txt
- Screenshot: evidence/screenshots/wonderland/stage5/sub_401650_graph.png
- Strings: "You may enter, but can you find the Queen's palace?", "Wrong!", "ERROR!",
  "You are lost!", "You have found the Queen's palace!".

## sub_401650 logic (handler)
- printf(intro)
- while(1):
    - fgets(Buffer, 0x3FF, stdin); Buffer[strlen-1]=0  -> Buffer = a FILE PATH (newline stripped)
    - hFile = CreateFileA(Buffer, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, NORMAL, NULL)
    - if hFile==INVALID_HANDLE_VALUE -> "Wrong!" ; continue
    - ReadFile(hFile, fileData(var_808), 0x400, &n, NULL); if fail -> "ERROR!"; close; continue
    - CloseHandle(hFile)
    - if (sub_401770(fileData) != 0) -> "You have found the Queen's palace!"  (SUCCESS)
      else -> "You are lost!" ; continue

## sub_401770 logic (maze walker)
- pos = strchr(Str, 'O')            ; Str = global map @ 0x404020 (96 bytes = 6 rows x 16 cols)
- i = 0
- loop:
    - m = cmds[i] - '1'             ; switch 4 cases; if (unsigned)m>3 -> return 0
    - '1'(+1 right) '2'(+0x10 down) '3'(-1 left) '4'(-0x10 up)   ; flat-index moves
    - i++
    - if (cmds[i]!=0 && *pos=='.') continue   ; intermediate cell must be '.'
    - break
- return (*pos == 'X') ? 1 : 0

## Map (Str @ VA 0x404020, width 16)
```
################
###O####...#####
###.##...#.#####
###.##.###.#####
###....###...X##
################
```
O at index 19 (r1,c3); X at index 77 (r4,c13). '.'=walkable, others=wall.

## Verified conclusion — Stage 5 answer
- Need a move string from O to X over '.' cells, ending on 'X'. Moves: 1=right,2=down,3=left,4=up.
- BFS shortest path (verified by exact simulation of sub_401770): 
    PATH = 2221114411411222111   (19 moves)
- HOW TO SOLVE:
    1) Create a file containing the bytes: 2221114411411222111
    2) Run stage 5 and type that file's path/name as input.
  -> prints "You have found the Queen's palace!"
- (Trailing newline/garbage in file is harmless: landing on 'X' breaks the loop since 'X' != '.'.)

## Method note
Derived statically: handler + validator from disassembly; map Str read from the exe bytes
(VA computed from PE sections). Path computed offline (BFS) and verified by simulating the
validator's exact semantics. Wonderland.exe NOT run; no patching / no state edits.
(Dynamic observation was allowed but not needed.)
