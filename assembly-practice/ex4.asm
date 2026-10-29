include 'win32a.inc'

format PE console
entry start
	
section '.text' code readable executable
	start:
	call read_hex
	mov ebx, eax
	shl ebx, 31
	cmp ebx,0
	je num
	inc eax
	call print_eax
	jmp ExitProcess
	num:
	call print_eax
	
	
	push 0
    call [ExitProcess]

include 'training.inc'