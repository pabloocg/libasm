/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test_main.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: pcuadrad <pcuadrad@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/01/18 16:42:06 by pcuadrad          #+#    #+#             */
/*   Updated: 2020/01/18 20:18:42 by pcuadrad         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>

size_t	ft_strlen(const char *s);
ssize_t	ft_write(int fildes, const void *buf, size_t nbyte);
int		ft_strcmp(const char *s1, const char *s2);
ssize_t	ft_read(int fildes, void *buf, size_t nbyte);
char	*ft_strcpy(char *dst, const char *src);

char	*ft_strdup(const char *s1);

int		main()
{
	printf("\033[1;31mTesting FUNCTION STRLEN\n\033[0m");
	printf("\033[1;32mResult of ft_strlen: %zu\n\033[0m", ft_strlen("Hello testing ft_strlen"));
	printf("\033[1;31mResult of strlen: %zu\n\033[0m", strlen("Hello testing ft_strlen"));
	printf("\033[1;32mResult of ft_strlen: %zu\n\033[0m", ft_strlen(""));
	printf("\033[1;31mResult of strlen: %zu\n\033[0m", strlen(""));
	printf("\033[1;32mResult of ft_strlen: %zu\n\033[0m", ft_strlen("masdjoaisjdnas asoa\nasodidao"));
	printf("\033[1;31mResult of strlen: %zu\n\033[0m", strlen("masdjoaisjdnas asoa\nasodidao"));
	printf("\033[1;32mResult of ft_strlen: %zu\n\033[0m", ft_strlen("0123456789"));
	printf("\033[1;31mResult of strlen: %zu\n\033[0m", strlen("0123456789"));
	printf("\033[1;32mResult of ft_strlen: %zu\n\033[0m", ft_strlen("a b c d e f g h i j k l"));
	printf("\033[1;31mResult of strlen: %zu\n\033[0m", strlen("a b c d e f g h i j k l"));

	printf("\n\033[1;31mTesting FUNCTION WRITE\n\033[0m");
	printf("\033[1;32mResult of ft_write: %zd\n\033[0m", ft_write(1, "Probando write\n", 15));
	printf("\033[1;31mResult of write: %zd\n\033[0m", write(1, "Probando write\n", 15));
	printf("\033[1;32mResult of ft_write: %zd\n\033[0m", ft_write(1, "Poruasdmnassadsdoainsd asodaosi ansdoaind \n", 43));
	printf("\033[1;31mResult of write: %zd\n\033[0m", write(1, "Poruasdmnassadsdoainsd asodaosi ansdoaind \n", 43));
	printf("\033[1;32mResult of ft_write: %zd\n\033[0m", ft_write(1, "\n", 1));
	printf("\033[1;31mResult of write: %zd\n\033[0m", write(1, "\n", 1));

	printf("\n\033[1;31mTesting FUNCTION STRCMP\n\033[0m");
	printf("\033[1;32mResult of ft_strcmp: %d\n\033[0m", ft_strcmp("hello", "jay"));
	printf("\033[1;31mResult of strcmp: %d\n\033[0m", strcmp("hello", "jay"));
	printf("\033[1;32mResult of ft_strcmp: %d\n\033[0m", ft_strcmp("ZUmito", "ZUmito"));
	printf("\033[1;31mResult of strcmp: %d\n\033[0m", strcmp("ZUmito", "ZUmito"));
	printf("\033[1;32mResult of ft_strcmp: %d\n\033[0m", ft_strcmp("Hell", "Hello"));
	printf("\033[1;31mResult of strcmp: %d\n\033[0m", strcmp("Hell", "Hello"));

	printf("\n\033[1;31mTesting FUNCTION STRCPY\n\033[0m");
	char *dest = "";
	const char *src = "Hola";
	dest = strcpy(dest, src);
	printf("%s\n", dest);

	return (0);
}