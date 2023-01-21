; Copyright (C) 2022, 2023 Tamerlan Bimzhanov

%include "procedure.asm"
%include "kernel.asm"

extern transfer
extern putstr

global _start

section .text

error1		db `Couldn't open "`
error1_size	equ $-error1

error2		db `" for reading!\n`
error2_size	equ $-error2

_start:
main:		mov ebp, esp

		cmp dword [ebp], 1
		ja .loop_begin
		pcall transfer, stdout, stdin
		jmp .quit

.loop_begin:	mov ebx, 2

.loop:		kernel sys_open, [ebp+ebx*4], O_RDONLY
		cmp eax, -1
		je .open_fail
		push eax
		pcall transfer, stdout, eax
		pop eax
		kernel sys_close, eax
		jmp short .continue

.open_fail:	kernel sys_write, stderr, error1, error1_size
		pcall putstr, stderr, [ebp+ebx*4]
		kernel sys_write, stderr, error2, error2_size

.continue:	inc ebx
		cmp ebx, [ebp]
		jbe .loop

.quit:		kernel sys_exit, 0
