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
				global	_ft_atoi_base
_ft_atoi_base:
				push	r12
				mov		rax, 0
				cmp		rdi, 0		;	rdi = char *str, rsi = char *base
				je		fail
				cmp		rsi, 0		;	check if str or base are null
				je		fail
				mov		rcx, 0
				jmp		len_base
len_base:
				cmp		byte [rsi + rcx], 0
				je		check_len
				inc		rcx
				jmp		len_base
check_error_base:
				mov		rcx, 0
				jmp		check_sign
check_sign:
				cmp		byte [rsi + rcx], 0
				je		check_equal_values
				cmp		byte [rsi + rcx], 45		; '-'
				je		fail
				cmp		byte [rsi + rcx], 43		; '+'
				je		fail
				inc		rcx
				jmp		check_sign
check_equal_values:
				mov		rcx, 0
				mov		r12, 1
				jmp		loop_equal_values
inc_loop:
				inc		rcx
				mov		r12, rcx
loop_equal_values:
				cmp		byte [rsi + rcx], 0
				je		skip_values
				jmp		compare
compare:
				inc		r12
				cmp		byte [rsi + r12], 0
				je		inc_loop
				mov		r9b, [rsi + rcx]
				cmp		r9b, byte [rsi + r12]
				je		fail
				jmp		compare
check_len:
				cmp		rcx, 1
				jle		fail
				jmp		check_error_base
skip_values:
				mov		rcx, 0
				jmp		loop_skip
inc_loop_skip:
				inc		rcx
loop_skip:
				cmp		byte [rdi + rcx], 32		; ' '
				je		inc_loop_skip
				cmp		byte [rdi + rcx], 9			; \t
				je		inc_loop_skip
				cmp		byte [rdi + rcx], 10		; \n
				je		inc_loop_skip
				cmp		byte [rdi + rcx], 11		; \r
				je		inc_loop_skip
				cmp		byte [rdi + rcx], 12		; \v
				je		inc_loop_skip
				cmp		byte [rdi + rcx], 13		; \f
				je		inc_loop_skip
				jmp		number_sign
set_negative:
				xor		bl, -1
set_positive:
				inc		rcx
number_sign:
				cmp		byte [rdi + rcx], 45		; '-'
				je		set_negative
				cmp		byte [rdi + rcx], 43		; '+'
				je		set_positive
				mov		r8, 0
				jmp		atoi
inc_atoi:
				inc		rcx
atoi:
				cmp		byte [rdi + rcx], 0
				je		result
				mov		r9b, byte [rdi + rcx]
				cmp		byte [rsi + r8], r9b
				je		operation
				cmp		byte [rsi + r8], 0
				je		result
				inc		r8
				jmp		atoi
operation:
				mul		r12							; rax *= r12(len base)
				add		rax, r8						; rax += r8 (pos base num)
				mov		r8, 0
				jmp		inc_atoi
result:
				pop		r12
				mov		rax, rax
				cmp		bl, -1
				je		result_neg
				mov		bl, 0
				ret
result_neg:
				mov		bl, 0
				neg		rax
				ret
fail:
				pop		r12
				mov		rax, 0
				ret
