# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcpy.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pcuadrad <pcuadrad@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/18 18:35:47 by pcuadrad          #+#    #+#              #
#    Updated: 2020/01/19 16:54:41 by pcuadrad         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

			section	.text
			global	_ft_strcpy
_ft_strcpy:
			mov		rcx, 0
			cmp		rsi, 0
			je		return
copy:
			mov		dl, BYTE [rsi + rcx]
			mov		BYTE [rdi + rcx], dl
			cmp		dl, 0
			je		return
			inc		rcx
			jmp		copy
return:
			mov		rax, rdi
			ret
