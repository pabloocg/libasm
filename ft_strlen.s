# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strlen.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pcuadrad <pcuadrad@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/18 16:46:36 by pcuadrad          #+#    #+#              #
#    Updated: 2020/01/19 16:52:19 by pcuadrad         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

		section .text
        global	_ft_strlen
_ft_strlen:
        mov		rax, 0
		cmp		rdi, 0
		je		done
loop1:
		cmp		byte [rdi + rax], 0
		je		done
		inc		rax
		jmp		loop1
done:
		ret