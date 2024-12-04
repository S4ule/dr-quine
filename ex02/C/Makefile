
SRCDIR  =	./
SRCS	=	main.c

OBJDIR  =	./objs
OBJS	=	$(addprefix $(OBJDIR)/,$(SRCS:.c=.o))

LIBS    =   
INCLUDE =	-I ./
CFLAGS	=	-g3 -Wall -Wextra -Werror $(INCLUDE) $(LIBS)

NAME	=	./test/Sully

default:
	make all

$(OBJDIR)/%.o : $(SRCDIR)/%.c
	gcc $(CFLAGS) -c $< -o $@

$(OBJDIR):
	mkdir $(OBJDIR)

./test:
	mkdir ./test

$(NAME): $(OBJDIR) ./test $(OBJS)
	gcc $(OBJS) $(CFLAGS) -o $(NAME)

all:	$(NAME)

clean:
	rm -f $(OBJS)
	rm -Rf $(OBJDIR)

fclean:		clean
	rm -f $(NAME)
	rm -Rf ./test

re:
	make fclean
	make all

.PHONY:	default all clean fclean re
