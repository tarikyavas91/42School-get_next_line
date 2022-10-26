# Folders and Names
NAME		= get_next_line.a
SRCSDIR		= srcs
OBJSDIR		= objs
INCLUDES	= incs

SRCS			=	get_next_line.c get_next_line_utils.c
OBJS		= $(SRCS:%.c=$(OBJSDIR)/%.o)
	

BONUS			=	get_next_line_bonus.c get_next_line_utils_bonus.c
BONUS_OBJS		= $(BONUS:%.c=$(OBJSDIR)/%.o)
# Compiler options
CC			= gcc
CFLAGS		= -Wall -Wextra -g3

all: $(NAME)

$(NAME): $(OBJS)
	@echo "Bağlama $@"
	@ar rc $(NAME) $(OBJS)
	@echo "Done!"

$(OBJS): $(OBJSDIR)/%.o: %.c
	@mkdir -p $(@D)
	@echo "derleniyor $<"
	@$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(OBJSDIR)

fclean: clean
	rm -rf $(NAME)

re: fclean all

bonus: $(OBJS) $(BONUS_OBJS)
	@echo "Bağlama $@"
	@ar rcs $(NAME) $(OBJS) $(BONUS_OBJS)
	@echo "Done!"

$(BONUS_OBJS): $(OBJSDIR)/%.o: %.c
	@mkdir -p $(@D)
	@echo "bonus derleniyor $<"
	@$(CC) $(CFLAGS) -I$(INCLUDES) -c $< -o $@

.PHONY: all clean fclean re bonus

