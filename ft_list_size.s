# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_list_size.s                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pcuadrad <pcuadrad@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/19 17:55:47 by pcuadrad          #+#    #+#              #
#    Updated: 2020/01/19 18:06:26 by pcuadrad         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

				section	.text
				global	_ft_list_size
_ft_list_size:
				mov		rax, 0
loop:
				cmp		rdi, 0
				je		done
				mov		rdi, [rdi + 8]
				inc		rax
				jmp		loop
done:
				ret