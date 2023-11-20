##
## EPITECH PROJECT, 2023
## Makefile
## File description:
## Makefile
##

CC		=	gcc
CFLAGS		=	-Wall -Wextra -Werror
CRT_FLAGS	= 	--coverage -lcriterion

RM		= rm -f

SRC 	=
SRC_TEST	=
MAIN_SRC	= 	./src/main.c

NAME	=	coucou
NAME_TEST	=	unit_tests

LIB_PATH	=	./lib/my

.PHONY: all clean fclean re tests_clean tests_run

all: $(NAME)

$(NAME):
	make -C $(LIB_PATH)
	$(CC) $(MAIN_SRC) $(SRC) -o $(NAME)

tests_run:
	$(CC) $(SRC) $(SRC_TEST) $(CFLAGS) -o ($NAME_TEST) $(CRT_FLAGS)
	./$(NAME_TEST)

coverage: tests_run
	gcovr --exclude tests/ --branches

valgrind:
	$(CC) $(MAIN_SRC) $(SRC) -o $(NAME) -g3
	valgrind -s ./$(NAME)

clean:
	make clean -C $(LIB_PATH)

tests_clean:
	$(RM) *.gcno
	$(RM) *.gcda

fclean: clean tests_clean
	$(RM) $(NAME)
	$(RM) $(NAME_TEST)

re: fclean all
