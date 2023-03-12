; Copyright (C) 2022, 2023 Tamerlan Bimzhanov

; The following table lists the system calls for the Linux 2.2 kernel
; https://montcs.bloomu.edu/Information/Linux/linux-system-calls.html

%define stdin	0
%define stdout	1
%define stderr	2

%ifdef OS_LINUX
  %define sys_exit			1
  %define sys_fork			2
  %define sys_read			3
  %define sys_write			4
  %define sys_open			5
  %define sys_close			6
  %define sys_waitpid			7
  %define sys_creat			8
  %define sys_link			9
  %define sys_unlink			10
  %define sys_execve			11
  %define sys_chdir			12
  %define sys_time			13
  %define sys_mknod			14
  %define sys_chmod			15
  %define sys_lchown			16
  %define sys_stat			18
  %define sys_lseek			19
  %define sys_getpid			20
  %define sys_mount			21
  %define sys_oldumount			22
  %define sys_setuid			23
  %define sys_getuid			24
  %define sys_stime			25
  %define sys_ptrace			26
  %define sys_alarm			27
  %define sys_fstat			28
  %define sys_pause			29
  %define sys_utime			30
  %define sys_access			33
  %define sys_nice			34
  %define sys_sync			36
  %define sys_kill			37
  %define sys_rename			38
  %define sys_mkdir			39
  %define sys_rmdir			40
  %define sys_dup			41
  %define sys_pipe			42
  %define sys_times			43
  %define sys_brk			45
  %define sys_setgid			46
  %define sys_getgid			47
  %define sys_signal			48
  %define sys_geteuid			49
  %define sys_getegid			50
  %define sys_acct			51
  %define sys_umount			52
  %define sys_ioctl			54
  %define sys_fcntl			55
  %define sys_setpgid			57
  %define sys_olduname			59
  %define sys_umask			60
  %define sys_chroot			61
  %define sys_ustat			62
  %define sys_dup2			63
  %define sys_getppid			64
  %define sys_getpgrp			65
  %define sys_setsid			66
  %define sys_sigaction			67
  %define sys_sgetmask			68
  %define sys_ssetmask			69
  %define sys_setreuid			70
  %define sys_setregid			71
  %define sys_sigsuspend		72
  %define sys_sigpending		73
  %define sys_sethostname		74
  %define sys_setrlimit			75
  %define sys_getrlimit			76
  %define sys_getrusage			77
  %define sys_gettimeofday		78
  %define sys_settimeofday		79
  %define sys_getgroups			80
  %define sys_setgroups			81
  %define old_select			82
  %define sys_symlink			83
  %define sys_lstat			84
  %define sys_readlink			85
  %define sys_uselib			86
  %define sys_swapon			87
  %define sys_reboot			88
  %define old_readdir			89
  %define old_mmap			90
  %define sys_munmap			91
  %define sys_truncate			92
  %define sys_ftruncate			93
  %define sys_fchmod			94
  %define sys_fchown			95
  %define sys_getpriority		96
  %define sys_setpriority		97
  %define sys_statfs			99
  %define sys_fstatfs			100
  %define sys_ioperm			101
  %define sys_socketcall		102
  %define sys_syslog			103
  %define sys_setitimer			104
  %define sys_getitimer			105
  %define sys_newstat			106
  %define sys_newlstat			107
  %define sys_newfstat			108
  %define sys_uname			109
  %define sys_iopl			110
  %define sys_vhangup			111
  %define sys_idle			112
  %define sys_vm86old			113
  %define sys_wait4			114
  %define sys_swapoff			115
  %define sys_sysinfo			116
  %define sys_ipc (*Note)		117
  %define sys_fsync			118
  %define sys_sigreturn			119
  %define sys_clone			120
  %define sys_setdomainname		121
  %define sys_newuname			122
  %define sys_modify_ldt		123
  %define sys_adjtimex			124
  %define sys_mprotect			125
  %define sys_sigprocmask		126
  %define sys_create_module		127
  %define sys_init_module		128
  %define sys_delete_module		129
  %define sys_get_kernel_syms		130
  %define sys_quotactl			131
  %define sys_getpgid			132
  %define sys_fchdir			133
  %define sys_bdflush			134
  %define sys_sysfs			135
  %define sys_personality		136
  %define sys_setfsuid			138
  %define sys_setfsgid			139
  %define sys_llseek			140
  %define sys_getdents			141
  %define sys_select			142
  %define sys_flock			143
  %define sys_msync			144
  %define sys_readv			145
  %define sys_writev			146
  %define sys_getsid			147
  %define sys_fdatasync			148
  %define sys_sysctl			149
  %define sys_mlock			150
  %define sys_munlock			151
  %define sys_mlockall			152
  %define sys_munlockall		153
  %define sys_sched_setparam		154
  %define sys_sched_getparam		155
  %define sys_sched_setscheduler	156
  %define sys_sched_getscheduler	157
  %define sys_sched_yield		158
  %define sys_sched_get_priority_max	159
  %define sys_sched_get_priority_min	160
  %define sys_sched_rr_get_interval	161
  %define sys_nanosleep			162
  %define sys_mremap			163
  %define sys_setresuid			164
  %define sys_getresuid			165
  %define sys_vm86			166
  %define sys_query_module		167
  %define sys_poll			168
  %define sys_nfsservctl		169
  %define sys_setresgid			170
  %define sys_getresgid			171
  %define sys_prctl			172
  %define sys_rt_sigreturn		173
  %define sys_rt_sigaction		174
  %define sys_rt_sigprocmask		175
  %define sys_rt_sigpending		176
  %define sys_rt_sigtimedwait		177
  %define sys_rt_sigqueueinfo		178
  %define sys_rt_sigsuspend		179
  %define sys_pread			180
  %define sys_pwrite			181
  %define sys_chown			182
  %define sys_getcwd			183
  %define sys_capget			184
  %define sys_capset			185
  %define sys_sigaltstack		186
  %define sys_sendfile			187
  %define sys_vfork			190
%elifdef OS_FREEBSD
  %define sys_exit			1
  %define sys_read			3
  %define sys_write			4
  %define sys_open			5
  %define sys_close			6
  %define sys_getpid			20
  %define sys_kill			37
  %define sys_getppid			39
%endif

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
  %%ok:	xor ecx, ecx
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
