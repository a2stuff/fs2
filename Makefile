### Common definitions

# Compile flags.
CAFLAGS = --target apple2 --list-bytes 0 --warnings-as-errors -W2
LDFLAGS = --config src/asm.cfg --warnings-as-errors

# Build into an 'out'  dir:
OUTDIR = out

# Headers
HEADERS = src/macros.inc

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
	rm -f $(OUTDIR)/*.list
	rm -f $(OUTDIR)/?_????-????
	rm -f $(OUTDIR)/*.rev
	rm -f $(OUTDIR)/*.pak
	rm -f $(TARGETS)
	rm -f $(OUTDIR)/prorwts2\#0624f8
	rm -f $(OUTDIR)/fs2\#0624f8

$(OUTDIR)/chunk1.built: res/loading_panel.bin
	cp res/loading_panel.bin $(OUTDIR)/chunk1.built

$(OUTDIR)/%.o: src/%.s $(HEADERS)
	ca65 $(CAFLAGS) --listing $(basename $@).list -o $@ $<

$(OUTDIR)/%.built: $(OUTDIR)/%.o src/asm.cfg
	ld65 $(LDFLAGS) -o $@ $<

# "Phony" target that verifies that built chunks exactly match the
# original chunks of the @qkumba's ProDOS port.
validate:
	@diff -q chunks/1_4000-5fff out/chunk1.built > /dev/null || ( echo "Chunk 1 mismatch" && false )
	@diff -q chunks/2_f600-fbff out/chunk2.built > /dev/null || ( echo "Chunk 2 mismatch" && false )
	@diff -q chunks/3_d300-f3ff out/chunk3.built > /dev/null || ( echo "Chunk 3 mismatch" && false )
	@diff -q chunks/4_0200-25ff out/chunk4.built > /dev/null || ( echo "Chunk 4 mismatch" && false )
	@diff -q chunks/5_6000-b3df out/chunk5.built > /dev/null || ( echo "Chunk 5 mismatch" && false )

# Target that creates a FS2 binary using @qkumba's ProRWTS2, with
# custom code for loading FS2 chunks.
binary: $(OUTDIR)/fs2\#0624f8

$(OUTDIR)/fs2\#0624f8: $(TARGETS)
	cp $(OUTDIR)/chunk1.built $(OUTDIR)/1_4000-5fff
	cp $(OUTDIR)/chunk2.built $(OUTDIR)/2_f600-fbff
	cp $(OUTDIR)/chunk3.built $(OUTDIR)/3_d300-f3ff
	cp $(OUTDIR)/chunk4.built $(OUTDIR)/4_0200-25ff
	cp $(OUTDIR)/chunk5.built $(OUTDIR)/5_6000-b3df
	cd $(OUTDIR) && ../loader/pack.py
	cd $(OUTDIR) && acme --report prorwts2.list ../loader/PRORWTS2.S
	cd $(OUTDIR) && ../loader/movebytes.py


