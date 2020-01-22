# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pcuadrad <pcuadrad@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/18 16:41:49 by pcuadrad          #+#    #+#              #
#    Updated: 2020/01/22 10:18:14 by pcuadrad         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS = ft_strlen.s ft_write.s ft_strcmp.s ft_strcpy.s ft_read.s ft_strdup.s

SRCS_BONUS = ft_list_size.s ft_list_push_front.s ft_list_sort.s ft_atoi_base.s \
				ft_list_remove_if.s

NAME = libasm.a

COMMAND = ar rc ${NAME} ${OBJS}

COMMAND_BONUS = ar rc ${NAME} ${OBJS_BONUS}

GCC = gcc -Wall -Werror -Wextra

OBJS = ${SRCS:.s=.o}

OBJS_BONUS = ${SRCS_BONUS:.s=.o}

RM = rm -f

FLAGS = -g

.s.o:
			nasm -f macho64 $< -o ${<:.s=.o}

$(NAME):	${OBJS}
			${COMMAND}

bonus:		${OBJS_BONUS}
			${COMMAND_BONUS}

test:
			gcc -Wall -Werror -Wextra -L. -lasm test_basic.c
			clear && ./a.out
testbonus:
			gcc -Wall -Werror -Wextra -L. -lasm test_bonus.c
			clear && ./a.out

all:		$(NAME) bonus

re:			fclean all

clean:
			${RM} ${OBJS} ${OBJS_BONUS}
fclean:
			${RM} ${NAME}
