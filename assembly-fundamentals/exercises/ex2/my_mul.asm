include 'win32a.inc'

format PE console
entry start

section '.data' data readable writeable
		x 	dd	0x2
		y	dd	0x4
		result dd ?
	
section '.text' code readable executable
	start:
	push result
	push [y]
	push [x]
	
	
	call my_mul
	add esp, 12
	mov eax, [result]
	call print_eax
	
	
	
	push 0
    call [ExitProcess]
	
	
	my_mul:
	push ebp
	mov ebp, esp
	mov eax, [ebp + 8]
	mov ebx, [ebp + 12]
	mul ebx
	mov edx, [ebp + 16]
	mov [edx], eax
	pop ebx
	ret
	
	
	
	

include 'training.inc'