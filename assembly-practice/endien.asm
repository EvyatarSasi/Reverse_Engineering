; Barak Gonen
; Convert little endien to big endien and vice versa
; Example: 0x1234ABCD -> 0xCDAB3412
; Make it work properly

include 'win32a.inc'

format PE console
entry start

section '.data' data readable writeable
    msg    db 'Enter a hex number', 13, 10, 0
	
section '.text' code readable executable
; ======================================

start:
	mov		esi, msg
	call	print_str
	call	read_hex
	mov bl, ah
	mov bh, al
	shl ebx, 16
	shr eax, 16
	mov bh, al
	mov bl, ah
	mov eax, ebx
	call	print_eax
	
; ====================================

	push	0
	call	[ExitProcess]

include 'training.inc'

