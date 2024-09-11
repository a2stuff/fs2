#!/usr/bin/env python3
import sys
import subprocess

def pack(name):
  i = open(name,"rb")
  filedata = i.read()
  i.close
  outdata = filedata[::-1]
  o = open(name+".rev","wb")
  o.write(outdata)
  o.flush()
  o.close()
  subprocess.call(["apultra",name+".rev",name+".rev.pak"])
  i = open(name+".rev.pak","rb")
  filedata = i.read()
  i.close()
  outdata = filedata[::-1]
  o = open(name+".rev.pak.rev","wb")
  o.write(outdata)
  o.flush()
  o.close()

pack("1_4000-5fff")
pack("2_f600-fbff")
pack("3_d300-f3ff")
pack("4_0200-25ff")
pack("5_6000-b3df")
