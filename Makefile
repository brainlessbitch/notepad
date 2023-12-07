VALAC=valac
VALAFLAGS=--pkg gtk+-3.0

OUT=notepad

all: $(OUT)

$(OUT): src/*.vala
	$(VALAC) $(VALAFLAGS) $^ -o $@

clean:
	rm -f $(OUT)
