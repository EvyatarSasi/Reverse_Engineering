# Notes — Wonderland Stage 2 (static only)

## Evidence
- Strings (screenshot): כתובת `.data:00404BB0` aWelcomeToWonde = "Welcome to Wonderland. I am the mad hatter... Input a level number (latest level- %d)".
- Strings: `aD_0` = " %d" (@404BAC), `aBadLevelNumber` = "Bad level number." (@404C2C),
  `aYouHavenTUnloc` = "You haven't unlocked this level yet." (@404C40), `asc_404C68` = "\r\n\r\n".
- `_main` (graph screenshot):
  - `call sub_401080` -> var_8 = "latest level".
  - printf welcome + scanf(" %d", &var_4)  [scanf = sub_401EB0, cdecl add esp,8].
  - `test eax,eax; jnz loc_401D70` else "Bad level number."
  - `loc_401D70: mov eax,[var_4]; cmp eax,[var_8]; jle loc_401D87` else "You haven't unlocked...".
  - `loc_401D87`: printf("\r\n\r\n"); `push var_4`; `call sub_401E00`  (dispatcher).
- `sub_401E00` (dispatcher, screenshot): `int __usercall sub_401E00@<eax>(char@<cl>, int)`.
  - `mov eax,[arg_0]` (level); `cmp [var_4], 9 ; switch 10 cases`; `ja def_401E13`.
  - jumptable @ `00401E13`. Cases observed:
    - case 1 -> loc_401E21 -> `call sub_401230`
    - case 2 -> loc_401E28 -> `call sub_401330`
    - case 3 -> loc_401E2F -> `call sub_401430`

## Verified conclusions
- level N -> case N (consistent with course: stage 0 -> case 0, stage 1 -> case 1).
- **Stage 2 handler = sub_401330** (case 2 of jumptable 00401E13). Evidence: screenshot label
  "; jumptable 00401E13 case 2" next to `loc_401E28: call sub_401330`.

## sub_401330 full logic (from ida_exports/wonderland/stage2/sub_401330.txt)
- printf("You know what? That was too easy. *Now*...")  [sub_401DC0 = printf]
- loc_401346: `mov eax,1; test eax,eax; jz ...` -> always-true => while(1) retry loop.
- memset(Buffer, 0, 0x400); fgets(Buffer, 0x3FF, stdin)  [__acrt_iob_func(0)=stdin] = user input.
- var_C = strlen(Buffer).
- var_4 = 0; loop while (var_4 + 3 < var_C), step var_4 += 4:
    - ecx = *(dword*)&Buffer[var_4];  ecx ^= 0x41524241;  *(dword*)&Buffer[var_4] = ecx;
  => XOR each 4-byte block with dword 0x41524241. Little-endian byte key = [41,42,52,41] = "ABRA".
  => per-byte key pattern by index%4: 0x41,0x42,0x52,0x41 (repeats).
- Str = "into the rabbit hole" (aIntoTheRabbitH_0), len = 20.
- strncmp(Buffer, "into the rabbit hole", 20).
  - jz -> "Correct! you may enter..\r\n"
  - else -> "Wrong password!\r\n" and loop back (try again).

## Verified conclusion — Stage 2 answer
- Check: XOR(user_input, key="ABRA" repeating) must equal "into the rabbit hole" (first 20 bytes).
- XOR is self-inverse => password[i] = "into the rabbit hole"[i] XOR key[i%4].
- Computed offline (Python, course method from stage 1 — NOT running Wonderland.exe):
    PASSWORD = (,&.a6:$a03##+&a)->$
  (repr: b'(,&.a6:$a03##+&a)->$', length 20)
- Round-trip verified: XOR(PASSWORD, "ABRA"*) == "into the rabbit hole".
- All bytes printable/typeable (0x23..0x61). Loop covers exactly bytes 0..19 for a 20-char input.

## Method note
Static only. No patching, no register/memory edits, Wonderland.exe NOT run.
Password derived by reconstructing the algorithm and inverting the XOR offline.
