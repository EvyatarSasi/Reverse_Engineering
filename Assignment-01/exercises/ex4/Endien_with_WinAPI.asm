;תרגיל 4
include 'win32a.inc'

format PE console
entry start

section '.data' data readable writeable

console_buf db 32 dup(0)
file_buf    db 32 dup(0)

bytes_console dd ?
bytes_file    dd ?

filename db 'input.txt',0

subkey  db 'Software\Assembly1',0
valname db 'input',0

hFile dd ?
hKey  dd ?

reg_value dd ?
reg_size  dd 4

fmt db '%08X',13,10,0

section '.text' code readable executable

start:

; read hex input from console

    push -10
    call [GetStdHandle]

    lea ebx,[bytes_console]

    push 0
    push ebx
    push 20
    push console_buf
    push eax
    call [ReadFile]

    push console_buf
    call parse_hex
    add esp,4

    call swap32

    push eax
    push fmt
    call [printf]
    add esp,8

; read data from file

    push 0
    push 0
    push 3
    push 0
    push 3
    push 80000000h
    push filename
    call [CreateFileA]

    mov [hFile],eax

    lea ebx,[bytes_file]

    push 0
    push ebx
    push 20
    push file_buf
    push eax
    call [ReadFile]

    mov ecx,[bytes_file]
    mov byte [file_buf+ecx],0

    push file_buf
    call parse_hex
    add esp,4

    call swap32

    push eax
    push fmt
    call [printf]
    add esp,8

    push [hFile]
    call [CloseHandle]

; read hex value from registry

    lea eax,[hKey]

    push eax
    push 20019h
    push 0
    push subkey
    push 80000001h
    call [RegOpenKeyExA]

    cmp eax,0
    jne reg_end

    lea eax,[reg_size]
    push eax

    lea eax,[reg_value]
    push eax

    push 0
    push 0
    push valname
    push [hKey]
    call [RegQueryValueExA]

    cmp eax,0
    jne reg_end

    mov eax,[reg_value]

    call swap32

    push eax
    push fmt
    call [printf]
    add esp,8

reg_end:

    push [hKey]
    call [RegCloseKey]

    push 0
    call [ExitProcess]

; convert input hex string to integer (eax)

parse_hex:
    push ebx
    push ecx
    push esi

    mov esi,[esp+16]

    xor eax,eax
    xor ecx,ecx

parse_next:
    mov bl,[esi+ecx]

    cmp bl,0
    je parse_done
    cmp bl,13
    je parse_done
    cmp bl,10
    je parse_done

    shl eax,4

    cmp bl,'9'
    jle parse_digit

    and bl,0DFh
    sub bl,'A'-10
    jmp parse_add

parse_digit:
    sub bl,'0'

parse_add:
    movzx ebx,bl
    or eax,ebx

    inc ecx
    jmp parse_next

parse_done:
    pop esi
    pop ecx
    pop ebx
    ret

; reverse bytes in eax

swap32:
    mov ebx,eax

    mov eax,ebx
    and eax,000000FFh
    shl eax,24

    mov ecx,ebx
    and ecx,0000FF00h
    shl ecx,8
    or eax,ecx

    mov ecx,ebx
    and ecx,00FF0000h
    shr ecx,8
    or eax,ecx

    mov ecx,ebx
    and ecx,0FF000000h
    shr ecx,24
    or eax,ecx

    ret


section '.idata' import data readable

library kernel32,'kernel32.dll',\
        advapi32,'advapi32.dll',\
        msvcrt,'msvcrt.dll'

import kernel32,\
       GetStdHandle,'GetStdHandle',\
       CreateFileA,'CreateFileA',\
       ReadFile,'ReadFile',\
       CloseHandle,'CloseHandle',\
       ExitProcess,'ExitProcess'

import advapi32,\
       RegOpenKeyExA,'RegOpenKeyExA',\
       RegQueryValueExA,'RegQueryValueExA',\
       RegCloseKey,'RegCloseKey'

import msvcrt,\
       printf,'printf'