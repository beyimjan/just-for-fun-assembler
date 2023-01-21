; Copyright (C) 2022, 2023 Tamerlan Bimzhanov

%include "kernel.asm"

global transfer

bufsize	equ 1024

section .text

transfer:	; dd destination fd, source fd
		push ebp
		mov ebp, esp
		sub esp, bufsize
		push ebx

		mov ebx, ebp
		sub ebx, bufsize

.again:		kernel sys_read, [ebp+12], ebx, bufsize
		cmp eax, 0
		jle .quit
		kernel sys_write, [ebp+8], ebx, eax
		jmp short .again

.quit:		pop ebx
		mov esp, ebp
		pop ebp
		ret
