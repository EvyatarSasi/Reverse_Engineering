include 'win32a.inc'

format PE console
entry start

section '.data' data readable writeable
		x 	db	0x4
	
section '.text' code readable executable
	start:
	xor eax, eax
	inc eax
	
	
	
	
	
	push 0
    call [ExitProcess]

include 'training.inc'