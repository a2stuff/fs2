
The loader in @qkumba's version of FS2 loads and decompresses several
chunks of data/code into memory before jumping into the FS2 code.

The chunks are:

* Chunk 1: $4000-$5fff - from `../res/loading_panel.bin`
* Chunk 2: $f600-$fbff - `chunk2.s`
* Chunk 3: $d300-$f3ff - `chunk3.s`
* Chunk 4: $0200-$25ff - `chunk4.s`
* Chunk 5: $6000-$b3df - `chunk5.s`

## Memory Map

```
       Main
$FFFF +-------------+
      | chunk2      |
      |.............|
$F000 | chunk3      |
      |             |
      |             |  Bank2
$E000 |             | +-------------+
      |             | | ???         |
      |             | |             |
$D000 +-------------+ +-------------+


$C000 +-------------+
      | ???         |
      |.............|
$B000 | chunk5      |
      |             |
      |             |
$A000 |             |
      |             |
      |             |
$9000 |             |
      |             |
      |             |
$8000 |             |
      |             |
      |             |
$7000 |             |
      |             |
      |             |
$6000 +-------------+
      |.HiRes.Pg.2..|
      |.............|
$5000 |.............|
      |.............|
$4000 +-------------+
      |.HiRes.Pg.1..|
      |.............|
$3000 |.............|
      |.............|
      |.............|
$2000 +-------------+
      | chunk4      |
      |             |
$1000 |             | $400-$7FF - I/O screen holes ($X7X and $XFX)
      |             | $3Fx - interrupt vectors
$0200 +-------------+
      |.Stack.......|
$0100 +-------------+
      | Zero Page   |
$0000 +-------------+
```
