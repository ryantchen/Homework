CC=gcc
OUTPUT_PATH=out
ifdef TARGET_OUTPUT
BUILD_OUTPUT := hello_$(TARGET_OUTPUT)
$(info *** $(BUILD_OUTPUT))
endif

all: helloworld

helloworld: hello.o
	@rm -rf  $(OUTPUT_PATH)
	@mkdir $(OUTPUT_PATH)
	@$(CC) helloworld.o -o $(OUTPUT_PATH)/$(BUILD_OUTPUT)

hello.o: helloworld.c
	@$(CC) -c helloworld.c
	
clean:
	@rm -rf  $(OUTPUT_PATH)
	@rm *.o 
