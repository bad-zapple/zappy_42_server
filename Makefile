NAME=bzs
BUILD_DIR=build/
TARGET=$(BUILD_DIR)$(NAME)

all: $(TARGET)

.PHONY: all 

run: $(TARGET)
	$(TARGET) $(ARGS)

.PHONY: run 

$(TARGET): cmake-rule
	make -C $(BUILD_DIR)
	
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

cmake-rule: update-sources
	cmake -B $(BUILD_DIR)

clean:
	make clean -C $(BUILD_DIR)

.PHONY: clean 

fclean:
	rm -rf $(BUILD_DIR)

.PHONY: fclean 

prune: fclean
	make -C libbad-zapple fclean
	
re: fclean all

.PHONY: re 

lsp:
	cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -B $(BUILD_DIR)

.PHONY: lsp 

update-sources: $(BUILD_DIR)
	@sh ./tools/list_sources.sh build/sources.cmake
	make update-sources -C libbad-zapple

.PHONY: update-sources
