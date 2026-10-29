;תרגיל 2 א
include 'win32a.inc'

format PE console
entry start

section '.data' data readable writeable
		x 	dd	0x2
		y	dd	0x4
	
section '.text' code readable executable
	start:
	push [y]
	push [x]
	call __cdecl_my_mul
	add esp, 8
	call print_eax
	
	
	
	
	push 0
    call [ExitProcess]
	
	
	__cdecl_my_mul:
	push ebp
	mov ebp, esp
	mov ebx, [ebp + 8]
	mov eax, [ebp + 12]
	mul ebx
	pop ebp
	ret
	
	

include 'training.inc'