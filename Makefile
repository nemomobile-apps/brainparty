CXXFLAGS ?= -g
PREFIX ?= /usr
DESTDIR ?=

PKGS = sdl2 SDL2_image SDL2_mixer SDL2_ttf glesv1_cm egl
CXXFLAGS += $(shell pkg-config --cflags $(PKGS))
LIBS += $(shell pkg-config --libs $(PKGS))

OBJFILES := $(patsubst %.cpp,%.o,$(wildcard *.cpp))

all: brainparty

brainparty: $(OBJFILES)
	$(CXX) -o $@ $^ $(LIBS)

install: brainparty
	install -D -m755 brainparty $(DESTDIR)/opt/brainparty/brainparty
	install -D -m644 brainparty.png $(DESTDIR)/opt/brainparty/brainparty.png
	mkdir -p $(DESTDIR)/opt/brainparty/Content/
	cp Content/* $(DESTDIR)/opt/brainparty/Content/
	install -D -m644 brainparty.desktop $(DESTDIR)$(PREFIX)/share/applications/brainparty.desktop

clean:
	rm -f brainparty *.o

.PHONY: all install clean
