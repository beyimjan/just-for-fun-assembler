; Copyright (C) 2022, 2023 Tamerlan Bimzhanov

global strlen

section .text

strlen:	; dd *str
	xor eax, eax			; EAX = 0
	mov ecx, [esp+4]

.again:	cmp byte [ecx+eax], 0
	je .quit
	inc eax
	jmp short .again

.quit:	ret
