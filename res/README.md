

* `loading_panel.bin` - an 8k high-res bitmap loaded at $4000 and displayed while the rest of the program loads. The top half has "LOADING... VERSION 2.0". The bottom half is the aircraft instrument panel bitmap shown throughout the simulation. This is later copied to $2000 to allow page-flipping during simulation.

* `c4_hires.bin` - a copy of the first 1536 bytes of the instrument panel graphic, present at the end of chunk4. However, the first byte is $80 instead of $00.
