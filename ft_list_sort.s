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
				global	_ft_list_sort			; rdi = **begin_list  rsi = cmp(data1, data2)
_ft_list_sort:
				mov		rcx, [rdi]
				jmp		loop
loop:
				cmp		rcx, 0
				je		return
				mov		rbx, [rcx + 8]
				cmp		rbx, 0
				je		return
				push	rdi
				push	rsi
				mov		rax, rsi
				mov		rdi, [rcx]
				mov		rsi, [rbx]
				call	rax
				pop		rsi
				pop		rdi
				cmp		rax, 0
				jg		swap
				mov		rcx, [rcx + 8]
				jmp		loop
swap:
				mov		dl, [rcx]
				mov		rcx, [rbx]
				mov		rbx, dl
				jmp		loop
return:
				ret