#!/usr/bin/env python3
import sys

i = open("fs2#062499", "rb")
data = i.read();
i.close()

outdata = data[:0x1B67] + data[-0x2008:-0x8] + data[0x1B67:-0x2008] + data[-8:]

o = open("fs2#062499", "wb")
o.write(outdata)
o.flush()
o.close()

