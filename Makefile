CC := gcc
CFLAGS := -g -Wall -std=c99 -pedantic -I$(INC_DIR)
LFLAGS := -g

# directories
SRC_DIR := SRC_DIR
OBJ_DIR := OBJ_DIR
BIN_DIR := BIN_DIR
INC_DIR := INC_DIR

# target and objs
OBJS := $(OBJ_DIR)/main.o $(OBJ_DIR)/math_ops.o
TARGET := $(BIN_DIR)/main.exe

.PHONY: all clean check-shell

RM := rm -f

# default target
all: $(TARGET)

# create directories if they arent there
$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

$(BIN_DIR):
	mkdir -p $(BIN_DIR)

# link the executable
$(TARGET): $(OBJS) | $(BIN_DIR)
	$(CC) $(LFLAGS) $(OBJ_DIR)/main.o $(OBJ_DIR)/math_ops.o -o $(TARGET)

# compile main.c
$(OBJ_DIR)/main.o: $(SRC_DIR)/main.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $(SRC_DIR)/main.c -o $(OBJ_DIR)/main.o

# compile math_ops.c
$(OBJ_DIR)/math_ops.o: $(SRC_DIR)/math_ops.c $(INC_DIR)/math_ops.h | $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $(SRC_DIR)/math_ops.c -o $(OBJ_DIR)/math_ops.o

# clean
clean:
	$(RM) $(OBJ_DIR)/*.o $(TARGET)