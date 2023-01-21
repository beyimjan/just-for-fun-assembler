; Copyright (C) 2022, 2023 Tamerlan Bimzhanov

%include "procedure.asm"
%include "kernel.asm"

extern strlen
extern strtoi

global _start

section .bss
pid	resd 1
signal	resd 1

section .text

usage_str	db `Usage: kill <pid> <signal>\n`
usage_strlen	equ $-usage_str

_start:
main:		mov ebp, esp

		cmp dword [esp], 3
		jne .error_usage

		pcall strlen, [ebp+8]
		test eax, eax
		jz .error_usage
		pcall strtoi, [ebp+8], eax
		cmp ecx, -1
		je .error_usage
		mov dword [pid], eax

		pcall strlen, [ebp+12]
		test eax, eax
		jz .error_usage
		pcall strtoi, [ebp+12], eax
		cmp ecx, -1
		je .error_usage
		mov dword [signal], eax

		kernel sys_kill, [pid], [signal]
		cmp eax, -1
		je .error_kill

		kernel sys_exit, 0

.error_kill:	kernel sys_exit, 1

.error_usage:	kernel sys_write, stderr, usage_str, usage_strlen
		kernel sys_exit, 1
