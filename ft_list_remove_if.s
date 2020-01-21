					section	.text
					global	_ft_list_remove_if
					extern	_free
_ft_list_remove_if:	
					push	rbx
					push	r12	
					mov		r8, 0
					mov		r9, 0
					cmp		rdi, 0
					je		return
					mov		r12, [rdi]
					cmp		rcx, 0
					je		return
					cmp		rdx, 0
					je		return
					jmp		compare
inc_loop1:
					mov		r8, [rdi]
					mov		r9, [r8 + 8]
					mov		[rdi], r9
compare:
					cmp		QWORD [rdi], 0
					je		return
					push	rdi
					push	rsi
					push	rdx
					push	rcx
					mov		r8, [rdi]
					mov		rdi, [r8]
					call	rdx
					pop		rcx
					pop		rdx
					pop		rsi
					pop		rdi
					cmp		rax, 0
					je		free_fct
					jmp		inc_loop1
free_fct:
					mov		r8, [rdi]
					mov		r9, [r8 + 8]
					push	rsi
					push	rdx
					push	rcx
					push	rdi
					mov		rbx, [rdi]
					mov		rdi, [rbx]
					call	rcx
					pop		rdi
					push	rdi
					mov		rbx, [rdi]
					mov		rdi, rbx
					call	_free
					pop		rdi
					pop		rcx
					pop		rdx
					pop		rsi
					mov		[rdi], r9
					jmp		compare
return:
					mov		[rdi], r12
					pop		r12
					pop		rbx
					ret
