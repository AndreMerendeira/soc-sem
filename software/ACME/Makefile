CC := g++
INCLUDE = -I.

CSRCS := Acme.cpp bin2hex.cpp dec2bin.cpp injectionRange.cpp pBlockRange.cpp stdafx.cpp welcome.cpp
TRGT := Acme
CHDRS :=mainHeader.h resource.h stdafx.h

all: run

$(TRGT): $(CSRCS) $(CHDRS)
	$(CC) $(CFLAGS) $(CSRCS) -o $@

run: $(TRGT)
	./$(TRGT)

clean:
	@rm -f *# *~ $(TRGT)
	@rm -f frameRange.txt synth_system.ebd

.PHONY: all run clean
