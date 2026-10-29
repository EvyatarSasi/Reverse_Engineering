# Notes — Wonderland Stage 3 (static only)

## Evidence
- Handler = `sub_401430` (case 3 of dispatcher sub_401E00, XREF sub_401E00:loc_401E2F).
- Strings used: aWaitCanYouHelp "..Wait! Can you help me first with some..." (intro),
  aHu " %hu", aBadOrInvalidNu "Bad or invalid numbers! Try again...",
  aWrongTryAgain_0 "Wrong! Try again.", aThanksForTheHe "Thanks for the help! You may enter now...".
- Source: ida_exports/wonderland/stage3/sub_401430.txt
- Screenshot: evidence/screenshots/wonderland/stage3/sub_401430_graph.png

## sub_401430 logic
- printf(intro)
- while(1):
    - arr = unsigned short[8]  (var_18, indexed [ebp+i*2+var_18]); bad = 0 (var_8); i = 0 (var_4)
    - for i in 0..7:
        - scanf(" %hu", &arr[i])   [sub_401EB0]
        - if (ret != 1 || arr[i] >= 8): print "Bad or invalid numbers!"; bad=1; break
    - if bad: continue (re-prompt)
    - if (sub_4014F0(arr) != 0): print "Thanks for the help! You may enter now."  (SUCCESS)
      else: print "Wrong! Try again." ; continue

## Verified so far
- Stage 3 input = 8 unsigned shorts, each in range 0..7.
- The decisive check is sub_4014F0(arr); must return nonzero to win.

## sub_4014F0 logic (validator) — ida_exports/wonderland/stage3/sub_4014F0.txt
- short prev = word_404000[arr[0]];
- for j in 1..7:
    - short cur = word_404000[arr[j]];
    - if ((signed)cur > (signed)prev) prev = cur;  else return 0;
- return 1;
=> RULE: table[arr[0]] < table[arr[1]] < ... < table[arr[7]] (strictly increasing, signed 16-bit).
=> Since inputs are 0..7 and need 8 strictly-increasing mapped values, arr must be a
   permutation of {0..7} sorted ascending by word_404000[index].

## word_404000 table (signed 16-bit, little-endian) — from IDA .data dump
- bytes @404000: 07 00 | 21 00 | 01 00 | A8 FD | 78 EC | F1 06 | 0D 00 | 45 00
- index -> value (movsx, signed): 0:7  1:33  2:1  3:-600  4:-5000  5:1777  6:13  7:69

## Verified conclusion — Stage 3 answer
- Win iff table[arr[0]] < ... < table[arr[7]] (strictly increasing). Values all distinct
  => unique permutation = indices sorted ascending by table value.
- Sorted: -5000(4) < -600(3) < 1(2) < 7(0) < 13(6) < 33(1) < 69(7) < 1777(5)
- ANSWER (8 numbers, space/newline separated for " %hu"): 4 3 2 0 6 1 7 5
- Verified in Python: mapped sequence [-5000,-600,1,7,13,33,69,1777] strictly increasing.

## Method note
Static only. No patching, no run of Wonderland.exe. Answer derived from disassembly + the
constant table; permutation computed offline in Python.
