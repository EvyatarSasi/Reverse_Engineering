include 'win32a.inc'

format PE console
entry start

section '.text' code readable executable
	start:
	mov eax, 4
	mov ebx, 5
	mov ecx, 6
	mov edx, 7
	call zero_reg
	push 0
	call [ExitProcess]
	
	
	zero_reg:
	xor eax, eax
	xor ebx, ebx
	xor ecx, ecx
	xor edx, edx
	ret
	

include 'training.inc'

