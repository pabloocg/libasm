# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcmp.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pcuadrad <pcuadrad@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/18 17:52:29 by pcuadrad          #+#    #+#              #
#    Updated: 2020/01/19 17:00:02 by pcuadrad         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

            section .text
            global  _ft_strcmp
_ft_strcmp:
			mov     rcx, 0
			cmp     rdi, 0
			je      eval
			cmp     rsi, 0
			je      eval
loop1:
			cmp     BYTE [rdi + rcx], 0
			je      eval
			cmp     BYTE [rsi + rcx], 0
			je      eval
			mov     r9b, BYTE [rdi + rcx]
			cmp     BYTE [rsi + rcx], r9b
			jne     eval
			inc     rcx
			jmp     loop1
eval:
			mov     r9b, BYTE [rdi + rcx]
			sub     r9b, BYTE [rsi + rcx]
			cmp     r9b, 0
			je      equal
			jl      less
			jg      greater
greater:
			mov     rax, 1
			ret
less:
			mov     rax, -1
			ret
equal:
			mov     rax, 0
			ret
