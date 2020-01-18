# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pcuadrad <pcuadrad@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/18 16:41:49 by pcuadrad          #+#    #+#              #
#    Updated: 2020/01/18 20:04:52 by pcuadrad         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS = ft_strlen.s ft_write.s ft_strcmp.s ft_strcpy.s ft_read.s

NAME = libasm.a

COMMAND = ar rc ${NAME} ${OBJS}

GCC = gcc -Wall -Werror -Wextra

OBJS = ${SRCS:.s=.o}

RM = rm -f

FLAGS = -g

.s.o:
			nasm -f macho64 $< -o ${<:.s=.o}

$(NAME):	${OBJS}
			${COMMAND}

exec:
			gcc -Wall -Werror -Wextra -L. -lasm test.c
			./a.out

all:		$(NAME)

re:			fclean all

clean:
			${RM} ${OBJS}
fclean:
			${RM} ${NAME}