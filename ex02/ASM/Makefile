
SRCDIR  =	./
SRCS	=	main.s

OBJDIR  =	./objs
OBJS	=	$(addprefix $(OBJDIR)/,$(SRCS:.s=.o))

FLAGS	=	-f elf64

NAME	=	./test/Sully

default:
	make all

$(OBJDIR)/%.o : $(SRCDIR)/%.s
	nasm $(FLAGS) $< -o $@

$(OBJDIR):
	mkdir $(OBJDIR)

./test:
	mkdir ./test

$(NAME): $(OBJDIR) ./test $(OBJS)
	gcc -no-pie -Wall -Wextra -Werror $(OBJS) -o $(NAME)

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
