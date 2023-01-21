; Copyright (C) 2022, 2023 Tamerlan Bimzhanov

%include "procedure.asm"

global strtoi

section .text

; ECX = 0 -- success
;   EAX -- length
; ECX = -1 -- error
;   EAX -- error index
strtoi:		; dd *str, length
		push ebp
		mov ebp, esp
		sub esp, 4			; local(1) = 1 -- negative
		push ebx			;   local(1) = 0 -- positive
		push esi

		xor ecx, ecx			; ECX = 0 -- index

		cmp dword [ebp+12], 0		; length = 0?
		jne .nzl			;   NO!
		jmp short .err			;     YES

.nzl:		xor eax, eax			; EAX = 0 -- result

		mov esi, [ebp+8]		; ESI = string
		xor ebx, ebx			; EBX = 0

		mov dword [local(1)], 0

		cmp byte [esi], '+'
		je .skip_sign

.negative:	cmp byte [esi], '-'
		jne .again
		mov dword [local(1)], 1

.skip_sign:	inc ecx
		cmp ecx, [ebp+12]
		jae .err

.again:		mov bl, [esi+ecx]		; BL = current character

		cmp bl, '0'
		jnae .err
		cmp bl, '9'
		jnbe .err

		sub bl, '0'

		mov edx, 10			; EAX =
		mul edx				;   EAX * 10
		add eax, ebx			;   + EBX

		inc ecx				; ECX++
		cmp ecx, [ebp+12]
		jb .again

		xor ecx, ecx

		cmp dword [local(1)], 0
		je .quit

		neg eax

		jmp short .quit

.err:		mov eax, ecx
		mov ecx, -1

.quit:		pop esi
		pop ebx
		mov esp, ebp
		pop ebp
		ret
