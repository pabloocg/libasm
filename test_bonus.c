/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test_bonus.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: pcuadrad <pcuadrad@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/01/19 17:49:44 by pcuadrad          #+#    #+#             */
/*   Updated: 2020/01/20 12:34:40 by pcuadrad         ###   ########.fr       */
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
	t_list	tmp;
	t_list	tmp2;
	t_list	tmp3;
	tmp.next = NULL;
	printf("\033[1;32mSize: %d\033[0m -- \033[1;31m%d\n\033[0m", ft_list_size(&tmp), 1);
	tmp.next = &tmp2;
	tmp2.next = NULL;
	printf("\033[1;32mSize: %d\033[0m -- \033[1;31m%d\n\033[0m", ft_list_size(&tmp), 2);
	tmp.next->next = &tmp3;
	tmp3.next = NULL;
	printf("\033[1;32mSize: %d\033[0m -- \033[1;31m%d\n\033[0m", ft_list_size(&tmp), 3);

	printf("\033[1;31mTesting FUNCTION LIST_PUSH_FRONT\n\033[0m");
	t_list	*temp;
	temp = malloc(sizeof(t_list));
	temp->data = "Hellos";
	temp->next = NULL;
	ft_list_push_front(&temp, "New Element 1");
	printf("%s\n", temp->data);
	temp->data = "Hellos";
	ft_list_push_front(&temp, "New Element 2");
	printf("%s\n", temp->data);
	temp->data = "Hellos";
	ft_list_push_front(&temp, "New Element 3");
	printf("%s\n", temp->data);
	printf("Size of the list: %d\n", ft_list_size(temp));

	printf("\033[1;31mTesting FUNCTION LIST_SORT\n\033[0m");
	ft_list_sort(&temp, &strcmp);
	printf("List order: \n");
	while (temp)
	{
		printf("%s\n", temp->data);
		temp = temp->next;
	}
	return (0);
}
