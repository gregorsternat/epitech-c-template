##
## EPITECH PROJECT, 2023
## Makefile
## File description:
## Makefile
##
ifeq ($(shell uname),Linux)
    ECHO := echo -e
endif

DEFAULT 	=	"\033[0m"
BOLD_T  	=	"\033[1m"
UNDERLINE_T =  	"\033[4m"
RED_C		=	"\033[31m"
LIGHT_RED	=	"\033[38;2;168;15;1m" # 168 15 1
LIGHT_PURPLE=	"\033[35m"
PURPLE_C    =	"\033[38;2;157;0;230m" # 157, 0, 230
GREEN_C 	=	"\033[32m"
LIGHT_GREEN = 	"\033[38;2;144;238;144m" # 144, 238, 144
BLUE_C		=	"\033[34m"

CC		=	gcc
CFLAGS		=	-Wall -Wextra
CRT_FLAGS	= 	--coverage -lcriterion

RM		= rm -f

SRC 	=
SRC_TEST	=
MAIN_SRC	= 	./src/main.c

NAME	=	setting_up
NAME_TEST	=	unit_tests

LIB_PATH	=	./lib/my
LIB_FLAG		=	-L$(LIB_PATH) -lmy

define success
	$(ECHO) $(BOLD_T)$(UNDERLINE_T)$(GREEN_C)"\n[✔] COMPILED:" \
	$(DEFAULT)$(LIGHT_GREEN)" $(MAIN_SRC) $(SRC)"$(DEFAULT)
	$(ECHO) $(BOLD_T)$(UNDERLINE_T)$(GREEN_C)"\n[✔] COMPILED:" \
	$(DEFAULT)$(LIGHT_GREEN) "$(1)\n"$(DEFAULT)
endef

define fail
	$(ECHO) $(BOLD_T)$(UNDERLINE_T)$(RED_C)"[✘] BUILD FAILED:" \
	$(DEFAULT)$(LIGHT_RED)"$(1)\n"$(DEFAULT)
endef

.PHONY: all clean fclean re tests_clean tests_run

all: $(NAME)

$(NAME):
	@make -C $(LIB_PATH)
	@$(CC) $(MAIN_SRC) $(SRC) -o $(NAME) $(LIB_FLAG) $(CFLAGS) && \
	$(call success, $(NAME)) || $(call fail, $(NAME))

tests_run: fclean
	@make -C $(LIB_PATH)
	@$(CC) $(SRC) $(SRC_TEST) $(CFLAGS) -o $(NAME_TEST) $(CRT_FLAGS) \
 	$(LIB_FLAG) && $(call success, $(NAME)) || $(call fail, $(NAME))
	@$(ECHO) $(BLUE_C)$(BOLD_T)"\n[TESTS]: "$(DEFAULT)
	@./$(NAME_TEST)

coverage: tests_run
	@$(ECHO) $(BLUE_C)$(BOLD_T)"\n[COVERAGE]: "$(DEFAULT)
	@gcovr --exclude tests/ --branches

valgrind: fclean
	@make -C $(LIB_PATH)
	@$(CC) $(MAIN_SRC) $(SRC) -o $(NAME) $(LIB_FLAG) -g3 \
	&& $(call success, $(NAME)) || $(call fail, $(NAME))

clean: tests_clean
	@make clean -C $(LIB_PATH)
	@$(RM) vgcore.*
	@$(ECHO) $(PURPLE_C)$(BOLD_T)"[CLEAN]"$(DEFAULT) $(PURPLE_C)	\
	"DELETED: "$(DEFAULT) $(LIGHT_PURPLE)"$(NAME)'s valgrind files"$(DEFAULT)

tests_clean:
	@$(RM) *.gcno
	@$(RM) *.gcda
	@$(ECHO) $(PURPLE_C)$(BOLD_T)"[TESTS_CLEAN]"$(DEFAULT) $(PURPLE_C)	\
    "DELETED: "$(DEFAULT) $(LIGHT_PURPLE)"$(NAME)'s tests files"$(DEFAULT)

fclean: clean tests_clean
	@make fclean -C $(LIB_PATH)
	@$(RM) $(NAME)
	@$(ECHO) $(PURPLE_C)$(BOLD_T)"[FCLEAN]"$(DEFAULT) $(PURPLE_C)	\
    "DELETED: "$(DEFAULT) $(LIGHT_PURPLE)"$(NAME) binary"$(DEFAULT)
	@$(RM) $(NAME_TEST)
	@$(ECHO) $(PURPLE_C)$(BOLD_T)"[FCLEAN]"$(DEFAULT) $(PURPLE_C)	\
    "DELETED: "$(DEFAULT) $(LIGHT_PURPLE)"$(NAME_TEST) binary"$(DEFAULT)

re: fclean all
