CC := g++
FLAGS := -Wall
LIBS := -lSDL2
SOURCES_DIR := src
HEADERS_DIR := src
BUILD_DIR := build
BINARY := game

SOURCES := $(wildcard $(SOURCES_DIR)/*.cpp)
HEADERS := $(wildcard $(HEADERS_DIR)/*.h)
HEADERS += $(wildcard $(HEADERS_DIR)/*.hpp)
OBJECTS := $(patsubst $(SOURCES_DIR)/%.cpp, $(BUILD_DIR)/%.o, $(SOURCES))

.PHONY: all

all: $(BINARY)

$(BINARY): $(OBJECTS)
	$(CC) $(FLAGS) $(LIBS) $(OBJECTS) -o $(BINARY)

$(BUILD_DIR)/%.o: $(SOURCES_DIR)/%.cpp $(HEADERS)
	$(CC) -c -o $@ $< $(FLAGS) $(LIBS)