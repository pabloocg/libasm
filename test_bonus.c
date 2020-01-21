/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   test_bonus.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: pcuadrad <pcuadrad@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/01/19 17:49:44 by pcuadrad          #+#    #+#             */
/*   Updated: 2020/01/21 18:11:46 by pcuadrad         ###   ########.fr       */
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
int				ft_atoi_base(char *str, char *base);

void			ft_list_remove_if(t_list **begin_list, void *data_ref,
				int (*cmp)(), void (*free_fct)(void *));

int			main()
{
	printf("\033[1;31mTesting FUNCTION LIST_SIZE\n\n\033[0m");
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

	printf("\033[1;31mTesting FUNCTION LIST_PUSH_FRONT\n\n\033[0m");
	t_list	*temp;
	temp = malloc(sizeof(t_list));
	temp->data = "Hellos";
	temp->next = NULL;
	printf("\033[1;31mFirst element\033[0m --> \033[1;32m%s\n\033[0m", temp->data);
	ft_list_push_front(&temp, "New Element 1");
	printf("\033[1;31mFirst element\033[0m --> \033[1;32m%s\n\033[0m", temp->data);
	ft_list_push_front(&temp, "New Element 2");
	printf("\033[1;31mFirst element\033[0m --> \033[1;32m%s\n\033[0m", temp->data);
	ft_list_push_front(&temp, "New Element 3");
	printf("\033[1;31mFirst element\033[0m --> \033[1;32m%s\n\033[0m", temp->data);
	printf("\033[1;32mSize of the list: %d\n\033[0m", ft_list_size(temp));

	printf("\033[1;31mTesting FUNCTION LIST_SORT\n\n\033[0m");
	printf("\033[1;31mAfter:\n\033[0m");
	t_list	*temp2;
	temp2 = temp;
	while (temp2)
	{
		printf("\033[1;31m%s\n\033[0m", temp2->data);
		temp2 = temp2->next;
	}
	ft_list_sort(&temp, &strcmp);
	printf("\033[1;32mOrder List: \n\033[0m");
	while (temp)
	{
		printf("\033[1;32m%s\n\033[0m", temp->data);
		temp = temp->next;
	}
/*
	printf("\033[1;31mTesting FUNCTION LIST_REMOVE_IF\n\n\033[0m");
	t_list	*list1;
	t_list	*list2;
	t_list	*list3;
	list1 = malloc(sizeof(t_list));
	list1->data = strdup("Elemento1");
	list2 = malloc(sizeof(t_list));
	list2->data = strdup("Elemento2");
	list3 = malloc(sizeof(t_list));
	list3->data = strdup("Elemento3");
	list2->next = list3;
	list1->next = list2;
	t_list	*listtmp = list1;
	while (list1)
	{
		printf("\033[1;31m%s\n\033[0m", list1->data);
		list1 = list1->next;
	}
	ft_list_remove_if(&listtmp, "Elemento2", &strcmp, &free);
	while (listtmp)
	{
		printf("\033[1;32m%s\n\033[0m", listtmp->data);
		listtmp = listtmp->next;
	}
*/
	printf("\033[1;31mTesting FUNCTION ATOI_BASE\n\n\033[0m");
	printf("Number: %s -- Base: %s\n\033[1;31mExpected: %d\033[0m -- \033[1;32mResult: %d\n\033[0m", "-1234", "0123456789", -1234, ft_atoi_base("-1234", "0123456789"));
	printf("Number: %s -- Base: %s\n\033[1;31mExpected: %d\033[0m -- \033[1;32mResult: %d\n\033[0m", "11101", "01", 29, ft_atoi_base("11101", "01"));
	printf("Number: %s -- Base: %s\n\033[1;31mExpected: %d\033[0m -- \033[1;32mResult: %d\n\033[0m", "8373afe", "0123456789abcdef", 137837310, ft_atoi_base("8373afe", "0123456789abcdef"));
	printf("Number: %s -- Base: %s\n\033[1;31mExpected: %d\033[0m -- \033[1;32mResult: %d\n\033[0m", "    \t --+-8373afe", "0123456789abcdef", -137837310, ft_atoi_base("    \t --+-8373afe", "0123456789abcdef"));
	printf("Number: %s -- Base: %s\n\033[1;31mExpected: %d\033[0m -- \033[1;32mResult: %d\n\033[0m", "373", "01234567", 251, ft_atoi_base("373", "01234567"));
	printf("Number: %s -- Base: %s\n\033[1;31mExpected: %d\033[0m -- \033[1;32mResult: %d\n\033[0m", "0000010", "0123456789", 10, ft_atoi_base("0000010", "0123456789"));
	printf("Number: %s -- Base: %s\n\033[1;31mExpected: %d\033[0m -- \033[1;32mResult: %d\n\033[0m", "0", "0123456789", 0, ft_atoi_base("0", "0123456789"));
	printf("Number: %s -- Base: %s\n\033[1;31m(Check error length base > 2)Expected: %d\033[0m -- \033[1;32mResult: %d\n\033[0m", "1234", "1", 0, ft_atoi_base("1234", "1"));
	printf("Number: %s -- Base: %s\n\033[1;31m(Check error repeat data in base)Expected: %d\033[0m -- \033[1;32mResult: %d\n\033[0m", "1234", "123123", 0, ft_atoi_base("1234", "123123"));
	printf("Number: %s -- Base: %s\n\033[1;31m(Check error '-' or '+' in base)Expected: %d\033[0m -- \033[1;32mResult: %d\n\033[0m", "1234", "123+456", 0, ft_atoi_base("1234", "123+456"));
	printf("Number: %s -- Base: %s\n\033[1;31m(Check error '-' or '+' in base)Expected: %d\033[0m -- \033[1;32mResult: %d\n\033[0m", "1234", "-123456", 0, ft_atoi_base("1234", "-123456"));
	return (0);
}
