# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: alvachon <alvachon@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/03/30 19:31:23 by alvachon          #+#    #+#              #
#    Updated: 2022/05/21 21:47:45 by alvachon         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# $@ expands to the target name, i.e. target1
# $< expands to the first dependency, i.e. dependency1
# $^ expands to the complete list of dependencies, i.e. dependency1 dependency2

# COMPILATION SYSTEM FOR STATIC LIBRARY LIBFT.A

CC=gcc
CFLAGS=-Wall -Wextra -Werror
NAME=libft.a

# SOURCE FUNCTION FOR LIBFT.A (34)

SRCS= ft_bzero.c \
	  ft_isalnum.c \
	  ft_isalpha.c \
	  ft_isascii.c \
	  ft_isdigit.c \
	  ft_isprint.c \
	  ft_memchr.c \
	  ft_memcpy.c \
	  ft_memmove.c \
	  ft_memset.c \
	  ft_strchr.c \
	  ft_strrchr.c \
	  ft_strlcat.c \
	  ft_strlcpy.c \
	  ft_strlen.c \
	  ft_strncmp.c \
	  ft_tolower.c \
	  ft_toupper.c \
	  ft_calloc.c \
	  ft_memcmp.c \
	  ft_strnstr.c \
	  ft_strdup.c \
	  ft_substr.c \
	  ft_strjoin.c \
	  ft_atoi.c \
	  ft_itoa.c \
	  ft_strtrim.c \
	  ft_split.c \
	  ft_strmapi.c \
	  ft_striteri.c \
	  ft_putchar_fd.c \
	  ft_putstr_fd.c \
	  ft_putnbr_fd.c \
	  ft_putendl_fd.c \

# OBJECTS FUNCTIONS FOR LIBFT.A

OBJS=$(SRCS:%c=%o)
BONUS_O=$(BONUS_S:%c=%o)

# HEADER FOR LIBFT.A && BONUS

HEADERS=libft.h

# SOURCE FUNCTION FOR BONUS

BONUS_S=	ft_lstnew.c \
			ft_lstadd_front.c \
			ft_lstsize.c \
			ft_lstlast.c \
			ft_lstadd_back.c \
			ft_lstdelone.c \
			ft_lstclear.c \
			ft_lstiter.c \
			ft_lstmap.c \

# GENERIC CALL FOR LIBFT.A

all: $(NAME)

# GENERIC CALL FOR BONUS

bonus: $(NAME) $(BONUS_O)
	ar -rcs $^

# - - - - CUSTOM CALL (1) - - NORMINETTE

#norm: $(SRCS) $(BONUS_S) $(HEADERS)
#	norminette $(SRCS) $(BONUS_S)
#	norminette -R CheckDefine $(HEADERS)

# - - - - CUSTOM CALL (2) - - BUILD ARCHIVE LIBRARY

$(NAME): $(OBJS)
	ar -rcs $@ $^

# - - - - CLEAN OBJS (.o)

clean: $(OBJS) $(BONUS_O)
	rm -rf $^

# - - - - CLEAN ARCHIVE FILE AND NON USED FILES

fclean: clean
	rm -rf $(NAME)

# GENERIC CALL TO REMAKE EVERYTHING FOR LIBFT.A

re: clean fclean all

# NON-ASSOCIATED ACTION CALLS (8)

.PHONY: all clean fclean re norm bonus
