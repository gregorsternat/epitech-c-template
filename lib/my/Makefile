##
## EPITECH PROJECT, 2023
## Makefile
## File description:
## compil and create the lib
##

RM	= 	rm -f

SRC    =

OBJ    =    $(SRC:.c=.o)

NAME_LIB   =    libmy.a

NAME_HEADER    =

all: $(NAME_LIB)

$(NAME_LIB): $(OBJ)
	ar rc $(NAME_LIB) $(OBJ)
	cp $(NAME_HEADER) ../../include/

clean:
	$(RM) $(OBJ)
	$(RM) $(NAME_LIB)
