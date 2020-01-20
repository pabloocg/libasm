/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test_basic.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: pcuadrad <pcuadrad@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/01/18 16:42:06 by pcuadrad          #+#    #+#             */
/*   Updated: 2020/01/20 10:45:58 by pcuadrad         ###   ########.fr       */
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
	printf("\033[1;32m   (Hello testing ft_strlen)    Result of ft_strlen: %zu\n\033[0m", ft_strlen("Hello testing ft_strlen"));
	printf("\033[1;31m   (Hello testing ft_strlen)    Result of strlen: %zu\n\033[0m", strlen("Hello testing ft_strlen"));
	printf("\033[1;32m   ()    Result of ft_strlen: %zu\n\033[0m", ft_strlen(""));
	printf("\033[1;31m   ()    Result of strlen: %zu\n\033[0m", strlen(""));
	printf("\033[1;32m   (masdjoaisjdnas asoaasodidao)    Result of ft_strlen: %zu\n\033[0m", ft_strlen("masdjoaisjdnas asoa\nasodidao"));
	printf("\033[1;31m   (masdjoaisjdnas asoaasodidao)    Result of strlen: %zu\n\033[0m", strlen("masdjoaisjdnas asoa\nasodidao"));
	printf("\033[1;32m   (0123456789)    Result of ft_strlen: %zu\n\033[0m", ft_strlen("0123456789"));
	printf("\033[1;31m   (0123456789)    Result of strlen: %zu\n\033[0m", strlen("0123456789"));
	printf("\033[1;32m   (a b c d e f g h i j k l)    Result of ft_strlen: %zu\n\033[0m", ft_strlen("a b c d e f g h i j k l"));
	printf("\033[1;31m   (a b c d e f g h i j k l)    Result of strlen: %zu\n\033[0m", strlen("a b c d e f g h i j k l"));

	printf("\n\033[1;31mTesting FUNCTION WRITE\n\033[0m");
	printf("\033[1;32mResult of ft_write: %zd\n\033[0m", ft_write(1, "Probando write\n", 15));
	printf("\033[1;31mResult of write: %zd\n\033[0m", write(1, "Probando write\n", 15));
	printf("\033[1;32mResult of ft_write: %zd\n\033[0m", ft_write(1, "Poruasdmnassadsdoainsd asodaosi ansdoaind \n", 43));
	printf("\033[1;31mResult of write: %zd\n\033[0m", write(1, "Poruasdmnassadsdoainsd asodaosi ansdoaind \n", 43));
	printf("\033[1;32mResult of ft_write: %zd\n\033[0m", ft_write(1, "\n", 1));
	printf("\033[1;31mResult of write: %zd\n\033[0m", write(1, "\n", 1));

	printf("\n\033[1;31mTesting FUNCTION STRCMP\n\033[0m");
	printf("\033[1;32m  (hello, jay)    Result of ft_strcmp: %d\n\033[0m", ft_strcmp("hello", "jay"));
	printf("\033[1;31m  (hello, jay)    Result of strcmp: %d\n\033[0m", strcmp("hello", "jay"));
	printf("\033[1;32m  (ZUmito, ZUmito)    Result of ft_strcmp: %d\n\033[0m", ft_strcmp("ZUmito", "ZUmito"));
	printf("\033[1;31m  (ZUmito, ZUmito)    Result of strcmp: %d\n\033[0m", strcmp("ZUmito", "ZUmito"));
	printf("\033[1;32m  (Hell, Hello)    Result of ft_strcmp: %d\n\033[0m", ft_strcmp("Hell", "Hello"));
	printf("\033[1;31m  (Hell, Hello)    Result of strcmp: %d\n\033[0m", strcmp("Hell", "Hello"));
	printf("\033[1;32m  (Hello, Hell)    Result of ft_strcmp: %d\n\033[0m", ft_strcmp("Hello", "Hell"));
	printf("\033[1;31m  (Hello, Hell)    Result of strcmp: %d\n\033[0m", strcmp("Hello", "Hell"));

	printf("\n\033[1;31mTesting FUNCTION STRCPY\n\033[0m");
	char dest[100];
	printf("\033[1;31msrc: Hola\033[0m -- \033[1;32mdst: %s\n\033[0m", ft_strcpy(dest, "Hola"));
	printf("\033[1;31msrc: Estamos probando que copie ft_strcpy\033[0m -- \033[1;32mdst: %s\n\033[0m", ft_strcpy(dest, "Estamos probando que copie ft_strcpy"));
	printf("\033[1;31msrc: 123456789\033[0m -- \033[1;32mdst: %s\n", ft_strcpy(dest, "123456789"));
	printf("\033[1;32mWorks with NULL src %s\n\033[0m", ft_strcpy(dest, NULL));
	printf("\033[1;31msrc: ta luego\033[0m -- \033[1;32mdst: %s\n\033[0m", ft_strcpy(dest, "ta luego"));

	printf("\n\033[1;31mTesting FUNCTION READ\n");
	char	buffer[100];
	int		fd_read;
	printf("Write something:\n\033[0m");
	fd_read = ft_read(1, buffer, 40);
	printf("\033[1;32mSTDIN: %s\033[0m", buffer);

	printf("\n\033[1;31mTesting FUNCTION STRDUP\n\033[0m");
	char *dest2;
	dest2 = ft_strdup("Buenas");
	printf("\033[1;32mValue of dest2: %s\n\033[0m", dest2);
	free(dest2);
	dest2 = ft_strdup("Vemos que se libera la memoria");
	printf("\033[1;32mValue of dest2: %s\n\033[0m", dest2);
	free(dest2);
	dest2 = ft_strdup("Copiando frases largas para que veamos que reserva toda la memoria que necesitemos sin problema");
	printf("\033[1;32mValue of dest2: %s\n\033[0m", dest2);
	free(dest2);
	dest2 = ft_strdup(NULL);
	printf("\033[1;32m(NULL value) Value of dest2: %s\n\033[0ma", dest2);
	free(dest2);
	return (0);
}
