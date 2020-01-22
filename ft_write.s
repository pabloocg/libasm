# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_write.s                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pcuadrad <pcuadrad@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/18 17:32:49 by pcuadrad          #+#    #+#              #
#    Updated: 2020/01/18 17:41:41 by pcuadrad         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

            section .text
            global _ft_write
_ft_write:
            cmp     rsi, 0
            je      error
            mov     r8, rsi
            mov     r9, rdx
            mov     rax, 0x20000BD          ;   syscall fstat to check the fd
            mov     rsi, 0
            syscall
            mov     rsi, r8
            mov     rdx, r9
            cmp     rax, 9                  ;   return 9 is an error in file descriptor
            je      error
            mov     rax, 0x2000004          ;   syscall write
            syscall
            ret
error:
            mov     rax, -1
            ret