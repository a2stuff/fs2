#!/usr/bin/env python3
import sys

i = open("prorwts2#0624f8", "rb")
data = i.read();
i.close()

outdata = data[:0x1B08] + data[-0x2008:-8] + data[0x1B08:-0x2008] + data[-8:]

o = open("fs2#0624f8", "wb")
o.write(outdata)
o.flush()
o.close()

