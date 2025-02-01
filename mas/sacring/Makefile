#LIBS  = -lkernel32 -luser32 -lgdi32 -lopengl32
#CFLAGS = -Wall
INCLS = -I ../maskern/ -I ../maslisp -I ../masring -I ../maspoly \
        -I ../masib -I ../masarith -I ../maskern -I ../sacring  \
        -I ../masmodul -I ../masnc -I ../masdom 

# Should be equivalent to your list of C files, if you don't build selectively
SRC=$(wildcard *.mod)

all: $(SRC)
	gm2  -c $@ $^  $(INCLS)  

# $(CFLAGS) $(LIBS)



