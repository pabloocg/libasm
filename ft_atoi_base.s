				section	.text
				global	_ft_atoi_base
_ft_atoi_base:
				push	r12
				cmp		rdi, 0		;	rdi = char *str, rsi = char *base
				je		fail
				cmp		rsi, 0		;	check if str or base are null
				je		fail
				mov		rcx, 0
				jmp		len_base
len_base:
				cmp		BYTE [rsi + rcx], 0
				je		check_len
				inc		rcx
				jmp		len_base
check_error_base:
				mov		rcx, 0
				jmp		check_sign
check_sign:
				cmp		BYTE [rsi + rcx], 0
				je		check_equal_values
				cmp		BYTE [rsi + rcx], 45		; '-'
				je		fail
				cmp		BYTE [rsi + rcx], 43		; '+'
				je		fail
				inc		rcx
				jmp		check_sign
check_equal_values:
				mov		rcx, 0
				mov		r12, 1
				jmp		loop_equal_values
inc_loop:
				inc		rcx
				mov		r12, rcx
loop_equal_values:
				cmp		BYTE [rsi + rcx], 0
				je		skip_values		;	Falta quitar espacios en blanco y demas de str, ver si tiene signo y convertirlo a la base
				jmp		compare
compare:
				inc		r12
				cmp		BYTE [rsi + r12], 0
				je		inc_loop
				mov		r9b, [rsi + rcx]
				cmp		r9b, BYTE [rsi + r12]
				je		fail
				jmp		compare
check_len:
				cmp		rcx, 1
				jle		fail
				jmp		check_error_base
skip_values:
				pop		r12
				mov		rax, 1
				ret
fail:
				pop		r12
				mov		rax, 0
				ret
