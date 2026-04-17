CC = gcc
TARGET = shadow
SRC = shadow.c

CFLAGS = $(shell pkg-config --cflags gtk+-3.0 gtk-layer-shell-0)
LIBS = $(shell pkg-config --libs gtk+-3.0 gtk-layer-shell-0)

all: $(TARGET)

$(TARGET): $(SRC)
	$(CC) $(SRC) -o $(TARGET) $(CFLAGS) $(LIBS)

clean:
	rm -f $(TARGET)
