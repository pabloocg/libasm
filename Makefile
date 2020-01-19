# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pcuadrad <pcuadrad@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/18 16:41:49 by pcuadrad          #+#    #+#              #
#    Updated: 2020/01/19 18:59:12 by pcuadrad         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS = ft_strlen.s ft_write.s ft_strcmp.s ft_strcpy.s ft_read.s ft_strdup.s

SRCS_BONUS = ft_list_size.s ft_list_push_front.s ft_list_sort.s

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
			./a.out
testbonus:
			gcc -Wall -Werror -Wextra -L. -lasm test_bonus.c
			./a.out

all:		$(NAME)

re:			fclean all

clean:
			${RM} ${OBJS} ${OBJS_BONUS}
fclean:
			${RM} ${NAME}