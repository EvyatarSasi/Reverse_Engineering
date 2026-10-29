# Notes — Wonderland Stage 4 (static + dynamic observation allowed; no patching)

## Evidence
- Handler = `sub_401570` (case 4 of dispatcher sub_401E00, XREF sub_401E00:loc_401E36).
- Source: ida_exports/wonderland/stage4/sub_401570.txt
- Screenshot: evidence/screenshots/wonderland/stage4/sub_401570_graph.png
- Strings: aWaitIHaveSomet "Wait... I have something on the tip of...", aDu " %du",
  aErrorBadInputT "Error - bad input. Try again.", aWrong "Wrong!",
  aCheaterTryAgai "Cheater.. Try again another way.",
  aYeahGoodLuckAn "Yeah! Good luck!! (and good job!)".

## sub_401570 logic
- printf(intro)
- while(1):
    - scanf(" %du", &Str1)  [Str1 = dword ptr -4]  -> reads an INTEGER. ret!=1 -> "Error - bad input".
    - build target buffer Str (byte[16]) from 3 dwords:
        [Str+0]=0x646F6F47 "Good", [Str+4]=0x63756C20 " luc", [Str+8]=0x0021216B "k!!\0"
        => Str = "Good luck!!" (len 11)
    - strncmp((char*)Str1, Str, 11):  Str1 is used as a POINTER (push [Str1] as Str1 arg).
        != 0 -> "Wrong!" ; continue
    - if (Str1 == &Str) -> "Cheater.. Try again another way." ; continue   (anti-cheese)
    - else -> "Yeah! Good luck!! (and good job!)"   (SUCCESS)

## Key insight
- The typed number is interpreted as an address. Must point to bytes "Good luck!!".
- "Good luck!!" exists as a substring of aYeahGoodLuckAn ("Yeah! Good luck!! ...") at +6.

## PE facts (static, from binaries/Wonderland.exe)
- ImageBase = 0x400000. DllCharacteristics = 0x8100 -> DYNAMIC_BASE (ASLR) OFF.
  => static VA == runtime address, so a fixed typed number works.
- aYeahGoodLuckAn VA = 0x404738 ; "Good luck!!" at 0x404738+6 = 0x40473E = 4212542 dec.
- file offsets: "Yeah!..." @0x3738, "Good luck!!" @0x373e, section .data.

## Verified conclusion — Stage 4 answer
- ANSWER (type this number): 4212542   (= 0x40473E)
- It points to "Good luck!!" inside the success string; strncmp passes; not equal to local
  buffer -> no "Cheater" -> prints "Yeah! Good luck!! (and good job!)".

## Method note
Derived statically from disassembly + reading the exe bytes + PE header (VA computation).
Wonderland.exe NOT run. No patching / no register/memory edits. (Dynamic observation was
allowed for stage 4 but was not needed.)
