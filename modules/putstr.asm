; Copyright (C) 2022, 2023 Tamerlan Bimzhanov

%include "procedure.asm"
%include "kernel.asm"

extern strlen

global putstr

section .text

putstr:	; dd fd, *str
		push ebp
		mov ebp, esp

		pcall strlen, dword [ebp+12]
		kernel sys_write, [ebp+8], [ebp+12], eax

		mov esp, ebp
		pop ebp
		ret
