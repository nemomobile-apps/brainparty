CXXFLAGS ?= -g

PKGS = sdl2 SDL2_image SDL2_mixer SDL2_ttf glesv1_cm egl
CXXFLAGS += $(shell pkg-config --cflags $(PKGS))
LIBS += $(shell pkg-config --libs $(PKGS))

OBJFILES := $(patsubst %.cpp,%.o,$(wildcard *.cpp))

all: brainparty

brainparty: $(OBJFILES)
	$(CXX) -o $@ $^ $(LIBS)

clean:
	rm -f brainparty *.o

.PHONY: all clean
