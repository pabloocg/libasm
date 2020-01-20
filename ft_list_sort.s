# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_list_sort.s                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pcuadrad <pcuadrad@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/19 18:59:20 by pcuadrad          #+#    #+#              #
#    Updated: 2020/01/19 19:36:20 by pcuadrad         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

				section .text
				global	_ft_list_sort			; rdi = **begin  rsi = cmp(data1, data2)
_ft_list_sort:
				push	r12
				push	r8
				mov		rcx, [rdi]			;	rcx = *begin
				cmp		QWORD [rdi], 0
				je		return
				cmp		rsi, 0
				je		return
				jmp		loop1
increment_loop:
				mov		rcx, [rcx + 8]
				cmp		rcx, 0
				je		return
				jmp		loop1
loop1:
				mov		r12, [rdi]		;	r12 = *begin
				jmp		loop2
loop2:
				cmp		r12, 0				;	!*current
				mov		r8, [r12 + 8]		;	next = current->next
				cmp		r8, 0				;	!*next
				je		increment_loop
				mov		rax, rsi
				push	rdi
				push	rsi
				mov		rdi, [r12]			;	rdi = current->data
				mov		rsi, [r8]			;	rsi = next->data
				call	rax
				pop		rsi
				pop		rdi
				cmp		rax, 0
				jg		swapvalues
				mov		r12, r8		;	current = current->next
				jmp		loop2
swapvalues:
				mov		rax, [r8]		;	tmp = next->data
				mov		r8, [r12]		;	next->data = current->data
				mov		[r12], rax		;	current->data = tmp
				jmp		loop2
return:
				mov		[rdi], rcx
				pop		r12
				pop		r8
				ret
