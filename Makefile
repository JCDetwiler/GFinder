SRC_DIR=FastDynamic
OBJ_DIR=obj

CC=g++
CFLAGS=-std=c++17 -Wall -Werror -pedantic -g -O2
EXECUTABLE := gfinder
SRC := $(wildcard $(SRC_DIR)/*.cpp)
OBJ := $(SRC:$(SRC_DIR)/%.cpp=$(OBJ_DIR)/%.o)

$(EXECUTABLE): $(OBJ)
	$(CC) $^ -o $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp | $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJ_DIR):
	mkdir -p $@

clean:
	@$(RM) -rv $(OBJ_DIR) $(EXECUTABLE)