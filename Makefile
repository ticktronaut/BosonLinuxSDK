CC := gcc

OUT := bin 

subdirs := ClientFiles_C EmulatorFiles

.PHONY: all clean $(subdirs) 

all: $(OUT) $(subdirs) bins

clean: $(subdirs) 
	rm -r bin

objs: $(subdirs)

$(subdirs):
	$(MAKE) -C $@ $(MAKECMDGOALS)

$(OUT):
	mkdir -p $(OUT)

bins:
	$(CC) -IClientFiles_C examples/example_linux.c ClientFiles_C/libbosonclient.so EmulatorFiles/UART_HalfDuplex64.so -o bin/example_linux
	$(CC) -IClientFiles_C examples/boson_cpu_temp.c ClientFiles_C/libbosonclient.so EmulatorFiles/UART_HalfDuplex64.so -o bin/boson_cpu_temp
	$(CC) -IClientFiles_C examples/boson_sensor_temp.c ClientFiles_C/libbosonclient.so EmulatorFiles/UART_HalfDuplex64.so -o bin/boson_sensor_temp
	$(CC) -IClientFiles_C examples/boson_temp.c ClientFiles_C/libbosonclient.so EmulatorFiles/UART_HalfDuplex64.so -o bin/boson_temp
