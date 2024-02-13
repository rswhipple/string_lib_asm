TARGET := libasm
TARGET_STATIC := libasm.a
TARGET_DYNAMIC := libasm.so
BUILD_DIR := ./build
SRC_ASM_DIR := ./src_asm
SRC_C_DIR := ./src_c
INC_DIR := -I ./inc

# Compiler and Assembler configuration
CC := gcc
ASM := nasm
CFLAGS := $(INC_DIR) -Wall -fPIC -Wextra -Werror -g -fsanitize=address
ASMFLAGS := -f elf64

all: $(TARGET) $(TARGET_STATIC) $(TARGET_DYNAMIC)

# Source files
ASM_SRCS := $(wildcard $(SRC_ASM_DIR)/*.S)
C_SRCS := $(wildcard $(SRC_C_DIR)/*.c)

# Object files
ASM_OBJS := $(patsubst $(SRC_ASM_DIR)/%.S,$(BUILD_DIR)/%.o,$(ASM_SRCS))
C_OBJS := $(patsubst $(SRC_C_DIR)/%.c,$(BUILD_DIR)/%.o,$(C_SRCS))

# Program build rule
$(TARGET): $(ASM_OBJS) $(C_OBJS)
	$(CC) $(CFLAGS) $(C_OBJS) $(ASM_OBJS) -o $(TARGET) 

# Static library
$(TARGET_STATIC): $(ASM_OBJS) $(C_OBJS)
	ar rcs $(BUILD_DIR)/$@ $^

# Dynamic library
$(TARGET_DYNAMIC): $(ASM_OBJS) $(C_OBJS)
	$(CC) -shared -o $(BUILD_DIR)/$@ $^

# Assembly source build rule
$(BUILD_DIR)/%.o: $(SRC_ASM_DIR)/%.S
	mkdir -p $(dir $@)
	$(ASM) $(ASMFLAGS) -o $@ $<

# C source build rule
$(BUILD_DIR)/%.o: $(SRC_C_DIR)/%.c
	mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	find $(BUILD_DIR) -type f -name '*.o' -delete

fclean: clean
	rm -f $(TARGET)

re: fclean all

