### Common definitions

# Compile flags.
CAFLAGS = --target apple2 --list-bytes 0 --warnings-as-errors -W2
LDFLAGS = --config src/asm.cfg --warnings-as-errors

# Build into an 'out'  dir:
OUTDIR = out

# Headers
HEADERS =

TARGETS = $(OUTDIR)/chunk1.built \
	$(OUTDIR)/chunk2.built \
	$(OUTDIR)/chunk3.built \
	$(OUTDIR)/chunk4.built \
	$(OUTDIR)/chunk5.built \

.PHONY: clean all validate
all: $(OUTDIR) $(TARGETS)

$(OUTDIR):
	mkdir -p $(OUTDIR)

clean:
	rm -f $(OUTDIR)/*.o
	rm -f $(TARGETS)

$(OUTDIR)/chunk1.built: res/loading_panel.bin
	cp res/loading_panel.bin $(OUTDIR)/chunk1.built

$(OUTDIR)/%.o: src/%.s $(HEADERS)
	ca65 $(CAFLAGS) --listing $(basename $@).list -o $@ $<

$(OUTDIR)/%.built: $(OUTDIR)/%.o src/asm.cfg
	ld65 $(LDFLAGS) -o $@ $<


validate:
	@diff -q chunks/1_4000-5fff out/chunk1.built > /dev/null || echo "Chunk 1 mismatch"
	@diff -q chunks/2_f600-fbff out/chunk2.built > /dev/null || echo "Chunk 2 mismatch"
	@diff -q chunks/3_d300-f3ff out/chunk3.built > /dev/null || echo "Chunk 3 mismatch"
	@diff -q chunks/4_0200-25ff out/chunk4.built > /dev/null || echo "Chunk 4 mismatch"
	@diff -q chunks/5_6000-b3df out/chunk5.built > /dev/null || echo "Chunk 5 mismatch"

