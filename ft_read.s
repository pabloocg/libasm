# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_read.s                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pcuadrad <pcuadrad@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/18 20:04:24 by pcuadrad          #+#    #+#              #
#    Updated: 2020/01/18 20:05:47 by pcuadrad         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

			section	.text
			global	_ft_read
_ft_read:
			mov		r8, rsi
			mov		r9, rdx
			mov		rax, 0x20000BD
			mov		rsi, 0
			syscall
			mov		rsi, r8
			mov		rdx, r9
			cmp		rax, 9
			je		error
			mov		rax, 0x2000003
			syscall
			ret
error:
			mov		rax, -1
			ret
