# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_list_push_front.s                               :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pcuadrad <pcuadrad@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/19 18:21:04 by pcuadrad          #+#    #+#              #
#    Updated: 2020/01/19 18:48:52 by pcuadrad         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

						section .text
						global  _ft_list_push_front
						extern	_malloc
_ft_list_push_front:
						push	rdi
						push	rsi
						mov		rdi, 16
						mov		rax, 0
						call	_malloc
						pop		rsi
						pop		rdi
						cmp		rax, 0
						je		fail
						mov		[rax], rsi
						mov		rcx, [rdi]
						mov		[rax + 8], rcx
						mov		[rdi], rax
fail:
						ret
