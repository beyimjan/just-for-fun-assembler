; Copyright (C) 2022, 2023 Tamerlan Bimzhanov

%define stdin	0
%define stdout	1
%define stderr	2

%define sys_exit		1
%define sys_read		3
%define sys_write		4
%define sys_open		5
%define sys_close		6
%define sys_getpid		20
%define sys_kill		37

%ifdef OS_LINUX
  %define sys_getppid		64
%elifdef OS_FREEBSD
  %define sys_getppid		39
%endif

; sys_open
%define O_RDONLY		0h
%define O_WRONLY		1h
%define O_RDWR			2h
%ifdef OS_LINUX
  %define O_CREAT		40h
  %define O_EXCL		80h
  %define O_TRUNC		200h
  %define O_APPEND		400h
%elifdef OS_FREEBSD
  %define O_CREAT		200h
  %define O_EXCL		800h
  %define O_TRUNC		400h
  %define O_APPEND		8h
%endif

%macro	kernel 1-*

%ifdef OS_FREEBSD

  %rep %0
    %rotate -1
	  	push dword %1
  %endrep
		mov eax, [esp]
		int 80h
		jnc %%ok
		mov ecx, eax
		mov eax, -1
		jmp short %%q
  %%ok:
		xor ecx, ecx
  %%q:
		add esp, (%0-1)*4

%elifdef OS_LINUX

  %if %0 > 1
		push ebx
    %if %0 > 4
		push esi
		push edi
		push ebp
    %endif
  %endif

  %rep %0
    %rotate -1
  		push dword %1
  %endrep

		pop eax
  %if %0 > 1
		pop ebx
    %if %0 > 2
		pop ecx
      %if %0 > 3
		pop edx
        %if %0 > 4
		pop esi
          %if %0 > 5
		pop edi
            %if %0 > 6
		pop ebp
              %if %0 > 7
                %error "Can't handle Linux syscalls for more than 6 params"
              %endif
            %endif
          %endif
        %endif
      %endif
    %endif
  %endif
		int 80h
		mov ecx, eax
		and ecx, 0fffff000h
		cmp ecx, 0fffff000h
		jne %%ok
		mov ecx, eax
		neg ecx
		mov eax, -1
		jmp short %%q
  %%ok:		xor ecx, ecx
  %%q:

  %if %0 > 1
    %if %0 > 4
		pop ebp
		pop edi
		pop esi
    %endif
		pop ebx
  %endif

%else
  %error Please define either OS_LINUX or OS_FREEBSD
%endif

%endmacro
