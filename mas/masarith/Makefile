#LIBS  = -lkernel32 -luser32 -lgdi32 -lopengl32
#CFLAGS = -Wall
INCLS = -I ../maskern/ -I ../maslisp

# Should be equivalent to your list of C files, if you don't build selectively
SRC=$(wildcard *.mod)

all: $(SRC)
	gm2  -c $@ $^  $(INCLS)  

# $(CFLAGS) $(LIBS)



