##
## EPITECH PROJECT, 2018
## 203hotline
## File description:
## Makefile for 203hotline.
##

NAME	=	203hotline

all: $(NAME)

$(NAME):
	cp 203hotline.rb $(NAME)
	chmod +x $(NAME)

launch_tests:
	./launch_tests.sh

.PHONY:	all launch_tests $(NAME)
