;תרגיל 2 ג
include 'win32a.inc'

format PE console
entry start

section '.data' data readable writeable
		x 	dd	0x2
		y	dd	0x4
	
section '.text' code readable executable
	start:
	mov eax, [x]
	mov ebx, [y]
	call __fast_my_mul
	call print_eax
	
	
	push 0
    call [ExitProcess]
	
	
	__fast_my_mul:
	push ebp
	mov ebp, esp
	mul ebx
	pop ebp
	ret
	
	

include 'training.inc'