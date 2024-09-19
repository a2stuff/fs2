Disassembly and analysis of SubLOGIC's Flight Simulator II (FS2) for the Apple II platform, circa 1984.

Work in progress. The effort is just getting started.

# Disassembly

The target is @qkumba's ProDOS port of FS2, which has a custom loader which decompressess chunks of code/data into memory. The project primarily focuses on understanding those chunks, which represent the memory-resident code of the original FS2.

The [cc65](http://cc65.github.io/cc65/) tool chain is used; source files target the ca65 macro assembler; `ca65` and `ld65` must be available. Build via `make` and use `make validate` to verify that the built chunks (`out/?_????-????`) are byte-identical to the original chunks (`orig/?_????-????`).

PRs welcome. Comments are strongly encouraged. Macro use for common patterns is also encouraged, where it helps understanding the original code.

# Loader

The source for @qkumba's ProDOS loader is included. To build the binary, use `make binary`. The output will be `out/fs2#062499`. This requires the following addtional tools to be available on the command line.

* `apultra` - https://github.com/emmanuel-marty/apultra (compression)
* `acme` - https://sourceforge.net/projects/acme-crossass/ (cross-assembler)

Note that the binary on its own is insufficient to actually run FS2; an adjacent file representing a full image of the 140k FS2 disk is required, which includes the dynamically loaded scenery database. This file (and more) are present on the `orig/flight simulator 2 with scenery PRODOS (san inc pack).po`. If you do build the binary, you can transfer it to a copy of that disk image and `BRUN` it.

Additionally, a `out/loader.system#ff2000` file will also be produced. This can be transferred to a disk as a SYS file and executed to load/run the `FS2` binary.
