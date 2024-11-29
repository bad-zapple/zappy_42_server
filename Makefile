NAME=bzs
BUILD_DIR=build/
TARGET=$(BUILD_DIR)$(NAME)

all: $(TARGET)

run: $(TARGET)
	$(TARGET) $(ARGS)


$(TARGET): cmake-rule
	make -C $(BUILD_DIR)
	

%.o: %.cpp $(HEADER)
	$(CC) $(CFLAGS) -c $< -o $@

cmake-rule:
	mkdir -p $(BUILD_DIR)
	cmake -B $(BUILD_DIR)

clean:
	make clean -C $(BUILD_DIR)

re: clean all

lsp:
	cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -B $(BUILD_DIR)

.PHONY: all run cmake-rule clean fclean re
