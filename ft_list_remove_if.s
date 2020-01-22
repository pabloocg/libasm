;void			ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));
					section	.text
					global	_ft_list_remove_if
					extern	_free
_ft_list_remove_if:	
					push	rdi				;	save **begin
					push	rbx
					cmp		rdi, 0			;	rdi = **begin_list
					je		return			;	rsi = *data_ref
					cmp		rsi, 0			;	rdx = (*cmp)
					je		return			;	rcx = (*free_fct)
					cmp		rdx, 0
					je		return
					cmp		rcx, 0
					je		return
					mov		rbx, [rdi]		;	rbx = *before
					mov		rdi, [rdi + 8]	;	rdi = *current
					jmp		loop_before
prepare_loop:
					pop		rbx
					pop		rdi
					push	rdi
					push	rbx
					mov		rbx, [rdi]
					mov		rdi, [rdi + 8]
					jmp		loop1
free:
					push	rdi
					push	rsi
					push	rdx
					push	rcx
					push	rbx
					mov		rdi, [rdi]
					call	rcx
					pop		rbx
					pop		rcx
					pop		rdx
					pop		rsi
					pop		rdi
					push	rdi
					push	rsi
					push	rdx
					push	rcx
					push	rbx
					mov		rdi, rdi
					call	_free
					pop		rbx
					pop		rcx
					pop		rdx
					pop		rsi
					pop		rdi
					jmp		move_next
loop1:
					push	rdi
					push	rsi
					push	rdx
					push	rcx
					push	rbx
					mov		rdi, [rdi]		;	rdi = *current->data
					call	rdx				;	cmp(rdi, rsi)
					pop		rbx
					pop		rcx
					pop		rdx
					pop		rsi
					pop		rdi
					cmp		rax, 0
					je		free
					jmp		move_next
next_before:
					cmp		qword [rdi + 8], 0
					jmp		return
					mov		rbx, rdi		;	*before = *current
					pop		rdi
					mov		rdi, rbx
					push	rdi
					mov		rdi, [rbx + 8]	;	*current = *next
loop_before:
					push	rdi
					push	rsi
					push	rdx
					push	rcx
					push	rbx
					mov		rdi, [rbx]		;	rdi = *before->data
					call	rdx				;	cmp(rdi, rsi)
					pop		rbx
					pop		rcx
					pop		rdx
					pop		rsi
					pop		rdi
					cmp		rax, 0
					je		free_before
					jmp		next_before
free_before:
					push	rdi
					push	rsi
					push	rdx
					push	rcx
					push	rbx
					mov		rdi, [rbx]
					call	rcx
					pop		rbx
					pop		rcx
					pop		rdx
					pop		rsi
					pop		rdi
					push	rdi
					push	rsi
					push	rdx
					push	rcx
					push	rbx
					mov		rdi, rbx
					call	_free
					pop		rbx
					pop		rcx
					pop		rdx
					pop		rsi
					pop		rdi
					jmp		next_before
move_next:
					mov		rbx, rdi		;	*before = *current
					cmp		qword [rdi + 8], 0
					je		return
					mov		rdi, [rdi + 8]	;	*current = *next
					jmp		loop1
check_null:
					cmp		qword [rdi + 8], 0
					je		return
					jmp		move_next
return:
					pop		rbx
					pop		rdi
					mov		rdi, rdi
					ret
