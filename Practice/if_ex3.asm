include 'win32a.inc'

format PE console
entry start

section '.data' data readable writeable
		x 	db	0x4
	
section '.text' code readable executable
	start:
	call read_hex
	mov ebx, eax
	call read_hex
	mov edx, eax
	cmp ebx, eax
	jb make
	print:
	mov eax, ebx
	call print_eax
	mov eax, edx
	call print_eax
	jmp exit
	make:
	xor ebx, edx
	xor edx, ebx
	xor ebx, edx
	jmp print
	exit:
	
	
	
	
	push 0
    call [ExitProcess]

include 'training.inc'