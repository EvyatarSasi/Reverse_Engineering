include 'win32a.inc'

format PE console
entry start


	
section '.text' code readable executable
	start:
	call read_hex
	add eax, 1
	mov ebx, eax  ;num = ebx = 5
	
	xor ecx, ecx  ;i = ecx = 0
	inc ecx
	xor edx, edx  ;j = edx = 0
	
	
;-------------------------------

	for1:
	inc ecx ; ecx = 1 2 3 4 5
	cmp ebx, ecx
	je ExitProcess
	xor edx, edx
;-------------------------------
	for2:
	inc edx
	mov eax, edx   ;eax = 1
	call print_eax
	cmp ecx, edx
	je for1
	jne for2
	
	

	
	
	
	
	
	
	push 0
    call [ExitProcess]

include 'training.inc'