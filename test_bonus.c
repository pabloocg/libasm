/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test_bonus.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: pcuadrad <pcuadrad@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/01/19 17:49:44 by pcuadrad          #+#    #+#             */
/*   Updated: 2020/01/19 18:59:01 by pcuadrad         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>

typedef struct	s_list
{
    void			*data;
    struct s_list	*next;
}				t_list;

int				ft_list_size(t_list *begin_list);
void			ft_list_push_front(t_list **begin_list, void *data);

void			ft_list_sort(t_list **begin_list, int (*cmp)());
void			ft_list_remove_if(t_list **begin_list, void *data_ref,
				int (*cmp)(), void (*free_fct)(void *));
int				ft_atoi_base(char *str, char *base);

int			main()
{
	printf("\033[1;31mTesting FUNCTION LIST_SIZE\n\033[0m");
	t_list	*tmp;
	t_list	*tmp2;
	t_list	*tmp3;
	tmp = malloc(sizeof(t_list));
	tmp2 = malloc(sizeof(t_list));
	tmp3 = malloc(sizeof(t_list));
	printf("Size: %d\n", ft_list_size(tmp));
	tmp->next = tmp2;
	printf("Size: %d\n", ft_list_size(tmp));
	tmp->next->next = tmp3;
	printf("Size: %d\n", ft_list_size(tmp));
	free(tmp);
	free(tmp2);
	free(tmp3);
	tmp = malloc(sizeof(t_list));
	tmp->data = "Hellos";
	ft_list_push_front(&tmp, "New Element 1");
	printf("%s\n", tmp->data);
	tmp->data = "Hellos";
	ft_list_push_front(&tmp, "New Element 2");
	printf("%s\n", tmp->data);
	tmp->data = "Hellos";
	ft_list_push_front(&tmp, "New Element 3");
	printf("%s\n", tmp->data);
	printf("Size of the list: %d\n", ft_list_size(tmp));
	while (tmp)
	{
		free(tmp);
		tmp = tmp->next;
	}	
	return (0);
}