# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcmp.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pcuadrad <pcuadrad@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/18 17:52:29 by pcuadrad          #+#    #+#              #
#    Updated: 2020/01/18 19:46:40 by pcuadrad         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

            section .text
            global  _ft_strcmp
_ft_strcmp:
            mov     rcx, 0
            jmp     check
compare:
            
            mov     dl, BYTE [rdi + rcx]
            cmp     BYTE [rsi + rcx], dl
            jne     eval
            jmp      increment
increment:
            inc     rcx
check:
            cmp     BYTE [rdi + rcx], 0
            je      eval
            cmp     BYTE [rsi + rcx], 0
            je      eval
            jmp     compare
eval:
            mov     dl, BYTE [rdi + rcx]
            sub     dl, BYTE [rsi + rcx]
            cmp     dl, 0
            jz      equal
            jl      less
greater:
            mov     rax, 1
            ret
less:
            mov     rax, -1
            ret
equal:
            mov     rax, 0
            ret

                