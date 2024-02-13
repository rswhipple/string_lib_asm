# Project configuration
TARGET_EXEC := myapp
LIB_NAME := asm
BUILD_DIR := ./build
SRC_ASM_DIR := ./src_asm
SRC_C_DIR := ./src_c
INC_DIR := -I ./inc

# Compiler and Assembler configuration
CC := gcc
ASM := nasm
CFLAGS := $(INC_DIR) -Wall -fPIC -Wextra -Werror
ASMFLAGS := -f elf64

# Library names
TARGET_STATIC := $(BUILD_DIR)/lib$(LIB_NAME).a
TARGET_DYNAMIC := $(BUILD_DIR)/lib$(LIB_NAME).so

# Source files
ASM_SRCS := $(wildcard $(SRC_ASM_DIR)/*.S)
C_SRCS := $(wildcard $(SRC_C_DIR)/*.c)

# Object files
ASM_OBJS := $(patsubst $(SRC_ASM_DIR)/%.S,$(BUILD_DIR)/%.o,$(ASM_SRCS))
C_OBJS := $(patsubst $(SRC_C_DIR)/%.c,$(BUILD_DIR)/%.o,$(C_SRCS))

# Phony targets
.PHONY: all clean fclean re static dynamic exec

all: static dynamic exec

# Static library
static: $(TARGET_STATIC)

$(TARGET_STATIC): $(ASM_OBJS) $(C_OBJS)
	ar rcs $@ $^

# Dynamic library
dynamic: $(TARGET_DYNAMIC)

$(TARGET_DYNAMIC): $(CFLAGS) += -fPIC
$(TARGET_DYNAMIC): $(ASM_OBJS) $(C_OBJS)
	$(CC) -shared -o $@ $^

# Executable
exec: $(TARGET_EXEC)

$(TARGET_EXEC): $(C_OBJS) $(ASM_OBJS)
	$(CC) $(CFLAGS) -o $@ $^ -L$(BUILD_DIR) -l$(LIB_NAME) # Link against the static library by default

# Assembly source build rule
$(BUILD_DIR)/%.o: $(SRC_ASM_DIR)/%.S | $(BUILD_DIR)
	$(ASM) $(ASMFLAGS) -o $@ $<

# C source build rule
$(BUILD_DIR)/%.o: $(SRC_C_DIR)/%.c | $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD_DIR):
	mkdir -p $@

# Clean up
clean:
	find $(BUILD_DIR) -type f -name '*.o' -delete

fclean: clean
	rm -f $(TARGET_STATIC) $(TARGET_DYNAMIC) $(TARGET_EXEC)

re: fclean all
