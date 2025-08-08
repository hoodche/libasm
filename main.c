/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: igcastil <igcastil@student.42madrid.com    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/08/06 16:02:01 by igcastil          #+#    #+#             */
/*   Updated: 2025/08/08 09:49:20 by igcastil         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <stdio.h>
#include <fcntl.h>
#include <errno.h>

#define GREEN "\033[32m"
#define RED "\033[31m"
#define BLUE "\033[34m"
#define RESET "\033[0m"


# define STRLEN(x)			printf(GREEN "ft_strlen" "(`%s`) = %d , " RED "strlen"  "(`%s`) = %d\n"RESET, x, ft_strlen(x), x, (int)strlen(x));
# define STRCMP(a, b)		printf("compare `%s`and `%s` with " GREEN "ft_strcmp = %d and with " RED "strcmp = %d)\n"RESET, a, b, ft_strcmp(a, b), strcmp(a, b));
# define WRITE(buf, bytes)	printf(GREEN " <------ft_write(STDOUT_FILENO, %s, %ld) returned %ld\n"RESET, buf, bytes, ft_write(STDOUT_FILENO, buf, bytes));

//_________Function prototypes____________

int		ft_strlen(char const *str);
char	*ft_strcpy(char *dst, char const *src);
int		ft_strcmp(char const *s1, char const *s2);
ssize_t	ft_write(int fd, void const *buf, size_t nbyte);
ssize_t	ft_read(int fd, void *buf, size_t nbyte);
char	*ft_strdup(char const *s1);

int		main(void)
{
	char	buffer[100];
	bzero(buffer, sizeof(buffer));

	printf(BLUE"__________strlen____________\n"RESET);
	STRLEN("")
	STRLEN("42")
	STRLEN("7 caballo viene de bonaaaansaaaaa")
	printf(BLUE"⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻\n\n"RESET);

	printf(BLUE"__________strcpy____________\n"RESET);
	printf(GREEN"printf(%%s, ft_strcpy(buffer, '') prints '%s'\n"RESET, ft_strcpy(buffer, ""));
	printf(GREEN"printf(%%s, ft_strcpy(buffer, '42') prints '%s'\n"RESET, ft_strcpy(buffer, "42"));
	printf(GREEN"printf(%%s, ft_strcpy(buffer, '7 caballo viene de bonaaaansaaaaa') prints '%s'\n"RESET, ft_strcpy(buffer, "7 caballo viene de bonaaaansaaaaa"));
	printf(BLUE"⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻\n\n"RESET);

	printf(BLUE"__________strcmp____________\n"RESET);
	STRCMP("", "")
	STRCMP("42", "42")
	STRCMP("", "42")
	STRCMP("siete", "")
	STRCMP("siete", "siete caballo viene de bonaaaansaaaaa")
	//printf("%d\n",ft_strcmp(NULL, "siete")); this will give segfault, exactly as the original strcmp
	printf(BLUE"⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻\n\n"RESET);

	printf(BLUE"__________write____________\n"RESET);
	WRITE("", 4L)
	WRITE("42", 2L)
	WRITE("siete caballo", 13L)
	WRITE("siete caballo", 2L)
	printf(BLUE"⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻\n\n"RESET);

	printf(BLUE"__________read____________\n"RESET);    
    int         fd;
    ssize_t     ret;

	printf(GREEN"ft_read : \n");   
    	fd = open("test.txt", O_RDONLY);
    	ret = ft_read(fd, buffer, 10);
    	buffer[ret] = '\0';
	printf("buffer = %s ; ret = %zd\n", buffer, ret);
	close(fd);

	printf(RED"read : \n");
	fd = open("test.txt", O_RDONLY);
	ret = read(fd, buffer, 10);
	buffer[ret] = '\0';
	printf("buffer = %s ; ret = %zd\n", buffer, ret);
    close(fd);

	bzero(buffer, sizeof(buffer));
	errno = 0;
	printf(GREEN"\n");
	printf("ft_read : \n");
    	fd = open("lol.txt", O_RDONLY);
    	ret = ft_read(fd, buffer, 10);
 	printf("errno = %d\n", errno);
    	buffer[ret] = '\0';
	printf("buffer = %s ;ret = %zd\n", buffer, ret);
	close(fd);

	errno = 0;
	printf(RED"read : \n");
	fd = open("lol.txt", O_RDONLY);
	ret = read(fd, buffer, 10);
 	printf("errno = %d\n", errno);
	buffer[ret] = '\0';
	printf("buffer = %s ; ret = %zd\n\n", buffer, ret);
    close(fd);

	printf(GREEN"ft_read : \n");
    ret = ft_read(-1, buffer, 2);
 	printf("errno = %d\n", errno);
	printf("buf: %s, ret = %zd\n", buffer, ret);
	close(fd);
	errno = 0;
	printf(RED"read : \n");
	ret = read(-1, buffer, 2);
 	printf("errno = %d\n", errno);
	printf("buf: %s, ret = %zd\n", buffer, ret);
	printf(BLUE"⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻\n\n"RESET);

	printf(BLUE"__________strdup____________\n"RESET);
	char *stret;
	printf(GREEN"ft_strdup(\"test12345\") : \n");
	stret = ft_strdup("test12345");
	printf("%s\n", stret);
	free(stret);
    printf(RED"strdup(\"test12345\") : \n");
	stret = strdup("test12345");
	printf("%s\n\n", stret);
	free(stret);

	printf(GREEN"ft_strdup(\"\") : \n");
	stret = ft_strdup("");
	printf("%s\n", stret);
	free(stret);
    printf(RED"strdup(\"\") : \n");
	stret = strdup("");
	printf("%s\n\n", stret);
	free(stret);

	printf(GREEN"ft_strdup(\"test\\0 12345\") : \n");
	stret = ft_strdup("test\0 12345");
	printf("%s\n", stret);
	free(stret);
    printf(RED"strdup(\"test\\0 12345\") : \n");
	stret = strdup("test\0 12345");
	printf("%s\n", stret);
	free(stret);
	printf(BLUE"⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻⁻\n"RESET);

	return (0);
}
