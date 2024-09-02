Disassembly and analysis of SubLOGIC's Flight Simulator II (FS2) for the Apple II platform, circa 1984.

Work in progress. The effort is just getting started.

The target is @qkumba's ProDOS port of FS2, which has a custom loader which decompressess chunks of code/data into memory. Currently the project builds those chunks; eventually the project will include the loader and compressor.

The [cc65](http://cc65.github.io/cc65/) tool chain is used; source files target the ca65 macro assembler; `ca65` and `ld65` must be available. Build via `make` and use `make validate` to verify that the built chunks (`out/chunk*.built`) are byte-identical to the original chunks (`chunks/*`).

PRs welcome. Comments are strongly encouraged. Macro use for common patterns is also encouraged, where it helps understanding the original code.
