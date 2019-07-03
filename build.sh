#!/bin/sh

c_f="ClientFiles_C"
emulator_f="EmulatorFiles"
examples_f="examples"

cd $emulator_f
make

cd ../$c_f
gcc -c -fPIC Client_API.c -o Client_API.o
gcc -c -fPIC Client_Dispatcher.c -o Client_Dispatcher.o
gcc -c -fPIC Client_Packager.c -o Client_Packager.o
gcc -c -fPIC Serializer_BuiltIn.c -o Serializer_BuiltIn.o
gcc -c -fPIC Serializer_Struct.c -o Serializer_Struct.o
gcc -c -fPIC UART_Connector.c -o UART_Connector.o

gcc -shared Client_API.o Client_Dispatcher.o Client_Packager.o Serializer_BuiltIn.o Serializer_Struct.o UART_Connector.o -o libbosonclient.so

cd ../
gcc -I$c_f $examples_f/example_linux.c $c_f/libbosonclient.so $emulator_f/UART_HalfDuplex64.so -o $examples_f/example_linux
gcc -I$c_f $examples_f/boson_cpu_temp.c $c_f/libbosonclient.so $emulator_f/UART_HalfDuplex64.so -o $examples_f/boson_cpu_temp
gcc -I$c_f $examples_f/boson_sensor_temp.c $c_f/libbosonclient.so $emulator_f/UART_HalfDuplex64.so -o $examples_f/boson_sensor_temp
