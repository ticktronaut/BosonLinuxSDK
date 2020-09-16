CC := gcc

SOURCES := Client_API.c Client_Dispatcher.c Serializer_BuiltIn.c UART_Connector.c Client_Packager.c Serializer_Struct.c

OBJECTS := $(notdir $(SOURCES:.c=.o))

.PHONY: all objs shared

all: objs shared

objs: $(OBJECTS)

%.o: %.c
	gcc -c -fPIC $< -o $@

shared: $(OBJECTS)
	$(CC) -shared $(OBJECTS) -o libbosonclient.so

clean:
	rm *.o
	rm *.so
