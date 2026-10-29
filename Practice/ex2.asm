include 'win32a.inc'

format PE console
entry start

section '.data' data readable writeable
	x	db	8
	y	db	9
	
section '.text' code readable executable
	start:
	mov al, [x]
	mov ah, [0x00401000]
	mov ebx, x
	mov cl, [ebx]
	mov ch, [ebx+1]
	mov dl, [0x402000]
	
	
	
	
	
	push 0
    call [ExitProcess]

section '.idata' import data readable writeable

library kernel32, 'kernel32.dll'

import kernel32,\
       ExitProcess, 'ExitProcess'