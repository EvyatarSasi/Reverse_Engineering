;תרגיל 1
include 'win32a.inc'

format PE console
entry start

section '.data' data readable writeable
		x 	db	0x4
	
section '.text' code readable executable
	start:
	call read_hex ; n = eax
	xor ecx, ecx   ; i = ecx
	
whle: 		; n != 1
	cmp eax, 1   
	je print
	mov edx, eax	
	shl edx, 31		
	cmp edx, 0		
	jne other
	shr eax, 1
	jmp plus

other: 
	mov ebx, 3
	mul ebx			
	add eax, 1		
	
plus:
	inc ecx			
	jmp whle			

print:
	mov eax, ecx
	call print_eax
	
	
	
	
	push 0
    call [ExitProcess]

include 'training.inc'