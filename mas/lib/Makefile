#LIBS  = -lkernel32
#CFLAGS = -Wall
#INCLS = -I ../maskern/ -I ../maslisp


# kfp@omega:~/devel/MAS/mas/lib$ sudo apt install libkpathsea-dev

# Should be equivalent to your list of C files, if you don't build selectively
SRC=$(wildcard *.c)

all: $(SRC)
	gcc  -c $@ $^  $(INCLS)  

# $(CFLAGS) $(LIBS)



