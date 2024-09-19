### Common definitions

# Compile flags.
CAFLAGS = --target apple2 --list-bytes 0 --warnings-as-errors -W2
LDFLAGS = --config src/asm.cfg --warnings-as-errors

# Build into an 'out'  dir:
OUTDIR = out

# Headers
HEADERS = src/macros.inc

CHUNKS = $(OUTDIR)/1_4000-5fff $(OUTDIR)/2_f600-fbff $(OUTDIR)/3_d300-f3ff $(OUTDIR)/4_0200-25ff $(OUTDIR)/5_6000-b3df

TARGETS = $(OUTDIR)/complete.built

.PHONY: clean all chunks validate
all: $(OUTDIR) $(TARGETS)

$(OUTDIR):
	mkdir -p $(OUTDIR)

clean:
	rm -f $(OUTDIR)/*.o
	rm -f $(OUTDIR)/*.built
	rm -f $(OUTDIR)/*.list
	rm -f $(OUTDIR)/?_????-????
	rm -f $(OUTDIR)/*.rev
	rm -f $(OUTDIR)/*.pak
	rm -f $(OUTDIR)/prorwts2\#0624f8
	rm -f $(OUTDIR)/fs2\#0624f8
	rm -r $(OUTDIR)/loader.system\#ff2000

# Target that builds all the chunks at once as a single output; this
# eases sharing definitions across chunks.
$(OUTDIR)/complete.built: $(OUTDIR)/complete.o src/asm.cfg
	ld65 $(LDFLAGS) -o $@ $<

$(OUTDIR)/complete.o: src/complete.s src/chunk2.s src/chunk3.s src/chunk4.s src/chunk5.s $(HEADERS)
	ca65 $(CAFLAGS) --listing $(basename $@).list -o $@ $<

# Targets for individual "chunks", sliced out of the single output.
# These are used for validating the chunks and creating a binary.
$(OUTDIR)/1_4000-5fff: res/loading_panel.bin
	cp $< $@
$(OUTDIR)/2_f600-fbff: $(OUTDIR)/complete.built
	dd status=none if=$< of=$@ bs=1 skip=0 count=1536
$(OUTDIR)/3_d300-f3ff: $(OUTDIR)/complete.built
	dd status=none if=$< of=$@ bs=1 skip=1536 count=8448
$(OUTDIR)/4_0200-25ff: $(OUTDIR)/complete.built
	dd status=none if=$< of=$@ bs=1 skip=9984 count=9216
$(OUTDIR)/5_6000-b3df: $(OUTDIR)/complete.built
	dd status=none if=$< of=$@ bs=1 skip=19200 count=21472

# "Phony" target that verifies that built chunks exactly match the
# original chunks of the @qkumba's ProDOS port.
validate: $(CHUNKS)
	@diff -q orig/1_4000-5fff $(OUTDIR)/1_4000-5fff > /dev/null || ( echo "Chunk 1 mismatch" && false )
	@diff -q orig/2_f600-fbff $(OUTDIR)/2_f600-fbff > /dev/null || ( echo "Chunk 2 mismatch" && false )
	@diff -q orig/3_d300-f3ff $(OUTDIR)/3_d300-f3ff > /dev/null || ( echo "Chunk 3 mismatch" && false )
	@diff -q orig/4_0200-25ff $(OUTDIR)/4_0200-25ff > /dev/null || ( echo "Chunk 4 mismatch" && false )
	@diff -q orig/5_6000-b3df $(OUTDIR)/5_6000-b3df > /dev/null || ( echo "Chunk 5 mismatch" && false )

# Target that creates a FS2 binary using @qkumba's ProRWTS2, with
# custom code for loading FS2 chunks.
binary: $(OUTDIR)/fs2\#0624f8 $(OUTDIR)/loader.system\#ff2000

$(OUTDIR)/fs2\#0624f8: $(CHUNKS) loader/PRORWTS2.S
	cd $(OUTDIR) && ../loader/pack.py
	cd $(OUTDIR) && acme --color --report prorwts2.list ../loader/PRORWTS2.S
	cd $(OUTDIR) && ../loader/movebytes.py
	@echo Successfully created: $@

$(OUTDIR)/loader.system\#ff2000: $(OUTDIR)/loader.system.o
	ld65 $(LDFLAGS) -o $@ $<

$(OUTDIR)/loader.system.o: loader/loader.system.s
	ca65 $(CAFLAGS) --listing $(basename $@).list -o $@ $<
