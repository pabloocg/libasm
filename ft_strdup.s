# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strdup.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pcuadrad <pcuadrad@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/19 16:46:02 by pcuadrad          #+#    #+#              #
#    Updated: 2020/01/19 18:02:04 by pcuadrad         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

			section .text
			global	_ft_strdup
			extern	_malloc
_ft_strdup:
			mov		rcx, 0
			cmp		rdi, 0
			je		fail
_ft_strlen:
			cmp		byte [rdi + rcx], 0
			je		_ft_malloc
			inc		rcx
			jmp		_ft_strlen
_ft_malloc:
			inc		rcx
			push	rdi
			mov		rdi, rcx
			call	_malloc
			pop		rdi
			cmp		rax, 0
			je		fail
_ft_strcpy:
			mov		rcx, 0
loop1:
			mov		dl, byte [rdi + rcx]
			mov		byte [rax + rcx], dl
			cmp		dl, 0
			je		done
			inc		rcx
			jmp		loop1
done:
			ret
fail:
			mov		rax, 0
			ret
