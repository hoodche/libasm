# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: igcastil <igcastil@student.42madrid.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/08/06 16:14:27 by igcastil          #+#    #+#              #
#    Updated: 2025/08/08 09:38:55 by igcastil         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS		=	ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s \
				ft_read.s ft_strdup.s
OBJS		=	$(SRCS:.s=.o)

NA			=	nasm
NA_FLAGS	=	-f elf64 # elf64 is the object file format for Linux (ELF)
FLAGS 		=	-Wall -Werror -Wextra
NAME		=	libasm.a
TEST		=	test

%.o:			%.s
				$(NA) $(NA_FLAGS) $<

all:			$(NAME)

$(NAME):		$(OBJS)
				ar rcs $(NAME) $(OBJS)

clean:
				rm -rf $(OBJS) 

fclean:			clean
				rm -rf $(NAME) $(TEST)

re:				fclean $(NAME)

test:			$(NAME)
				gcc $(FLAGS) -o $(TEST) main.c $(NAME)
				./$(TEST)

.PHONY:			clean fclean re test