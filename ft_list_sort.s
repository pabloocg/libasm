# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_list_sort.s                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pcuadrad <pcuadrad@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/19 18:59:20 by pcuadrad          #+#    #+#              #
#    Updated: 2020/01/20 16:58:20 by pcuadrad         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

				section	.text
				global	_ft_list_sort
_ft_list_sort:
				push	rdx
				push	r12
				cmp		rdi, 0
				je		return
				mov		r12, [rdi]
				cmp		rsi, 0
				je		back
				jmp		loop1
reset:
				mov		rcx, [rdi]
				mov		rdx, [rcx + 8]
				mov		[rdi], rdx
loop1:
				cmp		QWORD [rdi], 0
				je		back
				mov		rcx, [rdi]
				mov		rdx, [rcx + 8]
				jmp		check_null
loop2:
				mov		rax, rsi
				mov		rcx, [rdi]
				push	rdi
				push	rsi
				mov		rdi, [rcx]
				mov		rsi, [rdx]
				call	rax
				pop		rsi
				pop		rdi
				cmp		rax, 0
				jg		swap
inc_loop2:
				mov		rdx, [rdx + 8]
				jmp		check_null
swap:
				mov		rcx, [rdi]
				mov		r8, [rcx]
				mov		r9, [rdx]
				mov		[rcx], r9
				mov		[rdx], r8
				jmp		inc_loop2
check_null:
				cmp		rdx, 0
				je		reset
				jmp		loop2
back:
				mov		[rdi], r12
return:
				pop		r12
				pop		rdx
				ret