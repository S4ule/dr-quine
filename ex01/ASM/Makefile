
SRCDIR  =	./
SRCS	=	main.s

OBJDIR  =	./objs
OBJS	=	$(addprefix $(OBJDIR)/,$(SRCS:.s=.o))

FLAGS	=	-f elf64

NAME	=	Grace

default:
	make all

$(OBJDIR)/%.o : $(SRCDIR)/%.s
	nasm $(FLAGS) $< -o $@

$(OBJDIR):
	mkdir $(OBJDIR)

$(NAME): $(OBJDIR) $(OBJS)
	gcc -Wall -Wextra -Werror $(OBJS) -o $(NAME)

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
