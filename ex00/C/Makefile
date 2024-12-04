
SRCDIR  =	./
SRCS	=	main.c

OBJDIR  =	./objs
OBJS	=	$(addprefix $(OBJDIR)/,$(SRCS:.c=.o))

LIBS    =   
INCLUDE =	-I ./
CFLAGS	=	-g3 -Wall -Wextra -Werror $(INCLUDE) $(LIBS)

NAME	=	Colleen

default:
	make all

$(OBJDIR)/%.o : $(SRCDIR)/%.c
	gcc $(CFLAGS) -c $< -o $@

$(OBJDIR):
	mkdir $(OBJDIR)

$(NAME): $(OBJDIR) $(OBJS)
	gcc $(OBJS) $(CFLAGS) -o $(NAME)

all:	$(NAME)

clean:
	rm -f $(OBJS)
	rm -Rf $(OBJDIR)

fclean:		clean
	rm -f $(NAME)

re:
	make fclean
	make all

.PHONY:	default all clean fclean re
