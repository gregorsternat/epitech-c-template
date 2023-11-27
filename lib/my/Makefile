##
## EPITECH PROJECT, 2023
## Makefile
## File description:
## compil and create the lib
##
ifeq ($(shell uname),Linux)
    ECHO := echo -e
endif

DEFAULT 	=	"\033[0m"
BOLD_T  	=	"\033[1m"
UNDERLINE_T =  	"\033[4m"
ORANGE_C	=	"\033[38;2;255;153;51m" # 255 153 51
YELLOW_C 	=	"\033[38;2;255;255;0m"	# 255 255 0
RED_C		=	"\033[31m"
LIGHT_RED	=	"\033[38;2;168;15;1m" # 168 15 1
GREEN_C 	=	"\033[32m"
LIGHT_GREEN = 	"\033[38;2;144;238;144m" # 144, 238, 144
LIGHT_PURPLE=	"\033[35m"
PURPLE_C    =	"\033[38;2;157;0;230m" # 157, 0, 230

define success_lib
	$(ECHO) $(BOLD_T)$(UNDERLINE_T)$(GREEN_C)"\n[✔] COMPILED: $(SRC)"$(DEFAULT)
	$(ECHO) $(BOLD_T)$(UNDERLINE_T)$(GREEN_C)"\n[✔] COMPILED:"$(DEFAULT)$(LIGHT_GREEN)		\
	"$(1)\n"$(DEFAULT)
endef

define fail_lib
	$(ECHO) $(BOLD_T)$(UNDERLINE_T)$(RED_C)"[✘] BUILD FAILED:"$(DEFAULT)$(LIGHT_RED)		\
	"$(1)\n"$(DEFAULT)
endef

RM	= 	rm -f

SRC    =

OBJ    =    $(SRC:.c=.o)

NAME_LIB   =    libmy.a

NAME_HEADER    =	my.h

all: $(NAME_LIB)

$(NAME_LIB): $(OBJ)
	@ar rc $(NAME_LIB) $(OBJ) && $(call success_lib, $(NAME_LIB))  \
    || $(call fail_lib, $(NAME_LIB))
	@cp $(NAME_HEADER) ../../include/ && $(ECHO) $(ORANGE_C)$(BOLD_T)"\n[COPIED]:"	\
	$(DEFAULT) $(YELLOW_C)"$(NAME_HEADER) in include folder"$(DEFAULT)

clean:
	@$(RM) $(OBJ)
	@$(ECHO) $(PURPLE_C)$(BOLD_T)"[CLEAN]"$(DEFAULT) $(PURPLE_C)	\
	"DELETED: "$(DEFAULT) $(LIGHT_PURPLE)"$(NAME)'s object files"$(DEFAULT)

fclean: clean
	$(RM) $(NAME_LIB)
	@$(ECHO) $(PURPLE_C)$(BOLD_T)"[FCLEAN]"$(DEFAULT) $(PURPLE_C)	\
    "DELETED: "$(DEFAULT) $(LIGHT_PURPLE)"$(NAME_LIB) binary"$(DEFAULT)

