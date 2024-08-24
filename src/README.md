
The loader in @qkumba's version of FS2 loads and decompresses several
chunks of data/code into memory before jumping into the FS2 code.

The chunks are:

* Chunk 1: $4000-$5fff - from `../res/loading_panel.bin`
* Chunk 2: $f600-$fbff - `chunk2.s`
* Chunk 3: $d300-$f3ff - `chunk3.s`
* Chunk 4: $0200-$25ff - `chunk4.s`
* Chunk 5: $6000-$b3df - `chunk5.s`
