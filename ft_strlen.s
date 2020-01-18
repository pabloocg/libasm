# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strlen.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pcuadrad <pcuadrad@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/18 16:46:36 by pcuadrad          #+#    #+#              #
#    Updated: 2020/01/18 17:28:19 by pcuadrad         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

			section .text
        	global _ft_strlen
_ft_strlen:
            mov		rax, 0
			jmp		loop
increment:
			inc		rax
			jmp		loop
loop:
			cmp		BYTE [rdi + rax], 0
			jne		increment
			jmp		done
done:
			ret